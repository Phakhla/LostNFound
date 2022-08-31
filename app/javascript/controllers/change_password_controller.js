/* eslint-disable no-unused-vars */
import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="change-password"
export default class extends Controller {
  static targets = ['password'];

  connect() { }

  validateForm(e) {
    const $currentpassword = $('#current-password');
    const $currentpasswordError = $('#current-password-error');
    const $password = $('#password');
    const $passwordError = $('#password-error');
    const $passwordconfirmation = $('#password-confirmation');
    const $passwordconfirmationError = $('#password-confirmation-error');

    if (this.passwordTarget.value === '') {
      $currentpassword.addClass('form-invalid');
      $currentpasswordError.removeClass('d-none');
      $password.addClass('form-invalid');
      $passwordError.removeClass('d-none');
      $passwordconfirmation.addClass('form-invalid');
      $passwordconfirmationError.removeClass('d-none');
      e.preventDefault();
    }
  }

  checkCurrentPassword() {
    const $currentpassword = $('#current-password');
    const $currentpasswordError = $('#current-password-error');
    if (this.passwordTarget.value !== '') {
      $currentpassword.removeClass('form-invalid');
      $currentpasswordError.addClass('d-none');
    } else {
      $currentpassword.addClass('form-invalid');
      $currentpasswordError.removelass('d-none');
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
      $passwordError.removelass('d-none');
    }
  }

  checkPasswordConfirmation() {
    const $passwordconfirmation = $('#password-confirmation');
    const $passwordconfirmationError = $('#password-confirmation-error');
    if (this.passwordTarget.value !== '') {
      $passwordconfirmation.removeClass('form-invalid');
      $passwordconfirmationError.addClass('d-none');
    } else {
      $passwordconfirmation.addClass('form-invalid');
      $passwordconfirmationError.removelass('d-none');
    }
  }
}
