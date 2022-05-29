import { Controller } from "@hotwired/stimulus"
import _ from "lodash"

export default class extends Controller {
  static targets = [ "email", "password", "emailModal", "passwordModal", "loginForm", "registerForm" ]
  connect() {
    // this.element.textContent = "Hello World!"
  }

  openModal() {
    _.map(this.emailModalTargets, target => target.value = this.emailTarget.value)
    _.map(this.passwordModalTargets, target => target.value = this.passwordTarget.value)
  }
}
