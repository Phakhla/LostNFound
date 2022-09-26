import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="my-posts"
export default class extends Controller {
  static targets = ['activeCheckbox', 'inActiveCheckbox', 'statusInput'];

  connect() {
    this.scrollToContent();
  }

  checkboxChange(e) {
    const form = document.getElementById('homeFilter');
    const statusInput = this.statusInputTarget;

    const checkbox = e.currentTarget;

    if (checkbox.checked) {
      statusInput.value = checkbox.value;
    } else {
      statusInput.value = '';
    }

    if (statusInput.value === 'active') {
      this.activeCheckboxTarget.checked = true;
      this.inActiveCheckboxTarget.checked = false;
    } else if (statusInput.value === 'in_active') {
      this.activeCheckboxTarget.checked = false;
      this.inActiveCheckboxTarget.checked = true;
    }

    form.submit();
  }

  scrollToContent() {
    $(() => {
      $('#active-checkbox, #in-active-checkbox').on('click', () => {
        sessionStorage.scrollPosition = $(window).scrollTop();
      });
      $('#button-all-post-lost_item, #button-all-post-found_item').on('click', () => {
        if (window.screen.availWidth <= 576) {
          sessionStorage.scrollPosition = 660;
        } else {
          sessionStorage.scrollPosition = 620;
        }
      });
      $('#button-search, #tabs-home-index, #nav-lost-posts-path-link, #nav-found-posts-path-link').on('click', () => {
        if (window.screen.availWidth <= 576) {
          sessionStorage.scrollPosition = 660;
        } else {
          sessionStorage.scrollPosition = 620;
        }
      });
      $(window).scrollTop(sessionStorage.scrollPosition);
      sessionStorage.clear();
    });
  }
}
