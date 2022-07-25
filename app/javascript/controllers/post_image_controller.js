import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['image'];

  connect() {}

  removeImage(e) {
    this.imageTarget.remove();
    e.preventDefault();
  }
}
