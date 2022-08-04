import { Controller } from '@hotwired/stimulus';
import { Modal } from 'bootstrap';
import dayjs from 'dayjs';
import 'dayjs/locale/th';

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
    'type',
    'typeInput',
  ];

  static values = { format: String };

  get latLng() {
    return {
      lat: +this.latitudeTarget.value,
      lng: +this.longitudeTarget.value,
    };
  }

  get format() {
    if (this.formatValue === '') {
      return 'DD MMMM YYYY';
    }
    return this.formatValue;
  }

  connect() {}

  preview() {
    if (!this.valid()) {
      $('#secondaryButton').trigger('click');
      return;
    }

    const category = this.categoryInputTarget.value;
    const date = dayjs(this.dateInputTarget.value).locale('th').format(this.format);

    this.categoryTarget.innerHTML = this.displayCategory(category);
    this.todayTarget.innerHTML = dayjs().locale('th').format(this.format);
    this.nameTarget.innerHTML = this.nameInputTarget.value;
    this.dateTarget.innerHTML = this.displayDate(category, date);
    this.detailTarget.innerHTML = this.detailInputTarget.value;
    this.typeTarget.innerHTML = this.displayType();

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
      const $item = this.buildCarouselItem(elem, index);
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
      lost_item: `${date}`,
      found_item: `${date}`,
    }[category];
  }

  displayType() {
    return $(this.typeInputTarget).find(':selected').text();
  }

  buildCarouselItem(img, index) {
    return $('<div class="gallery-item"></div>').append(
      [
        $(`<input type="radio" id="img-${index}" checked name="gallery" class="gallery-selector"/>`),
        $(`<img class="gallery-img" src='${$(img).attr('src')}'/>`),
        $(`<label for="img-${index}" class="gallery-thumb"><img src='${$(img).attr('src')}'/></label>`),
      ],
    ).append([$('<a class="prev" data-action="click->post-preview#slideLeft"><i class="fa-regular fa-chevron-left"></i></a>'),
      $('<a class="next" data-action="click->post-preview#slideRight"><i class="fa-regular fa-chevron-right"></i></a>')]);
  }

  buildIndicator(idx) {
    return $('<button type="button"></button>').attr({
      'data-bs-target': '#postImageIndicators',
      'data-bs-slide-to': idx,
    });
  }

  slideLeft() {
    document.getElementById('imgPreview').scrollBy({
      top: 0,
      left: -180,
      behavior: 'smooth',
    });
  }

  slideRight() {
    document.getElementById('imgPreview').scrollBy({
      top: 0,
      left: +180,
      behavior: 'smooth',
    });
  }
}
