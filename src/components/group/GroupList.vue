<template>
      <v-container fluid>
        <v-slide-y-transition mode="out-in">
          <v-layout align-center justify-center>
            <v-flex xs10>
            <v-card> 
              <v-layout row wrap>
              <!--<h5>Sign Up </h5> -->
              </v-layout>             
              <v-container >
                    <v-list>
                      <v-subheader v-text="eventTitle"></v-subheader>
                      <v-template v-for="item in items" v-bind:key="item.title">
                        <v-list-tile avatar>
                          <v-list-tile-avatar class="hidden-sm-and-down">
                            <img v-bind:src="item.avatar"/>
                          </v-list-tile-avatar>
                          <!--<v-list-tile-action>
                            <v-icon v-if="item.icon" class="pink--text">star</v-icon>
                          </v-list-tile-action> -->
                          <v-list-tile-content>
                            <v-list-tile-title v-text="item.title"></v-list-tile-title>
                          </v-list-tile-content>
                          <div class="hidden-sm-and-down">
                            <v-list-tile-action>
                                <v-dialog v-model="item.dialog" persistent>
                                  <!--<v-switch  v-model="item.study" slot="activator"></v-switch>-->
                                  <!--<v-btn primary dark slot="activator">Open Dialog</v-btn>-->
                                  <v-card>
                                    <v-card-title class="headline">Study?</v-card-title>
                                    <!--<v-card-text>Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.</v-card-text>-->
                                    <v-card-actions>
                                      <v-spacer></v-spacer>
                                      <v-btn icon class="indigo--text" flat="flat" @click.native="check(item)"><v-icon>thumb_up</v-icon></v-btn>
                                      <v-btn icon class="gray--text darken-1" flat="flat" @click.native="item.dialog = false"><v-icon>thumb_down</v-icon></v-btn>
                                    </v-card-actions>
                                  </v-card>
                                </v-dialog>
                                <!--<v-switch sm6 v-model="ex11"></v-switch>-->
                            </v-list-tile-action>
                            <v-list-tile-action>
                              <v-btn icon ripple @click.native='item.dialog = true'>
                                <v-icon class="pink--text text--lighten-1">archive</v-icon>
                              </v-btn>
                            </v-list-tile-action>
                          </div>
                          <v-list-tile-action>
                            <v-btn icon ripple>
                              <v-icon class="blue--text text--lighten-1">info</v-icon>
                            </v-btn>
                          </v-list-tile-action>                          
                          <!--<v-list-tile-action>
                              <v-switch sm6 v-model="ex11"></v-switch>
                          </v-list-tile-action> -->
                        </v-list-tile>
                        <v-divider inset></v-divider>                                                                      
                      </v-template>
                    </v-list>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                    
                        <v-btn class="primary white--text" large @click.native="groupPost">
                          <span>Save</span>
                          <v-icon dark right large>check_circle</v-icon>
                        </v-btn>   
                        </v-card-actions>   
                  </v-container>
                  </v-card> 
                </v-flex>
            </v-layout>  
        </v-slide-y-transition>
      </v-container>
</template>

<script>
import axios from 'axios';

  export default {
    name: "register",
    data () {
      return {
        dialog: false,
        eventTitle: "Here is Everybody",
        ex11: true,
        ex12: false,
        items: []
      }
    },
    mounted() {
      this.fetchData()
    },
    methods: {
      fetchData() {
        axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token'),      
        axios.get("http://localhost:51306/api/groupsIndividuals/109")//, {
        //axios.get("http://localhost:51306/api/myGroups/")//, {
          //params:{
          // phone:"10"
          //  }
        //})
        .then(response => {
            response.data = response.data.filter(function(item) {
            item["dialog"] = false;
            //item["attendance"] = false;
              return item;
            });
          this.items = response.data;
        }
        );
      },
      check(item) {
        item.dialog = false
        //alert(JSON.stringify(item));
        this.rosterPost(item);
      },
      rosterPost(item) {
         axios.post('http://localhost:51306/api/attendances/', item)
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
