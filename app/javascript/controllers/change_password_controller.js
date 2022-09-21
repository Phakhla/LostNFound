/* eslint-disable no-unused-vars */
import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="change-password"
export default class extends Controller {
  static targets = ['currentpassword', 'password', 'confirmpassword'];

  connect() { }

  validateForm(e) {
    const $currentpassword = $('#current-password');
    const $currentpasswordError = $('#current-password-error');
    const $password = $('#password');
    const $passwordError = $('#password-error');
    const $confirmpassword = $('#password-confirmation');
    const $confirmpasswordError = $('#password-confirmation-error');

    if (this.currentpasswordTarget.value === '') {
      $currentpassword.addClass('form-invalid');
      $currentpasswordError.removeClass('d-none');
      e.preventDefault();
    }

    if (this.passwordTarget.value === '') {
      $password.addClass('form-invalid');
      $passwordError.removeClass('d-none');
      e.preventDefault();
    }

    if (this.confirmpasswordTarget.value === '') {
      $confirmpassword.addClass('form-invalid');
      $confirmpasswordError.removeClass('d-none');
      e.preventDefault();
    }
  }

  checkCurrentPassword() {
    const $currentpassword = $('#current-password');
    const $currentpasswordError = $('#current-password-error');
    if (this.currentpasswordTarget.value !== '') {
      $currentpassword.removeClass('form-invalid');
      $currentpasswordError.addClass('d-none');
    } else {
      $currentpassword.addClass('form-invalid');
      $currentpasswordError.removeClass('d-none');
    }
  }

  checkPassword() {
    const $password = $('#password');
    const $passwordError = $('#password-error');
    if (this.passwordTarget.value !== '') {
      $password.removeClass('form-invalid');
      $passwordError.addClass('d-none');
    } else {
      $password.addClass('form-invalid');
      $passwordError.removeClass('d-none');
    }
  }

  checkConfimPassword() {
    const $confirmpassword = $('#password-confirmation');
    const $confirmpasswordError = $('#password-confirmation-error');
    if (this.confirmpasswordTarget.value !== '') {
      $confirmpassword.removeClass('form-invalid');
      $confirmpasswordError.addClass('d-none');
    } else {
      $confirmpassword.addClass('form-invalid');
      $confirmpasswordError.removeClass('d-none');
    }
  }
}
