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
                    <v-flex xs12 sm12>
                      <v-select  
                        label="Select Group(s)"
                        v-bind:items="groups"
                        v-model="selectedGroups"
                        item-text="name"
                        item-value="id" 
                        multiple
                        chips
                        persistent-hint
                        prepend-icon="group"                        
                      ></v-select>
                    </v-flex>            
                  </v-layout>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                    
                        <v-btn class="primary white--text" large @click.native="individualGroupPost">
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
    name: "IndividualGroupEdit",
    data () {
      return {
        groups: [],
        selectedGroups: [],
        response: [],
        individual: "",
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
    },
    methods: {
      individualGroupPost() {
        var self = this;
        this.selectedGroups.forEach(function(item) {
          self.response = [];
          self.response.push({
            "individualId":self.individual,"groupId":item,"role":"","timestamp":"AAAAAAAAB9I="
          });
        });
         axios.post('http://localhost:51306/api/individualGroups/', this.response[0])
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
