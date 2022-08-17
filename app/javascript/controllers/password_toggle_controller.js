import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['password', 'eye'];

  static state = false;

  password() {
    if (this.state) {
      this.passwordTarget.setAttribute('type', 'password');
      this.eyeTarget.classList.remove('fa-eye-slash');
      this.eyeTarget.classList.add('fa-eye');
      this.state = false;
    } else {
      this.passwordTarget.setAttribute('type', 'text');
      this.eyeTarget.classList.remove('fa-eye');
      this.eyeTarget.classList.add('fa-eye-slash');
      this.state = true;
    }
  }
}
