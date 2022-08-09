import { Controller } from '@hotwired/stimulus';
import Dropzone from 'dropzone';

export default class extends Controller {
  static targets = ['image'];

  connect() { }

  removeImage(e) {
    this.imageTarget.remove();
    e.preventDefault();
    const $dropZone = Dropzone.forElement('#dropzone');
    $dropZone.options.maxFiles = +$dropZone.options.maxFiles + 1;
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
