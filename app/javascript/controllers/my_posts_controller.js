import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="my-posts"
export default class extends Controller {
  static targets = ['notFoundCheckbox', 'foundCheckbox', 'statusInput'];

  connect() { }

  checkboxChange(e) {
    const form = document.getElementById('homeFilter');
    const statusInput = this.statusInputTarget;

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
