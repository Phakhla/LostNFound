import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['detail'];

  connect() {
    const $detail = $('#detail');
    $detail.removeClass('is-invalid');
  }

  checkLength() {
    const $limit = 500;
    const $detail = $('#detail');
    const $button = $('button[type=submit]');
    if (this.detailTarget.value.length > $limit) {
      $detail.addClass('is-invalid');
      $button.prop('disabled', true);
    } else {
      $detail.removeClass('is-invalid');
      $button.prop('disabled', false);
    }
  }
}
