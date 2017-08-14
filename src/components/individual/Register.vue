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
                  <v-layout row wrap>
                    <v-flex xs12 sm6>
                      <v-text-field
                        name="fname"
                        label="First Name"
                        prepend-icon="perm_identity"
                        required
                        v-model = 'individual.fname'
                      ></v-text-field>
                    </v-flex>            

                    <v-flex xs12 sm6>
                      <v-text-field
                        name="input-1-3"
                        label="Last Name"
                        required
                        prepend-icon="supervisor_account"
                        v-model = 'individual.lname'
                      ></v-text-field>
                    </v-flex>


                    <v-flex xs12 sm6>
                      <v-text-field      
                        name="input-1-3"
                        label="Phone Number"
                        required
                        prepend-icon="phone"
                        v-model = 'individual.phone'
                      ></v-text-field>
                    </v-flex>

                    <!-- <v-flex xs12 sm6>
                      <v-text-field
                        name="input-1-3"
                        label="Email"
                        required
                        prepend-icon="email"
                        v-model = 'registrationForm.email'
                      ></v-text-field>
                    </v-flex> -->

                    <!-- <v-flex xs12 sm6>
                      <v-text-field
                        name="input-1-3"
                        label="Password"
                        required
                        hint="At least 8 characters"
                        min="8"
                        :append-icon="e3 ? 'visibility' : 'visibility_off'"
                        :append-icon-cb="() => (e3 = !e3)"
                        type="password"
                        prepend-icon="lock"
                        v-model = 'registrationForm.password'
                      ></v-text-field>
                    </v-flex> -->
                
                    <!-- <v-flex xs12 sm6>
                      <v-text-field
                        name="input-1-3"
                        label="Re-type Password"
                        required
                        hint="At least 8 characters"
                        min="8"
                        :append-icon="e3 ? 'visibility' : 'visibility_off'"
                        :append-icon-cb="() => (e3 = !e3)"
                        type="password"
                        prepend-icon="lock"
                      ></v-text-field>
                    </v-flex> -->
                  </v-layout>

                  <!--
                  <div v-if="!image">
                    <h2>Select an image</h2>
                    <input type="file" @change="onFileChange">
                  </div>
                  <div v-else>
                    <img :src="image" />
                    <button @click="removeImage">Remove image</button>
                  </div>
                  -->



 
                  </v-container>
                </v-card>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                
                    <v-btn class="primary white--text" large @click.native="updateInfo">
                      <span>Register</span>
                      <v-icon dark right large>check_circle</v-icon>
                    </v-btn>   
                  </v-card-actions>  
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
        registrationForm: {"phone":"","email":"","fname":"","lname":"","kid":false,"active":true,"familyId":"","timestamp":"AAAAAAAAB9I=", "password":""},
        image:'',
        individual:{id:"","phone":"","email":"","fname":"","lname":"1","kid":false,"active":true,"familyId":"","timestamp":"AAAAAAAAB9I=", "password":""},
      }
    },
    mounted() {
      //isRegistered = 
      this.register();

    },
    methods: {
      register() {
        axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token'),      
        axios.post("http://localhost:51306/api/Individuals/")//, {
        //axios.get("http://localhost:51306/api/myGroups/")//, {
          //params:{
          // phone:"10"
          //  }
        //})
        .then(response => {
            //response.data = response.data.filter(function(item) {
            //item["dialog"] = false;
            ////item["attendance"] = false;
             // return item;
            //}
            //);
            console.log(response.data)
          this.individual = response.data;
          if(response.data.phone != null && response.data.fname != null) {
            if(response.data.avatar == null) {
              this.$router.push({path:"/IndividualUpload"})
            } else {
              this.$router.push({path:"/eventIndex"})
            }
          }
        }
        );
      },
      onFileChange(e) {
        var files = e.target.files || e.dataTransfer.files;
        if (!files.length)
          return;
        this.createImage(files[0]);
      },
      createImage(file) {
        var image = new Image();
        var reader = new FileReader();
        var vm = this;

        reader.onload = (e) => {
          vm.image = e.target.result;
        };
        reader.readAsDataURL(file);
      },
      removeImage: function (e) {
        this.image = '';
      },
      updateInfo() {
        console.log(this.individual);
          //Axios.get('http://localhost:65473/api/Individuals/1234567890');
  //       Axios.post('/api/Individuals', 'JobsController@store')
          axios.put('http://localhost:51306/api/Individuals/'+ this.individual.id, this.individual)
          .then(function (response) {
              if(this.individual.avatar == null) {
                alert('individualupload comming');
                this.$router.push({path:"/IndividualUpload"});
            } else {
                this.$router.push({path:"/eventIndex"});
            }
          }
          )
          .catch(function (error) {
            console.log(error);
            //alert(JSON.stringify(error.response.status));

          });
      }
    }
  }
 
</script>

<style lang="stylus">
  @import './../../stylus/main'
</style>
