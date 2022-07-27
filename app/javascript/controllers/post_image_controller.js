import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['image'];

  connect() { }

  removeImage(e) {
    this.imageTarget.remove();
    e.preventDefault();
  }

  slideLeft() {
    document.getElementById('gallery-scroll').scrollBy({
      top: 0,
      left: -180,
      behavior: 'smooth',
    });
  }

  slideRight() {
    document.getElementById('gallery-scroll').scrollBy({
      top: 0,
      left: +180,
      behavior: 'smooth',
    });
  }
}
