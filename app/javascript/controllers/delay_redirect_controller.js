import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  link() {
    // back to detail page after click download 3 seconds
    setTimeout(() => {
      document.getElementById('cancel-create-poster-button').click();
    }, 3000);
  }
}
