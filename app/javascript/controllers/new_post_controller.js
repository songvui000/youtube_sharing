import { Controller } from "@hotwired/stimulus"
import _ from "lodash"
import { posts_path, root_path } from "../routes"
import { fetchAPI } from "../utils"
export default class extends Controller {
  static targets = ['youTubeURL', 'errors' ]

  connect() {  }

  submit() {
    fetchAPI(posts_path(), {
      method: 'post',
      headers: {
        'Content-Type': 'application/json'
        // 'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: JSON.stringify({
        youtube_url: this.youTubeURLTarget.value
      })
    })
    .then(res => {
      if (res.status == 200) {
        window.location.href = root_path()
      } else {
        this.errorsTarget.textContent = res.errors
      }
    })
  }
}
