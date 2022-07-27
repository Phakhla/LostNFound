import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['name', 'date', 'types', 'place', 'images'];

  connect() {}

  checkName() {
    const $name = $('#name');
    if (this.nameTarget !== '') {
      $name.removeClass('is-invalid');
    }
  }

  checkTypes() {
    const $types = $('#types');
    if (this.typesTarget !== '') {
      $types.removeClass('is-invalid');
    }
  }

  checkDate() {
    const $date = $('#date');
    const $datetext = $('#datetext');
    if (this.dateTarget !== '') {
      $date.removeClass('is-invalid');
      $datetext.addClass('d-none');
    }
  }

  checkPlace() {
    const $place = $('#place');
    const $placetext = $('#placetext');
    if (this.placeTarget !== '') {
      $place.removeClass('form-invalid');
      $placetext.addClass('d-none');
    }
  }

  checkImages() {
    const $images = $('#dropzone-container');
    const $imgtext = $('#imgtext');
    $images.removeClass('form-invalid');
    $imgtext.addClass('d-none');
  }
}
