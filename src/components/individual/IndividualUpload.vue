<template>
      <v-container fluid>
        <v-slide-y-transition mode="out-in">
          <v-layout align-center justify-center>
            <v-flex xs10>  
            <v-layout row wrap>
            <!--<h5>Sign Up </h5> -->
            </v-layout>             
              <v-container class="text-xs-center">
                  <v-layout row wrap>
                    <v-flex xs12 sm12>
                        <v-btn @click.native="clickcf">Upload My Picture
                        </v-btn>
                        <input ref="choosefile" type="file" name="avatar" id="avatar" v-on:change="chooseFile" class="form-control"  accept="image/*" hidden>
                        <!--<input type="file" v-el="thumbs.url"  v-on:change="upload($event.target.files)" /> -->
                    </v-flex>
                    <v-flex xs12 sm6 offset-xs3>
                      <v-card>
                        <v-flex>
                          <img :src="image" style="width: 100%"/>
                          <v-btn :disabled="canRemove" @click.native="removeImage"
                          absolute
                          dark
                          fab
                          bottom
                          left
                          class="pink"
                        >
                          <v-icon>close</v-icon>
                        </v-btn>
                        </v-flex>
                      </v-card>  
                    </v-flex>                   
                  </v-layout>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                    
                        <v-btn class="primary white--text" large @click.native="upload">
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
import { CLOUDINARY_CONFIG } from './auth0-variables'
  export default {
    name: "IndividualGroupEdit",
    data () {
      return {
        cloudinary: {
          uploadPreset: CLOUDINARY_CONFIG.uploadPreset,
          apiKey: CLOUDINARY_CONFIG.apiKey,
          cloudName: CLOUDINARY_CONFIG.cloudName,
        },
        thumbs: [], 
        groups: [],
        selectedGroups: [],
        response: [],
        individual: "",
        image: "http://res.cloudinary.com/eventcheck/image/upload/v1501662216/t0lhujedk4rzlhbr4rsm.png",
        imageFormData: "",
        publicId: "",
        userId: "",
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
    computed: {
      clUrl: function() {
          return `https://api.cloudinary.com/v1_1/${this.cloudinary.cloudName}/upload`  
      },
      canRemove: function() {
        return (this.image === "http://res.cloudinary.com/eventcheck/image/upload/v1501662216/t0lhujedk4rzlhbr4rsm.png")
      }                
    },
    methods: {
      removeImage() {
        this.image = "http://res.cloudinary.com/eventcheck/image/upload/v1501662216/t0lhujedk4rzlhbr4rsm.png";
      },
      clickcf () {
        //alert('testq');
        const elem = this.$refs.choosefile;
            elem.click();
      },
      upload() {
        if(this.imageFormData === "") {
          return;
        };
        axios.post(this.clUrl, this.imageFormData).then(res => {
          this.publicId = res.data.public_id;
          //this.thumbs.unshift({
          //  url: res.data.secure_url
          //})
        });
      },
      chooseFile(e) {
        //alert('test');
        e.preventDefault();
        /////var files = this.$$.avatar.files;
        var files = e.target.files || e.dataTransfer.files;
          if (!files.length)
            return;
        this.createImage(files[0]);

        ////var data = new FormData();
        // for single file
        ////data.append('avatar', files[0]);
        // Or for multiple files you can also do
        //  _.each(files, function(v, k){
        //    data.append('avatars['+k+']', v);
        // });

        const formData = new FormData()
        formData.append('file', files[0]);
        formData.append('upload_preset', this.cloudinary.uploadPreset);
        formData.append('tags', 'gs-vue,gs-vue-uploaded');
        // For debug purpose only
        // Inspects the content of formData
        for(var pair of formData.entries()) {
          console.log(pair[0]+', '+pair[1]);
        };
        this.imageFormData = formData;


        /*
        this.$http.post('/avatars/upload', data, function (data, status, request) {
              //handling
        }).error(function (data, status, request) {
              //handling
        });
        */
      },
      createImage(file) {
        var image = new Image();
        var reader = new FileReader();
        var self = this;

        reader.onload = (e) => {
          self.image = e.target.result;
        };
        reader.readAsDataURL(file);
      },
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
  @import './../../stylus/main'
</style>
