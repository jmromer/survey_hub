import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['notice', 'alert']

  dismissAlert() {
    this.alertTarget.hidden = true
  }

  dismissNotice() {
    this.noticeTarget.hidden = true
  }
}
