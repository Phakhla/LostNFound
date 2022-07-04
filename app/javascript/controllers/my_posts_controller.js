import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="my-posts"
export default class extends Controller {
  static targets = ['activeCheckbox', 'inActiveCheckbox', 'statusInput'];

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

    if (statusInput.value === 'active') {
      this.activeCheckboxTarget.checked = true;
      this.inActiveCheckboxTarget.checked = false;
    } else if (statusInput.value === 'in_active') {
      this.activeCheckboxTarget.checked = false;
      this.inActiveCheckboxTarget.checked = true;
    }

    form.submit();
  }
}
