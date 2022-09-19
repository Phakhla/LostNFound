import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'foundRadioButton',
    'hopelessRadioButton',
    'hiddenRadioButton',
    'textInput',
    'reasonInput',
    'statusInput',
    'submit',
    'otherRadioButton'];

  connect() { }

  checkOption() {
    if (this.foundRadioButtonTarget.checked) {
      this.reasonInputTarget.value = this.foundRadioButtonTarget.value;
      this.statusInputTarget.value = 'found';
      this.submitTarget.disabled = false;
    } else if (this.hopelessRadioButtonTarget.checked) {
      this.reasonInputTarget.value = this.hopelessRadioButtonTarget.value;
      this.statusInputTarget.value = 'closed';
      this.submitTarget.disabled = false;
    } else if (this.otherRadioButtonTarget.checked) {
      this.statusInputTarget.value = 'closed';
      this.submitTarget.disabled = false;
    }
  }

  checkSubmit(e) {
    if (this.otherRadioButtonTarget.checked && this.textInputTarget.value === '') {
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

  checkReset() {
    const $button = $('button[type=submit]');
    const $textInput = $('#SelectionAlert');
    $textInput.removeClass('is-invalid');
    $button.prop('disabled', true);
  }
}
