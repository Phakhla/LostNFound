import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="show-map"
export default class extends Controller {
  static targets = ['address', 'map', 'latitude', 'longitude', 'fieldPreview'];

  get latLng() {
    return {
      lat: +this.latitudeTarget.value,
      lng: +this.longitudeTarget.value,
    };
  }

  connect() {
    if (typeof (google) !== 'undefined') {
      this.showMap();
    }
  }

  setDetailMap() {
    if (this.map !== undefined) {
      return this.map;
    }

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

    google.maps.event.addListener(this.marker, 'click', () => {
      window.open(`https://maps.google.com/?q=${this.latitudeTarget.value},${this.longitudeTarget.value}`);
    });

    return this.marker;
  }

  setLocation() {
    $(this.fieldPreviewTarget).html(`${this.addressTarget.value}`);
  }

  setContentMarker() {
    const mapContent = $('#content-result-search').find('.content-result-search');
    const iconBase = 'https://lost-n-found-production.s3.ap-southeast-1.amazonaws.com/';
    const markerStyleByType = {
      lostItem: {
        icon: {
          url: `${iconBase}Lost-Marker.png`,
          labelOrigin: new google.maps.Point(10, 35),
          scaledSize: new google.maps.Size(40, 40),
        },
        color: '#d66d00',
      },
      foundItem: {
        icon: {
          url: `${iconBase}Found-Marker.png`,
          labelOrigin: new google.maps.Point(10, 35),
          scaledSize: new google.maps.Size(40, 40),
        },
        color: '#188038',
      },
    };
    const mapPositions = [];
    mapContent.each(function () {
      const dataMap = $(this).data('item-detail');
      mapPositions.push(
        {
          icon: markerStyleByType[dataMap.category].icon,
          label: {
            text: dataMap.title,
            fontFamily: 'Prompt',
            fontSize: '20px',
            fontWeight: '500',
            color: markerStyleByType[dataMap.category].color,
            className: 'mapLabels',
          },
          lat: dataMap.lat,
          lng: dataMap.lng,
          path: dataMap.path,
        },
      );
    });

    // Create markers.
    for (let i = 0; i < mapPositions.length; i += 1) {
      this.marker = new google.maps.Marker({
        position: new google.maps.LatLng(mapPositions[i].lat, mapPositions[i].lng),
        icon: mapPositions[i].icon,
        map: this.setDetailMap(),
        label: mapPositions[i].label,
      });

      google.maps.event.addListener(this.marker, 'click', () => {
        window.open(window.location.origin + mapPositions[i].path);
      });
    }
  }

  showMap() {
    this.setDetailMap();
    this.setDetailMarker();
    this.setLocation();
    this.setContentMarker();
  }
}
