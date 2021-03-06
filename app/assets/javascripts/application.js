// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "./channels/index"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.$ = jQuery
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import "./controllers/index"

import '@fortawesome/fontawesome-free/scss/fontawesome.scss'
import '@fortawesome/fontawesome-free/scss/regular.scss'
import '@fortawesome/fontawesome-free/scss/solid.scss'
import '@fortawesome/fontawesome-free/scss/brands.scss'

import 'simplebar'
import 'simplebar/dist/simplebar.min.css'

// Import custom JS
import './tooltip'

// Import SCSS
import '../stylesheets/application'

window.addEventListener('load', () => {
  autosize(document.querySelectorAll('textarea.mp-textarea-autosize'))
})

document.addEventListener('turbolinks:load', () => {
  autosize(document.querySelectorAll('textarea.mp-textarea-autosize'))
})