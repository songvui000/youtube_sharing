// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
import HeaderController from "./header_controller"
import PostController from "./post_controller"
application.register("header", HeaderController)
application.register("post", PostController)