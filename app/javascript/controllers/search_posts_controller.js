import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['address', 'field', 'map', 'latitude', 'longitude', 'mapDisplay'];

  connect() {
    if (typeof (google) !== 'undefined') {
      this.initializeMap();
    }
  }

  initializeMap() {
    this.setMap();
    this.setMarker();
    this.setAutocomplete();
  }

  setMap() {
    if (this.map === undefined) {
      this.map = new google.maps.Map(this.mapTarget, {
        center: new google.maps.LatLng(
          this.latitudeTarget.value,
          this.longitudeTarget.value,
        ),
        zoom: 17,
      });

      this.map.addListener('click', (mapsMouseEvent) => {
        this.setMarker().setPosition(mapsMouseEvent.latLng);
        this.setMarker().setVisible(true);

        this.setAddress(mapsMouseEvent.latLng);
        this.latitudeTarget.value = mapsMouseEvent.latLng.lat();
        this.longitudeTarget.value = mapsMouseEvent.latLng.lng();
      });

      this.setCurrentPositionBtn();

      this.locationButton.addEventListener('click', () => {
        this.disableCurrentPositionBtn(true);

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              const location = {
                lat: position.coords.latitude,
                lng: position.coords.longitude,
              };

              this.setMap().setZoom(17);
              this.setMap().setCenter(location);
              this.setMarker().setPosition(location);

              this.setAddress(location);
              this.latitudeTarget.value = location.lat;
              this.longitudeTarget.value = location.lng;

              this.disableCurrentPositionBtn(false);
            },
            () => {
              this.handleLocationError(true);
            },
          );
        } else {
          // Browser doesn't support Geolocation
          this.handleLocationError(false);
        }
      });
    }
    return this.map;
  }

  setMarker() {
    if (this.marker === undefined) {
      this.marker = new google.maps.Marker({
        map: this.setMap(),
        anchorPoint: new google.maps.Point(0, 0),
      });
      const mapLocation = {
        lat: parseFloat(this.latitudeTarget.value),
        lng: parseFloat(this.longitudeTarget.value),
      };
      this.marker.setPosition(mapLocation);
      this.marker.setVisible(true);
    }

    return this.marker;
  }

  setAutocomplete() {
    if (this.autocomplete === undefined) {
      this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
      this.autocomplete.bindTo('bounds', this.setMap());
      this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name']);
      this.autocomplete.addListener('place_changed', this.locationChanged.bind(this));
    }
    return this.autocomplete;
  }

  locationChanged() {
    const place = this.setAutocomplete().getPlace();

    if (!place.geometry) {
      window.alert(`No details available for input: '${place.name}'`);
      return;
    }

    this.setMap().fitBounds(place.geometry.viewport);
    this.setMap().setCenter(place.geometry.location);
    this.setMarker().setPosition(place.geometry.location);
    this.setMarker().setVisible(true);

    this.addressTarget.innerHTML = place.name;
    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
  }

  setAddress(latLng) {
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ latLng }, (result, status) => {
      if (status === 'OK') {
        this.addressTarget.innerHTML = result[0].formatted_address;
      } else {
        this.addressTarget.innerHTML = '';
      }
    });
  }

  setContentMap() {
    if (this.mapDisplayTarget.style.display === 'none') {
      this.mapDisplayTarget.style.display = 'block';
    } else {
      this.resetMap();
    }
  }

  resetMap() {
    this.mapDisplayTarget.style.display = 'none';
    this.addressTarget.innerHTML = '';
    this.fieldTarget.value = '';
    this.latitudeTarget.value = '';
    this.longitudeTarget.value = '';
    this.map = undefined;
    this.marker = undefined;
    this.autocomplete = undefined;
    this.initializeMap();
  }

  setCurrentPositionBtn() {
    this.locationButton = document.createElement('button');
    this.locationButton.innerHTML = 'ตำแหน่งปัจจุบัน';
    this.locationButton.setAttribute('type', 'button');
    this.locationButton.setAttribute('data-action', 'click->search-posts#preventSubmit');
    this.map.controls[google.maps.ControlPosition.TOP_CENTER].push(this.locationButton);
  }

  disableCurrentPositionBtn(isDisable) {
    if (isDisable) {
      this.locationButton.setAttribute('disabled', '');
      this.locationButton.innerHTML = '<i class="fas fa-spinner fa-pulse"></i> Loading';
    } else {
      this.locationButton.removeAttribute('disabled');
      this.locationButton.innerHTML = 'ตำแหน่งปัจจุบัน';
    }
  }

  preventSubmit(e) {
    if (e.key === 'Enter') { e.preventDefault(); }
  }

  handleLocationError(browserHasGeolocation) {
    this.disableCurrentPositionBtn(false);

    if (browserHasGeolocation) {
      window.alert('Error: The Geolocation service failed.');
    } else {
      window.alert("Error: Your browser doesn't support geolocation.");
    }
  }
}
