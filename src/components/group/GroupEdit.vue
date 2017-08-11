<template>
      <v-container fluid v-if="authenticated">
        <v-slide-y-transition mode="out-in">
          <v-layout align-center justify-center>
            <v-flex xs10>  
            <v-layout row wrap>
            <!--<h5>Sign Up </h5> -->
            </v-layout>             
              <v-container >
                  <v-layout row wrap>
                    <v-flex xs12 sm6>
                      <v-text-field
                        name="fname"
                        label="Group Name"
                        prepend-icon="group"
                        required
                        v-model = 'groupEditForm.name'
                      ></v-text-field>
                    </v-flex>            
                    <v-switch v-bind:label="`Active: ${groupEditForm.active.toString()}`" v-model="groupEditForm.active"></v-switch>
                  </v-layout>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn class="primary white--text" large @click.native="groupPut">
                          <span>Save</span>
                          <v-icon dark right large>check_circle</v-icon>
                        </v-btn>   
                        </v-card-actions>   
                  </v-container>
                </v-flex>
            </v-layout>  
        </v-slide-y-transition>
      </v-container>
</template>

<script>
import axios from 'axios';

  export default {
    name: "register",
    props: ['auth', 'authenticated'],    
    data () {
      return {
        token: localStorage.getItem('id_token'),
        groupEditForm: {"id":Math.floor(Math.random() * 200),"name":"","description":"","active":true,"timestamp":"AAAAAAAAB9I="},
        item: "",
      }
    },
    methods: {
      groupPut() {
        axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token'),
        axios.put('http://localhost:51306/api/groups/'+this.groupEditForm.id, this.groupEditForm)
        .then(function (response) {
          console.log(response.status);
          alert(JSON.stringify(response.status));
        })
        .catch(function (error) {
          console.log(error);
          alert(JSON.stringify(error.response.status));

        });
      }
    },
    mounted() {
      axios.get('http://localhost:51306/api/groups/'+this.$route.params.id)
      .then(response => {
          this.groupEditForm = response.data
        }
      )
    }
  }
 
</script>

<style lang="stylus">
  @import './../../stylus/main'
</style>
