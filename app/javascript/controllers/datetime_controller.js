import { Controller } from '@hotwired/stimulus';
import dayjs from 'dayjs';
import 'dayjs/locale/th';

export default class extends Controller {
  static targets = ['datetimeConvert'];

  static values = { date: String };

  connect() {
    this.datetimeConvertTarget.innerHTML = dayjs(this.dateValue).locale('th').format('DD MMMM YYYY | HH:mm');
  }
}
