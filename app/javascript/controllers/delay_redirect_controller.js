import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  link() {
    // back to detail page after click download 3 seconds
    setTimeout(() => {
      document.getElementById('secondaryButton').click();
    }, 3000);
  }
}
