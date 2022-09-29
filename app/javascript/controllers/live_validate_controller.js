import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'name',
    'date',
    'detail',
    'types',
    'place',
    'images',
    'username',
    'email',
    'password',
    'address',
    'latitude',
    'longitude'];

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
    const $detailText = $('#form-detail-warning-text');

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
    const $imgText = $('#form-image-warning-text');
    $images.removeClass('form-invalid');
    $imgText.addClass('d-none');
  }

  checkUsername() {
    const $username = $('#signup-username-input');
    const $usernameerror = $('#signup-username-error');
    if (this.usernameTarget !== '') {
      $username.removeClass('is-invalid');
      $usernameerror.addClass('d-none');
    }
  }

  checkEmail() {
    const $email = $('#signup-email-input');
    const $emailerror = $('#signup-email-error');
    if (this.emailTarget !== '') {
      $email.removeClass('is-invalid');
      $emailerror.addClass('d-none');
    }
  }

  checkPassword() {
    const $password = $('#password');
    const $passworderror = $('#signup-password-error');
    if (this.passwordTarget !== '') {
      $password.removeClass('is-invalid');
      $passworderror.addClass('d-none');
    }
  }

  checkLocationField() {
    if (this.placeTarget.value === '') {
      this.latitudeTarget.value = '';
      this.longitudeTarget.value = '';
      this.addressTarget.value = '';
    }
  }

  checkCountImages() {
    const dzImages = $('.dz-preview .dz-image img').length;
    const editImages = $('.edit-upload .edit-image img').length;
    const totalImages = dzImages + editImages;
    if (totalImages <= 11) {
      const $images = $('#dropzone-container');
      const $imgText = $('#form-image-over-limit-warning-text');
      $images.removeClass('form-invalid');
      $imgText.addClass('d-none');
    }
  }
}
