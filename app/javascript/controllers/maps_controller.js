import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['address', 'field', 'map', 'latitude', 'longitude'];

  initialize() {
    this.initialLocation = { lat: 18.804668, lng: 98.955033 };
  }

  connect() {
    if (typeof (google) !== 'undefined') {
      this.initializeMap();
    }
  }

  initializeMap() {
    this.setAutocomplete();

    if (this.hasMapTarget) {
      this.setMap();
    }

    if (this.latitudeTarget.value && this.longitudeTarget.value) {
      this.setMarker({
        lat: +this.latitudeTarget.value,
        lng: +this.longitudeTarget.value,
      });
    }
  }

  setMap() {
    if (this.map !== undefined) { return this.map; }

    this.map = new google.maps.Map(this.mapTarget, {
      center: this.initialLocation,
      zoom: 17,
    });

    this.map.addListener('click', (mapsMouseEvent) => {
      this.setMarker(mapsMouseEvent.latLng);
      this.setAddress(mapsMouseEvent.latLng);
      this.latitudeTarget.value = mapsMouseEvent.latLng.lat();
      this.longitudeTarget.value = mapsMouseEvent.latLng.lng();
    });

    const controlDiv = document.createElement('div');

    const locationButton = document.createElement('button');
    locationButton.style.backgroundColor = '#fff';
    locationButton.style.border = 'none';
    locationButton.style.outline = 'none';
    locationButton.style.width = '28px';
    locationButton.style.height = '28px';
    locationButton.style.borderRadius = '2px';
    locationButton.style.boxShadow = '0 1px 4px rgba(0,0,0,0.3)';
    locationButton.style.cursor = 'pointer';
    locationButton.style.marginRight = '10px';
    locationButton.style.padding = '0px';
    locationButton.title = 'Your Location';
    controlDiv.appendChild(locationButton);
    locationButton.setAttribute('type', 'button');
    locationButton.setAttribute('data-action', 'click->maps#preventSubmit');

    const locationIcon = document.createElement('div');
    locationIcon.style.margin = '5px';
    locationIcon.style.width = '18px';
    locationIcon.style.height = '18px';
    locationIcon.style.backgroundImage = 'url(https://maps.gstatic.com/tactile/mylocation/mylocation-sprite-1x.png)';
    locationIcon.style.backgroundSize = '180px 18px';
    locationIcon.style.backgroundPosition = '0px 0px';
    locationIcon.style.backgroundRepeat = 'no-repeat';
    locationIcon.id = 'you_location_img';
    locationButton.appendChild(locationIcon);

    google.maps.event.addListener(this.map, 'dragend', () => {
      $('#you_location_img').css('background-position', '0px 0px');
    });

    locationButton.addEventListener('click', () => {
      let imgX = '0';
      const animationInterval = setInterval(() => {
        if (imgX === '-18') imgX = '0';
        else imgX = '-18';
        $('#you_location_img').css('background-position', `${imgX}px 0px`);
      }, 500);
      // Browser doesn't support Geolocation
      if (!navigator.geolocation) {
        return this.handleLocationError(false);
      }

      // Try HTML5 geolocation.
      return navigator.geolocation.getCurrentPosition(
        (position) => {
          const location = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };

          clearInterval(animationInterval);
          $('#you_location_img').css('background-position', '-144px 0px');

          this.setMap().setCenter(location);
          this.setMarker(location);

          this.setAddress(location);
          this.latitudeTarget.value = location.lat;
          this.longitudeTarget.value = location.lng;
        },
        () => {
          this.handleLocationError(true);
        },
      );
    });

    controlDiv.index = 1;
    this.map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(controlDiv);

    return this.map;
  }

  setMarker(mapLocation) {
    if (this.marker === undefined) {
      this.marker = new google.maps.Marker({
        map: this.setMap(),
        anchorPoint: new google.maps.Point(0, 0),
      });
    }

    this.marker.setPosition(mapLocation);
    this.marker.setVisible(true);

    return this.marker;
  }

  setAutocomplete() {
    if (this.autocomplete === undefined) {
      this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
      this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name']);
      this.autocomplete.addListener('place_changed', this.locationChanged.bind(this));

      if (this.hasMapTarget) {
        this.autocomplete.bindTo('bounds', this.setMap());
      }
    }
    return this.autocomplete;
  }

  locationChanged() {
    const place = this.setAutocomplete().getPlace();

    if (!place.geometry) {
      return;
    }

    this.addressTarget.value = place.name;

    if (this.hasMapTarget) {
      this.setMap().fitBounds(place.geometry.viewport);
      this.setMap().setCenter(place.geometry.location);
      this.setMarker(place.geometry.location);

      this.latitudeTarget.value = place.geometry.location.lat();
      this.longitudeTarget.value = place.geometry.location.lng();
    }
  }

  setAddress(latLng) {
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ latLng }, (result, status) => {
      if (status === 'OK') {
        this.addressTarget.value = result[0].formatted_address;
      } else {
        this.addressTarget.value = 'Unknown location';
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
