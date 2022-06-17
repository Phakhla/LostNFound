import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="my-posts"
export default class extends Controller {
  static targets = ['notFoundCheckbox', 'foundCheckbox'];

  connect() { }

  checkboxChange(e) {
    const form = document.getElementById('filter-status');
    const statusInput = document.getElementById('status');

    const checkbox = e.currentTarget;

    if (checkbox.checked) {
      statusInput.value = checkbox.value;
    } else {
      statusInput.value = '';
    }

    if (statusInput.value === 'no_found') {
      this.notFoundCheckboxTarget.checked = true;
      this.foundCheckboxTarget.checked = false;
    } else if (statusInput.value === 'found') {
      this.notFoundCheckboxTarget.checked = false;
      this.foundCheckboxTarget.checked = true;
    }

    form.submit();
  }
}
