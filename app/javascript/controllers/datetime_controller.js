import { Controller } from '@hotwired/stimulus';
import dayjs from 'dayjs';
import 'dayjs/locale/th';

export default class extends Controller {
  static targets = ['output'];

  static values = { date: String, format: String };

  get format() {
    if (this.formatValue === '') {
      return 'DD MMMM YYYY | HH:mm';
    }
    return this.formatValue;
  }

  connect() {
    this.outputTarget.innerHTML = dayjs(this.dateValue).locale('th').format(this.format);
  }
}
