import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() { }

  copyToClipboard() {
    navigator.clipboard.writeText(window.location.href);
  }
}
