import '../stylesheets/application';
import 'bootstrap';
import '@fortawesome/fontawesome-free/js/all';

import 'babel-polyfill'
import Vue from 'vue'
import Vuex from 'vuex'
import App from '../app.vue'
import store from './store.js'

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require popper
//= require bootstrap-sprockets

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "src/profile_image_upload"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

Vue.use(Vuex)

Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    store: store,
    render: (h) => h(App)
  })
})
