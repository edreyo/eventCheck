<template>
  <div><span>heyhey</span></div>
</template>

<script>
import Axios from 'axios';

  export default {
    name:"product-list",
    data () {
      return {
        clipped: false,
        drawer: true,
        fixed: false,
        items: [
          { icon: 'bubble_chart', title: 'Inspire' },
          { icon: 'bubble_chart', title: 'Inspire' },
          { icon: 'bubble_chart', title: 'Inspire' },
        ],
        miniVariant: false,
        right: true,
        rightDrawer: false,
        title: 'Sign Up',
        registrationForm: {"phone":"","email":"","fname":"","lname":"","kid":false,"active":true,"familyId":"","timestamp":"AAAAAAAAB9I=", "password":""}
      }
    },
    methods: {
      register() {
         //Axios.get('http://localhost:65473/api/Individuals/1234567890');
//       Axios.post('/api/Individuals', 'JobsController@store')
         Axios.post('http://localhost:65473/api/Individuals/', this.registrationForm)
         .then(function (response) {
            console.log(response.status);
            alert(JSON.stringify(response.status));
          })
          .catch(function (error) {
            console.log(error);
            alert(JSON.stringify(error.response.status));

          });
      }
    }
  }
 
</script>

<style lang="stylus">
  @import './../../stylus/main'
</style>
