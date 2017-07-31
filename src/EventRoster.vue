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
                      <v-template v-for="item in items" v-bind:key="item.phone">
                        <v-list-tile avatar >
                          <v-list-tile-avatar>
                            <img v-bind:src="item.avatar"/>
                          </v-list-tile-avatar>
                          <!--<v-list-tile-action>
                            <v-icon v-if="item.icon" class="pink--text">star</v-icon>
                          </v-list-tile-action> -->
                          <v-list-tile-content>
                            <v-list-tile-title v-text="displayName(item)"></v-list-tile-title>
                          </v-list-tile-content>
                          <v-list-tile-action>
                              <v-dialog v-model="item.dialog" width="600px">
                                <v-switch  v-model="item.attendance" slot="activator"></v-switch>
                                <!--<v-btn primary dark slot="activator">Open Dialog</v-btn>-->
                                <v-card  >
                                  <v-card-title class="headline">{{question.title}}</v-card-title>
                                  <!--<v-card-text>Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.</v-card-text>-->
                                  <v-card-actions>
                                    <v-btn  v-for="choice in questionsChoices" v-bind:key="choice.id" 
                                     v-if="choice.answeroption === 'select'"                                  
                                    class="indigo--text" flat="flat" 
                                    @click.native="check(item)">{{choice.title}}</v-btn>                                    
                                    
                                    <v-select  
                                      v-if="answerType === 'multi'"
                                      label="Select"
                                      v-bind:items="answerItems"
                                      v-model="e7"
                                      multiple
                                      chips
                                      persistent-hint
                                    ></v-select>
                                      
                                      <v-card-actions>
                                        <v-spacer></v-spacer>
                                        <v-btn class="primary white--text" large @click.native="submitAnswer"
                                          v-if="answerType === 'multi'">
                                          <span>Submit</span>
                                          <v-icon dark right large>check_circle</v-icon>
                                        </v-btn>
                                      </v-card-actions>


                                    <!--
                                      <v-spacer></v-spacer>
                                    <v-btn icon class="indigo--text" flat="flat" @click.native="check(item)"><v-icon>thumb_up</v-icon></v-btn>
                                    <v-btn icon class="gray--text darken-1" flat="flat" @click.native="item.dialog=false"><v-icon>thumb_down</v-icon></v-btn>
                                    -->
                                  </v-card-actions>
                                </v-card>
                              </v-dialog>
                              <!--<v-switch sm6 v-model="ex11"></v-switch>-->
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
                    
                        <v-btn class="primary white--text" large @click.native="test">
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
    name: "eventRoster",
    data () {
      return {
        dialog: false,
        eventTitle: "School class 02, Aug 14th, 2017",
        ex11: false,
        ex12: false,
        e7: [],
        items: [
          //{ memberid:'01', eventId: '01', study: false, icon: true, title: 'Jason Oner', avatar: 'https://vuetifyjs.com/static/doc-images/lists/1.jpg', dialog:false },
          //{ memberid:'02', eventId: '01', study: false, title: 'Travis Howard', avatar: 'https://vuetifyjs.com/static/doc-images/lists/2.jpg', dialog:false },
         // { memberid:'03', eventId: '01', study: false, title: 'Ali Connors', avatar: 'https://vuetifyjs.com/static/doc-images/lists/3.jpg', dialog:false },
         // { memberid:'04', eventId: '01', study: false, title: 'Cindy Baker', avatar: 'https://vuetifyjs.com/static/doc-images/lists/4.jpg', dialog:false },
        ],
        questionsChoices: [],
        question:"",
        answerType: "select",
        answerItems: [],
      }
    },
    mounted()  {
      axios.get("http://localhost:51306/api/Individuals/")//, {
        //params:{
         // phone:"10"
        //  }
      //})
      .then(response => {
          response.data = response.data.filter(function(item) {
           item["dialog"] = false;
           item["attendance"] = false;
             return item;
           });
        this.items = response.data;
      }
      );
      
      var self = this;
      axios.get("http://localhost:51306/api/Questions/")
      .then(response => {
          response.data = response.data.filter(function(option) {
            if(option.answeroption == "question") {
              self.question = option;
              return null;
            }
            self.answerItems.push(option.title);
            self.answerType = option.answeroption;
             return option;
           });
           console.log(response.data);
        self.questionsChoices = response.data;
      }
      );

    },
    methods: {
      isDialogOpen(item) {
        return item.dialog;
      },
      isPresent(item) {
                item.attendance = true;
        return item.attendance;
      },
      test() {
        this.items[0]["dialog"] = false;
        this.items[0]["attendance"] = true;
        this.items.push("")
        alert(JSON.stringify(this.items));
      },
      displayName(item) {
        return item.fname + " " + item.lname;
      },
      check(item) {
        item.dialog = false
        alert(JSON.stringify(item));
        this.rosterPost(item);
      },
      rosterGet() {
        s
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
  @import './stylus/main'
</style>
