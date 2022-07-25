import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static state = false;

  password() {
    if (this.state) {
      document.getElementById('password').setAttribute('type', 'password');
      document.getElementById('eye').classList.remove('fa-eye-slash');
      document.getElementById('eye').classList.add('fa-eye');
      this.state = false;
    } else {
      document.getElementById('password').setAttribute('type', 'text');
      document.getElementById('eye').classList.remove('fa-eye');
      document.getElementById('eye').classList.add('fa-eye-slash');
      this.state = true;
    }
  }
}
