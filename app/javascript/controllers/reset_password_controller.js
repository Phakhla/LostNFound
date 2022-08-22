import { Controller } from '@hotwired/stimulus';
import { Modal } from 'bootstrap';

export default class extends Controller {
  static targets = ['modal', 'password'];

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
