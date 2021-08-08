<template>
  <div>
    <div v-if="isLiked" @click="deleteLike()">
      いいねを取り消す {{ count }}
    </div>
    <div v-else @click="registerLike()">
      いいねする {{ count }}
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()
export default {
  props: ['userId', 'spotId'],
  data() {
    return {
      likeList: []
    }
  },
  computed: {
     count() {
      return this.likeList.length
    },
  isLiked() {
      if (this.likeList.length === 0) { return false }
      return Boolean(this.findLikeId())
    }  
  },
  methods: {
    registerLike: async function() {
      const res = await axios.post(`/api/spots/${this.spotId}/likes`)
      if (res.status !== 201) { process.exit() }
    },
    deleteLike: async function() {
      const likeId = this.findLikeId()
      const res = await axios.delete(`/api/spots/:spot_id/likes/${likeId}`)
      if (res.status !== 200) { process.exit() }
      this.likeList = this.likeList.filter(n => n.id !== likeId)
    },
    findLikeId: function() {
      const like = this.likeList.find((like) => {
        return (like.user_id === this.userId)
      })
      if (like) { return like.id }
    }
  }
}
</script>