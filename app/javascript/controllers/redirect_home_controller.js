import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="redirect-home"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      $('#Successful_Update').remove();
    }, 3000);
    setTimeout(() => {
      $('#Password_Successful_Update').remove();
    }, 3000);
  }
}
