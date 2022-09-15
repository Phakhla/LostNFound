import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [
    'lostCheckbox', 'foundCheckbox', 'searchInput', 'typeSelect',
    'latitude', 'longitude', 'place', 'address',
  ];

  connect() { this.addCheckboxColor(); }

  validateForm(e) {
    const $categoriesAlert = $('#categoriesAlert');
    const $nameAndTypeAlert = $('#nameAndTypeAlert');
    const $nameErrorAndTypeAlert = $('#name-advance-search');
    const $nameError = $('#name-error');
    const $mapAlert = $('#mapAlert');
    const $categoryErrorAndTypeAlert = $('#category-advance-search');
    const $categoryError = $('#category-error');
    const $locationErrorAndTypeAlert = $('#location-advance-search');
    const $locationError = $('#location-error');

    if (!(this.lostCheckboxTarget.checked || this.foundCheckboxTarget.checked)) {
      $categoriesAlert.removeClass('d-none');
      e.preventDefault();
    }

    if (this.searchInputTarget.value === '' && this.typeSelectTarget.value === '') {
      $categoryErrorAndTypeAlert.addClass('is-invalid');
      $nameErrorAndTypeAlert.addClass('form-invalid');
      $nameAndTypeAlert.removeClass('d-none');
      $nameError.removeClass('d-none');
      $categoryError.removeClass('d-none');
      e.preventDefault();
    }

    if (this.placeTarget.value === '') {
      $locationErrorAndTypeAlert.addClass('form-invalid');
      $locationError.removeClass('d-none');
      e.preventDefault();
    }

    if (!this.latitudeTarget.value || !this.longitudeTarget.value) {
      $mapAlert.removeClass('d-none');
      e.preventDefault();
    }
  }

  clearForm() {
    $('#name-advance-search').val('');
    $('#category-advance-search').val('');
    $('#start_date').val('');
    $('#end_date').val('');
    $('#location-advance-search').val('');
  }

  addCheckboxColor() {
    const checkBoxLost = $('#check-box-search-lost-category');
    const lostTarget = this.lostCheckboxTarget;
    const checkBoxFound = $('#check-box-search-found-category');
    const foundTarget = this.foundCheckboxTarget;

    if (lostTarget.checked) {
      checkBoxLost.addClass('checked-category');
    } else {
      checkBoxLost.removeClass('checked-category');
    }

    if (foundTarget.checked) {
      checkBoxFound.addClass('checked-category');
    } else {
      checkBoxFound.removeClass('checked-category');
    }
  }

  checkSearchorType() {
    const $nameErrorAndTypeAlert = $('#name-advance-search');
    const $nameError = $('#name-error');
    const $categoryErrorAndTypeAlert = $('#category-advance-search');
    const $categoryError = $('#category-error');
    if (this.typeSelectTarget.value !== '' || this.searchInputTarget.value !== '') {
      $categoryErrorAndTypeAlert.removeClass('is-invalid');
      $categoryError.addClass('d-none');
      $nameErrorAndTypeAlert.removeClass('form-invalid');
      $nameError.addClass('d-none');
    }
  }

  checkLocation() {
    const $locationErrorAndTypeAlert = $('#location-advance-search');
    const $locationError = $('#location-error');
    if (this.placeTarget.value !== '') {
      $locationErrorAndTypeAlert.removeClass('form-invalid');
      $locationError.addClass('d-none');
    }
  }

  checkMarker() {
    const $locationErrorAndTypeAlert = $('#location-advance-search');
    const $locationError = $('#location-error');
    $locationErrorAndTypeAlert.removeClass('form-invalid');
    $locationError.addClass('d-none');
  }

  checkReset() {
    const $nameErrorAndTypeAlert = $('#name-advance-search');
    const $nameError = $('#name-error');
    const $categoryErrorAndTypeAlert = $('#category-advance-search');
    const $categoryError = $('#category-error');
    const $locationErrorAndTypeAlert = $('#location-advance-search');
    const $locationError = $('#location-error');
    $nameErrorAndTypeAlert.removeClass('form-invalid');
    $nameError.addClass('d-none');
    $categoryErrorAndTypeAlert.removeClass('is-invalid');
    $categoryError.addClass('d-none');
    $locationErrorAndTypeAlert.removeClass('form-invalid');
    $locationError.addClass('d-none');
  }

  checkLocationField() {
    if (this.placeTarget.value === '') {
      this.latitudeTarget.value = '';
      this.longitudeTarget.value = '';
      this.addressTarget.value = '';
    }
  }
}
