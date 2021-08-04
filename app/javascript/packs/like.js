import Vue from 'vue/dist/vue.esm.js'

import LikeButton from './components/Like/LikeButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#like',
    components: { LikeButton }
  })
})