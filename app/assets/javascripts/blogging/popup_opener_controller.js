import { Controller } from '@hotwired/stimulus'

export class PopupOpenerController extends Controller {
  static values = { shareUrl: String }

  open(event) {
    event.preventDefault()

    const url = window.location.href
    window.open(
      this.shareUrlValue + encodeURI(url),
      '_system',
      'location=no,width=600,height=400'
    )
  }
}
