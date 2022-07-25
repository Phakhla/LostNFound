import { Controller } from '@hotwired/stimulus';
import { Modal } from 'bootstrap';

// Connects to data-controller="forgot-password"
export default class extends Controller {
  static targets = ['modal'];

  connect() {
    if (this.hasModalTarget) {
      this.openModal();
    }
  }

  openModal() {
    const modal = new Modal(this.modalTarget);
    modal.show();
  }
}
