import { Controller } from "@hotwired/stimulus"
import { fetchAPI } from "../utils"

export default class extends Controller {
  static targets = [ 'entries', 'pagination']


  scroll () {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")

    if (next_page == null) {return}

    let url = next_page.href

    let body = document.body, html = document.documentElement

    let height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    if (window.pageYOffset >= height - window.innerHeight) {
      this.loadMore(url)      
    }
  }

  loadMore (url) {
    fetchAPI(url)
      .then(response => {
        this.entriesTarget.insertAdjacentHTML('beforeend', response.entries)
        this.paginationTarget.innerHTML = response.pagination
      })
  }
}
