import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'image'];

  connect() { }

  previewImage() {
    const input = this.inputTarget;
    const image = this.imageTarget;
    if (!input.files || !input.files[0]) {
      return;
    }
    const reader = new FileReader();
    reader.onload = (e) => {
      $(image)
        .attr('src', e.target.result)
        .width(310)
        .height(310);
    };
    reader.readAsDataURL(input.files[0]);
  }
}
