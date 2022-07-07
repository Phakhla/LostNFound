import 'bootstrap';
import $ from 'jquery';

import './controllers';
import '@hotwired/turbo-rails';
import * as ActiveStorage from '@rails/activestorage';

ActiveStorage.start();
window.$ = $;

window.dispatchMapsEvent = function dispatchMapsEvent(...args) {
  const event = new CustomEvent('google-maps-callback');
  event.args = args;
  window.dispatchEvent(event);
};
