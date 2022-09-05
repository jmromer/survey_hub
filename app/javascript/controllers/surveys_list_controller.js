import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  show({ target }) {
    window.location.href = target.closest('tr').dataset.url;;
  }
}
