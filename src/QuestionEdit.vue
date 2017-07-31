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
                      <v-text-field
                        name="quesiton"
                        label="Question"
                        prepend-icon="help"
                        required
                        v-model = 'rows[0].title'
                      ></v-text-field>
                    </v-flex>            

                    
                
                    <v-flex v-for="(row, index) in rows" v-if="index > 0" xs12 sm6>
                      <v-text-field v-if="index > 0"
                        v-model="row.title"
                        name="option"
                        :label="choiceTitle(row,index)"
                        required
                        hint="At least 8 characters"
                        prepend-icon="question_answer"
                      ></v-text-field>
                    </v-flex>

                    <v-flex>
                      <v-btn fab dark class="pink"  @click.native="removeElement">
                        <v-icon dark>remove</v-icon>
                      </v-btn>
                      <v-btn fab dark class="indigo" @click.native="addOption">
                        <v-icon dark>add</v-icon>
                      </v-btn>
                    </v-flex>
                  </v-layout>

                      <v-card-actions>
                        <v-spacer></v-spacer>
                    
                        <v-btn class="primary white--text" large @click.native="questionPost">
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

 //Axios.defaults.headers.common['Content-Type'] = 'application/x-www-form-urlencoded, application/json'; 
 //Axios.defaults.headers.common.crossDomain = true; 
 //Axios.defaults.headers.common['Access-Control-Allow-Origin'] = ''; 
 //Axios.defaults.headers.common['Accept'] = 'application/json, text/plain)';
  export default {
    name: "register",
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
        rows: [{"id":Math.floor(Math.random() * 200),"title":"", "answeroption":"question"}]
      }
    },
    methods: {
      questionPost() {
         axios.post('http://localhost:51306/api/questions/', this.rows[0])
         .then(function (response) {
            console.log(response.status);
            alert(JSON.stringify(response.status));
          })
          .catch(function (error) {
            console.log(error);
            alert(JSON.stringify(error.response.status));

          });
      },
      choiceTitle(row,index) {
        return "Answer Choice #" + (index);
      },
      addOption() { 
          var elem = document.createElement('tr');
          this.rows.push({
              id: Math.floor(Math.random() * 200),
              title: "",
              answeroption: "select",
          });

      },
      removeElement: function(index) {
        console.log(this.rows.length);
        if(this.rows.length > 1)
          this.rows.splice(index, 1);
        
      },
      setFilename: function(event, row) {
          var file = event.target.files[0];
          row.file = file
      },
    }
  }
 
</script>

<style lang="stylus">
  @import './stylus/main'
</style>
