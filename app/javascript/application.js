// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import * as Routes from './routes';

import "./controllers"
import * as bootstrap from "bootstrap"
import 'lite-youtube-embed'
import _ from 'lodash'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
