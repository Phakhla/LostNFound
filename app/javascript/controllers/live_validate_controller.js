import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['name', 'date', 'detail', 'types', 'place', 'images'];

  connect() {
    this.checkDetail();
  }

  checkName() {
    const $name = $('#post-name-input');
    if (this.nameTarget !== '') {
      $name.removeClass('is-invalid');
    }
  }

  checkTypes() {
    const $types = $('#post-types-input');
    if (this.typesTarget !== '') {
      $types.removeClass('is-invalid');
    }
  }

  checkDate() {
    const $date = $('#post-date-input');
    const $datetext = $('#form-date-warning-text');
    if (this.dateTarget !== '') {
      $date.removeClass('is-invalid');
      $datetext.addClass('d-none');
    }
  }

  checkDetail() {
    const $limit = 500;
    const $detail = $('#post-detail-input');
    const $detailText = $('#form-image-warning-text');

    if (this.detailTarget.value.length > $limit) {
      $detail.addClass('is-invalid');
      $detailText.removeClass('d-none');
    } else {
      $detail.removeClass('is-invalid');
      $detailText.addClass('d-none');
    }
  }

  checkPlace() {
    const $place = $('#form-place-input');
    const $placetext = $('#form-place-warning-text');
    if (this.placeTarget !== '') {
      $place.removeClass('form-invalid');
      $placetext.addClass('d-none');
    }
  }

  checkImages() {
    const $images = $('#dropzone-container');
    const $imgtext = $('#form-image-warning-text');
    $images.removeClass('form-invalid');
    $imgtext.addClass('d-none');
  }
}
