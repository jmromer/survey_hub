import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["entry"]

  show(event) {
    const surveyPath = this.entryTarget.dataset.url;
    Turbo.visit(surveyPath);
  }
}
