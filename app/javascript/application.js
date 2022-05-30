// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import "./controllers"
import * as bootstrap from "bootstrap"
import 'lite-youtube-embed'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }