import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'lostCheckbox', 'foundCheckbox', 'searchInput', 'typeSelect',
    'latitude', 'longitude',
  ];

  connect() { }

  validateForm(e) {
    const $categoriesAlert = $('#categoriesAlert');
    const $nameAndTypeAlert = $('#nameAndTypeAlert');
    const $mapAlert = $('#mapAlert');

    $categoriesAlert.addClass('d-none');
    $nameAndTypeAlert.addClass('d-none');
    $mapAlert.addClass('d-none');

    if (!(this.lostCheckboxTarget.checked || this.foundCheckboxTarget.checked)) {
      $categoriesAlert.removeClass('d-none');
      e.preventDefault();
    }

    if (this.searchInputTarget.value === '' && this.typeSelectTarget.value === '') {
      $nameAndTypeAlert.removeClass('d-none');
      e.preventDefault();
    }

    if (!this.latitudeTarget.value || !this.longitudeTarget.value) {
      $mapAlert.removeClass('d-none');
      e.preventDefault();
    }
  }
}
