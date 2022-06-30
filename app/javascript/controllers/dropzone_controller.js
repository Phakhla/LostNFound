import { Controller } from '@hotwired/stimulus';
import Dropzone from 'dropzone';
import DirectUploadController from '../lib/direct_upload_controller';
import {
  getMetaValue,
  removeElement,
} from '../helpers';

function createDirectUploadController(source, file) {
  return new DirectUploadController(source, file);
}

function createDropZone(controller) {
  return new Dropzone(controller.element, {
    url: controller.url,
    headers: controller.headers,
    maxFiles: controller.maxFiles,
    maxFilesize: controller.maxFileSize,
    acceptedFiles: controller.acceptedFiles,
    addRemoveLinks: controller.addRemoveLinks,
    autoQueue: false,
  });
}

export default class extends Controller {
  static targets = ['input'];

  connect() {
    this.dropZone = createDropZone(this);
    this.hideFileInput();
    this.bindEvents();
    Dropzone.autoDiscover = false;
  }

  // Private
  hideFileInput() {
    this.inputTarget.disabled = true;
    this.inputTarget.style.display = 'none';
  }

  bindEvents() {
    this.dropZone.on('addedfile', (file) => {
      setTimeout(() => {
        file.accepted && createDirectUploadController(this, file).start();
      }, 500);
    });

    this.dropZone.on('removedfile', (file) => {
      file.controller && removeElement(file.controller.hiddenInput);
    });

    this.dropZone.on('canceled', (file) => {
      file.controller && file.controller.xhr.abort();
    });
  }

  get headers() {
    return { 'X-CSRF-Token': getMetaValue('csrf-token') };
  }

  get url() {
    return this.inputTarget.getAttribute('data-direct-upload-url');
  }

  get maxFiles() {
    return this.data.get('maxFiles') || 1;
  }

  get maxFileSize() {
    return this.data.get('maxFileSize') || 256;
  }

  get acceptedFiles() {
    return this.data.get('acceptedFiles');
  }

  get addRemoveLinks() {
    return this.data.get('addRemoveLinks') || true;
  }
}
