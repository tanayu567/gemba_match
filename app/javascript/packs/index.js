import 'babel-polyfill'
import Vue from 'vue'

import LikeButton from '../components/Like/LikeButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#like',
    components: { LikeButton }
  })
})