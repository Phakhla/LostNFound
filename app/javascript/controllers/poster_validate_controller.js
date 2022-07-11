import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['name', 'date', 'location'];

  connect() {}

  validateForm(e) {
    const $alertName = $('#alertname');
    const $alertDate = $('#alertdate');
    const $alertLo = $('#alertlo');

    $alertName.addClass('d-none');
    $alertDate.addClass('d-none');
    $alertLo.addClass('d-none');

    if (this.nameTarget.value === '') {
      $alertName.removeClass('d-none');
      e.preventDefault();
    }

    if (this.dateTarget.value === '') {
      $alertDate.removeClass('d-none');
      e.preventDefault();
    }

    if (this.locationTarget.value === '') {
      $alertLo.removeClass('d-none');
      e.preventDefault();
    }
    this.nameTarget.scrollIntoView({ block: 'center' });
  }
}
