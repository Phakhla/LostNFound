import '@hotwired/turbo-rails';
import 'bootstrap';

import '@fortawesome/fontawesome-free/js/all';

import './controllers';

FontAwesome.config.mutateApproach = 'sync';

window.dispatchMapsEvent = function dispatchMapsEvent(...args) {
  const event = new CustomEvent('google-maps-callback');
  event.args = args;
  window.dispatchEvent(event);
};
