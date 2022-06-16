import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['address', 'field', 'map', 'latitude', 'longitude'];

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

      const locationButton = document.createElement('button');
      locationButton.textContent = 'Current Location';
      locationButton.setAttribute('type', 'button');
      locationButton.setAttribute('data-action', 'click->maps#preventSubmit');
      this.map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
      locationButton.addEventListener('click', () => {
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              const location = {
                lat: position.coords.latitude,
                lng: position.coords.longitude,
              };

              this.setMap().setCenter(location);
              this.setMarker().setPosition(location);

              this.setAddress(location);
              this.latitudeTarget.value = location.lat;
              this.longitudeTarget.value = location.lng;
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

    this.addressTarget.value = place.name;
    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
  }

  setAddress(latLng) {
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ latLng }, (result, status) => {
      if (status === 'OK') {
        this.addressTarget.value = result[0].formatted_address;
      } else {
        this.addressTarget.value = '';
      }
    });
  }

  preventSubmit(e) {
    if (e.key === 'Enter') { e.preventDefault(); }
  }

  handleLocationError(browserHasGeolocation) {
    if (browserHasGeolocation) {
      window.alert('Error: The Geolocation service failed.');
    } else {
      window.alert("Error: Your browser doesn't support geolocation.");
    }
  }
}
