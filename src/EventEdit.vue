<template>
      <v-container fluid>
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
                        label="Event Name"
                        prepend-icon="event"
                        required
                        v-model = 'eventEditForm.name'
                      ></v-text-field>
                    </v-flex>
                    <v-flex xs12 sm6>
                      <v-select
                        v-bind:items="reocTypeOptions"                      
                        name="fname"
                        label="Frequency"
                        prepend-icon="repeat"
                        required
                        item-value="text"
                        v-model = 'eventEditForm.reocType'
                      ></v-select>
                    </v-flex>
                    <v-flex xs12 sm6>
                      <v-menu
                        lazy
                        :close-on-content-click="false"
                        v-model="menu27"
                        transition="scale-transition"
                        offset-y
                        :nudge-left="40"
                      >
                        <v-text-field
                          slot="activator"
                          label="Start Date"
                          v-model = 'eventEditForm.dateStarts'
                          prepend-icon="date_range"
                          readonly
                        ></v-text-field>
                        <v-date-picker v-model="eventEditForm.dateStarts" autosave></v-date-picker>
                      </v-menu>
                    </v-flex> 
                    <v-flex xs12 sm6>
                      <v-menu
                        lazy
                        :close-on-content-click="false"
                        v-model="menu26"
                        transition="scale-transition"
                        offset-y
                        :nudge-left="40"
                      >
                        <v-text-field
                          slot="activator"
                          label="Start Time"
                          v-model = 'eventEditForm.timeStarts'
                          prepend-icon="access_time"
                          readonly
                        ></v-text-field>
                        <v-time-picker v-model="eventEditForm.timeStarts" format="24hr" autosave></v-time-picker>
                      </v-menu>
                    </v-flex>  
                    <v-flex xs12 sm6>
                      <v-menu
                        lazy
                        :close-on-content-click="false"
                        v-model="menu25"
                        transition="scale-transition"
                        offset-y
                        :nudge-left="40"
                      >
                        <v-text-field
                          slot="activator"
                          label="End Date"
                          v-model = 'eventEditForm.dateEnds'
                          prepend-icon="date_range"
                          readonly
                        ></v-text-field>
                        <v-date-picker v-model="eventEditForm.dateEnds" autosave></v-date-picker>
                      </v-menu>
                    </v-flex>             
                    <v-flex xs12 sm6>
                      <v-menu
                        lazy
                        :close-on-content-click="false"
                        v-model="menu24"
                        transition="scale-transition"
                        offset-y
                        :nudge-left="40"
                      >
                        <v-text-field
                          slot="activator"
                          label="End Time"
                          v-model = 'eventEditForm.timeEnds'
                          prepend-icon="access_time"
                          readonly  
                        ></v-text-field>
                        <v-time-picker v-model="eventEditForm.timeEnds"  format="HH:mm:ss" autosave></v-time-picker>
                      </v-menu>
                    </v-flex>
                    <v-flex xs12 sm6>
                      <v-select  
                        label="Select Group"
                        v-bind:items="groups"
                        v-model="selectedGroups"
                        item-text="name"
                        item-value="id" 
                        persistent-hint
                        prepend-icon="group"                        
                      ></v-select>
                    </v-flex>
                    <v-flex xs12 sm6>
                      <v-select  
                        label="Select Question"
                        v-bind:items="questions"
                        v-model="selectedGroups"
                        item-text="title"
                        item-value="id" 
                        persistent-hint
                        prepend-icon="question_answer"                        
                      ></v-select>
                    </v-flex>                                             
                             
                    <v-switch v-bind:label="`Active: ${eventEditForm.active.toString()}`" v-model="eventEditForm.active"></v-switch>
                  </v-layout>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                    
                        <v-btn class="primary white--text" large @click.native="eventPost">
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
    name: "evetEdit",
    data () {
      return {
        reocTypeOptions:[
          { text: 'One Time' },
          { text: 'Weekly' },
          { text: 'Monthly' },
        ],
        eventEditForm: {"id":"2","name":"", "reocType":"","dateStarts":"","timeStarts":"","dateEnds":"","timeEnds":"","active":true,"timestamp":"AAAAAAAAB9I="},
        groups: [],
        questions: [],
      }
    },
    mounted()  {
      //todo get individual from url
      this.individual = "1";
      axios.get("http://localhost:51306/api/groups/")
      .then(response => {
          response.data = response.data.filter(function(group) {
             return group;
           });
        this.groups = response.data;
      }
      );
      axios.get("http://localhost:51306/api/questions/")
      .then(response => {
          response.data = response.data.filter(function(group) {
             return group;
           });
        this.questions = response.data;
      }
      );
    },
    methods: {
      eventPost() {
        //this.eventEditForm.startDate ="AAAAAAAAB9I=";
        alert(JSON.stringify(this.eventEditForm));

         axios.post('http://localhost:51306/api/theEvents/', this.eventEditForm)
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
