<template>
<div>
  <span>hi</span>
  <router-view></router-view>
</div>
</template>
<script>
import Axios from 'axios';
import App1 from './App.1.vue';
import VueRouter from 'vue-router';

  export default {
    name:'app2',
    data () {
      return {
      }
    },
  }
 
</script>

<style lang="stylus">
  @import './stylus/main'
</style>
