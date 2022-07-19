import { Controller } from '@hotwired/stimulus';
import { Modal } from 'bootstrap';
import dayjs from 'dayjs';

export default class extends Controller {
  static targets = [
    'category',
    'categoryInput',
    'today',
    'name',
    'nameInput',
    'date',
    'dateInput',
    'location',
    'detail',
    'detailInput',
    'map',
    'latitude',
    'longitude',
    'address',
    'fieldPreview',
    'form',
  ];

  get latLng() {
    return {
      lat: +this.latitudeTarget.value,
      lng: +this.longitudeTarget.value,
    };
  }

  connect() {}

  preview() {
    if (!this.valid()) {
      this.formTarget.submit();
      return;
    }

    const category = this.categoryInputTarget.value;
    const date = dayjs(this.dateInputTarget.value).format('DD/MM/YYYY');

    this.categoryTarget.innerHTML = this.displayCategory(category);
    this.todayTarget.innerHTML = dayjs().format('DD/MM/YYYY');
    this.nameTarget.innerHTML = this.nameInputTarget.value;
    this.dateTarget.innerHTML = this.displayDate(category, date);
    this.detailTarget.innerHTML = this.detailInputTarget.value;

    this.prepareImages();
    this.prepareMap();
    this.openModal();
  }

  prepareImages() {
    const $imgs = $('.dz-preview .dz-image img');
    const $imgContainer = $('#imgPreview');
    const $indicatorContainer = $('#imgIndicator');

    $imgContainer.html('');
    $indicatorContainer.html('');

    if ($imgs.length === 0) {
      return;
    }

    $imgs.each((index, elem) => {
      const $item = this.buildCarouselItem(elem);
      const $indicator = this.buildIndicator(index);

      if (index === 0) {
        $item.addClass('active');
        $indicator.addClass('active');
      }

      $imgContainer.append($item);
      $indicatorContainer.append($indicator);
    });
  }

  prepareMap() {
    $(this.fieldPreviewTarget).html(`สถานที่เจอ ${this.addressTarget.value}`);

    this.setMap();
    this.setMarker();
  }

  openModal() {
    const modal = new Modal(document.getElementById('preview_modal'));
    modal.show();
  }

  valid() {
    return (
      this.nameInputTarget.value
      && this.dateInputTarget.value
      && $('.dz-preview .dz-image img').length
      && this.latitudeTarget.value
      && this.longitudeTarget.value
    );
  }

  setMap() {
    if (this.map !== undefined) {
      return this.map;
    }

    this.map = new google.maps.Map(this.mapTarget, {
      center: this.latLng,
      zoom: 17,
    });

    return this.map;
  }

  setMarker() {
    if (this.marker === undefined) {
      this.marker = new google.maps.Marker({
        map: this.setMap(),
        anchorPoint: new google.maps.Point(0, 0),
      });
    }

    this.marker.setPosition(this.latLng);
    this.marker.setVisible(true);

    return this.marker;
  }

  displayCategory(category) {
    return {
      lost_item: 'ตามหาของหาย',
      found_item: 'ตามหาเจ้าของ',
    }[category];
  }

  displayDate(category, date) {
    return {
      lost_item: `วันที่หาย: ${date}`,
      found_item: `วันที่เจอ: ${date}`,
    }[category];
  }

  buildCarouselItem(img) {
    return $('<div class="carousel-item"></div>').append(
      $(`<img class="d-block w-100" src='${$(img).attr('src')}'/>`),
    );
  }

  buildIndicator(idx) {
    return $('<button type="button"></button>').attr({
      'data-bs-target': '#postImageIndicators',
      'data-bs-slide-to': idx,
    });
  }
}
