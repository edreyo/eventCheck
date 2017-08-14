import Vue from 'vue'
import router from './router'
import App from './App.vue'
import Vuetify from 'vuetify'
import { CLOUDINARY_CONFIG } from './cloudinary/cloudinary-variables.js'

Vue.use(Vuetify, CLOUDINARY_CONFIG)

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
