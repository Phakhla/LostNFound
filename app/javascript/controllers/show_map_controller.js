import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="show-map"
export default class extends Controller {
  static targets = ['address', 'map', 'latitude', 'longitude'];

  get latLng() {
    return { lat: +this.latitudeTarget.value, lng: +this.longitudeTarget.value };
  }

  connect() {
    if (typeof (google) !== 'undefined') {
      this.showMap();
    }
  }

  setDetailMap() {
    if (this.map !== undefined) { return this.map; }

    this.map = new google.maps.Map(this.mapTarget, {
      center: this.latLng,
      zoom: 17,
    });
    return this.map;
  }

  setDetailMarker() {
    if (this.marker === undefined) {
      this.marker = new google.maps.Marker({
        map: this.setDetailMap(),
        anchorPoint: new google.maps.Point(0, 0),
      });
    }

    this.marker.setPosition(this.latLng);
    this.marker.setVisible(true);

    return this.marker;
  }

  showMap() {
    $(this.fieldPreviewTarget).html(`สถานที่เจอ ${this.addressTarget.value}`);

    this.setDetailMap();
    this.setDetailMarker();
  }
}
