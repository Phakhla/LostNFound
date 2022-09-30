import { Controller } from '@hotwired/stimulus';
import dayjs from 'dayjs';

export default class extends Controller {
  static targets = [
    'lostCheckbox', 'foundCheckbox', 'searchInput', 'typeSelect',
    'latitude', 'longitude', 'place', 'address', 'startDate', 'endDate',
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

    if (!this.dateStartValid()) {
      const $startField = $('#start_date');
      const $startError = $('#date-start-error');
      $startField.addClass('form-invalid');
      $startError.removeClass('d-none');
      e.preventDefault();
    }

    if (!this.dateEndValid()) {
      const $endField = $('#end_date');
      const $endError = $('#date-end-error');
      $endField.addClass('form-invalid');
      $endError.removeClass('d-none');
      e.preventDefault();
    }

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
    this.lostCheckboxTarget.checked = true;
    $('#check-box-search-lost-category').addClass('checked-category');
    this.foundCheckboxTarget.checked = false;
    $('#check-box-search-found-category').removeClass('checked-category');
    $('#end_date').attr('min', '');
    $('#start_date').attr('max', dayjs(Date.today).format('YYYY-MM-DD'));
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

  checkDateFunction(currentSelectedDate, inputDateId, errorMessageId) {
    const $selectedDate = dayjs(currentSelectedDate);
    const $datePresent = dayjs(Date.today);
    const $selectedDateDiff = $selectedDate.diff($datePresent, 'day', true);
    const $inputField = $(inputDateId);
    const $inputError = $(errorMessageId);
    if ($selectedDateDiff < 0 || currentSelectedDate === '') {
      $inputField.removeClass('form-invalid');
      $inputError.addClass('d-none');
    } else {
      $inputField.addClass('form-invalid');
      $inputError.removeClass('d-none');
    }
  }

  checkDateStart() {
    this.checkDateFunction(this.startDateTarget.value, '#start_date', '#date-start-error');
  }

  checkDateEnd() {
    this.checkDateFunction(this.endDateTarget.value, '#end_date', '#date-end-error');
  }

  dateStartValid() {
    const $dateStart = dayjs(this.startDateTarget.value);
    const $datePresent = dayjs(Date.today);
    const $dateStartDiff = $dateStart.diff($datePresent, 'day', true);
    return (
      $dateStartDiff < 0 || this.startDateTarget.value === ''
    );
  }

  dateEndValid() {
    const $dateEnd = dayjs(this.endDateTarget.value);
    const $datePresent = dayjs(Date.today);
    const $dateEndDiff = $dateEnd.diff($datePresent, 'day', true);
    return (
      $dateEndDiff < 0 || this.endDateTarget.value === ''
    );
  }

  dateStartSelected() {
    const $dateStart = dayjs(this.startDateTarget.value).format('YYYY-MM-DD');
    $('#end_date').attr('min', $dateStart);
  }

  dateEndSelected() {
    const $dateEnd = dayjs(this.endDateTarget.value).format('YYYY-MM-DD');
    const $datePresent = dayjs(Date.today).format('YYYY-MM-DD');

    if ($('#end_date').val() === '') {
      $('#start_date').attr('max', $datePresent);
    } else {
      $('#start_date').attr('max', $dateEnd);
    }
  }
}
