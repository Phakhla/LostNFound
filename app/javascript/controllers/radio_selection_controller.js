import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['foundRadioButton', 'hopelessRadioButton', 'hiddenRadioButton', 'textInput', 'reasonInput', 'statusInput'];

  connect() { }

  checkOption(e) {
    if (this.foundRadioButtonTarget.checked) {
      this.reasonInputTarget.value = this.foundRadioButtonTarget.value;
      this.statusInputTarget.value = 'found';
    } else if (this.hopelessRadioButtonTarget.checked) {
      this.reasonInputTarget.value = this.hopelessRadioButtonTarget.value;
      this.statusInputTarget.value = 'closed';
    } else if (this.textInputTarget.value) {
      this.reasonInputTarget.value = this.textInputTarget.value;
      this.statusInputTarget.value = 'closed';
    } else {
      $('#SelectionAlert').addClass('is-invalid');
      e.preventDefault();
    }
  }

  checkOther() {
    const $textInput = $('#SelectionAlert');
    if (this.textInputTarget.value !== '') {
      $textInput.removeClass('is-invalid');
    }
  }
}
