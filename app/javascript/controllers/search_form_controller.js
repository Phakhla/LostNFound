import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['lostCheckbox', 'foundCheckbox', 'searchInput', 'typeSelect'];

  connect() { }

  validateForm(e) {
    const $categoriesAlert = $('#categoriesAlert');
    const $nameAndTypeAlert = $('#nameAndTypeAlert');

    if (!(this.lostCheckboxTarget.checked || this.foundCheckboxTarget.checked)) {
      $categoriesAlert.removeClass('d-none');
      e.preventDefault();
    }
    if (this.searchInputTarget.value === '' && this.typeSelectTarget.value === '') {
      $nameAndTypeAlert.removeClass('d-none');
      e.preventDefault();
    }
  }
}
