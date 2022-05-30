import { Controller } from "@hotwired/stimulus"
import _ from "lodash"
import { post_vote_down_path, post_vote_up_path } from "../routes"
import { fetchAPI } from '../utils'

const icons = {
  thumbUp: 'bi-hand-thumbs-up',
  thumbUpFill: 'bi-hand-thumbs-up-fill',
  thumbDown: 'bi-hand-thumbs-down',
  thumbDownFill: 'bi-hand-thumbs-down-fill',
}

export default class extends Controller {
  static targets = ['thumbUp', 'thumbDown', 'iframe', 'cachedVotesUp', 'cachedVotesDown' ]
  static values = { id: Number }

  connect() {  }

  votedUp() {
    fetchAPI(post_vote_up_path(this.idValue), { method: 'post', redirect: 'follow'})
      .then(response => {
          this.thumbUpTarget.children[0].classList.replace(icons.thumbUp, icons.thumbUpFill)
          this.thumbDownTarget.children[0].classList.replace(icons.thumbDownFill, icons.thumbDown)
          this.cachedVotesUpTarget.textContent = response.data.attributes.cachedVotesUp
          this.cachedVotesDownTarget.textContent = response.data.attributes.cachedVotesDown
        })
  }
  votedDown() {
    fetchAPI(post_vote_down_path(this.idValue), { method: 'post', redirect: 'follow'})
      .then(response => {
        this.thumbDownTarget.children[0].classList.replace(icons.thumbDown, icons.thumbDownFill)
        this.thumbUpTarget.children[0].classList.replace(icons.thumbUpFill, icons.thumbUp)
        this.cachedVotesUpTarget.textContent = response.data.attributes.cachedVotesUp
        this.cachedVotesDownTarget.textContent = response.data.attributes.cachedVotesDown
      })
  }
}
