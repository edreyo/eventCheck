<template>
  <v-app light>
    <v-navigation-drawer
      temporary
      :mini-variant="miniVariant"
      :clipped="!clipped"
      v-model="drawer"  
      absolute
      height = "100%"        
    >
      <v-list dense>
        <template v-for="(item, i) in items">
          <v-layout
            row
            v-if="item.heading"
            align-center
            :key="i"
          >
            <v-flex xs6>
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-flex>
            <v-flex xs6 class="text-xs-center">
              <v-btn icon ripple @click.native="goToRouter(item.route, item)" >
                <v-icon>{{item.icon}}</v-icon></a>
              </v-btn>
            </v-flex>
          </v-layout>
          <v-divider
            light
            v-else-if="item.divider"
            class="my-4"
            :key="i"
          ></v-divider>
          <v-list-tile
            :key="i"
            v-else
            @click.native="goToRouter(item.route, item)"
          >
            <v-list-tile-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title>
                {{ item.text }}
              </v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </template>





      <!--
        <v-list-tile 
          v-for="(item, i) in items"
          :key="i"
          value="true"
        >
        <router-link :to="item.to">
          <v-list-tile-action>
            <v-icon light v-html="item.icon"></v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title v-text="item.title"></v-list-tile-title>
          </v-list-tile-content>
        </router-link>          
        </v-list-tile> -->
      </v-list>
    </v-navigation-drawer>
    <v-toolbar class="primary" :dark="true" fixed>
      <v-toolbar-side-icon @click.native.stop="drawer = !drawer"></v-toolbar-side-icon>
      <!--<v-btn 
        icon
        @click.native.stop="miniVariant = !miniVariant"
      >
        <v-icon v-html="miniVariant ? 'chevron_right' : 'chevron_left'"></v-icon>
      </v-btn>
      <v-btn
        icon
        @click.native.stop="clipped = !clipped"
      >
        <v-icon>web</v-icon>
      </v-btn>
      <v-btn
        icon
        @click.native.stop="fixed = !fixed"
      >
      
        <v-icon>remove</v-icon>
      </v-btn>
      -->
      <v-toolbar-title v-text="title"></v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        icon
        @click.native.stop="rightDrawer = !rightDrawer"
      >
        <v-icon>more_vert</v-icon>
      </v-btn>
    </v-toolbar>
    <main>
      <button
        class="btn btn-primary btn-margin"
        v-if="!authenticated"
        @click="login()">
          Log In
      </button>
      <button
          class="btn btn-primary btn-margin"
          v-if="authenticated"
          @click="logout()">
            Log Out
      </button>
      <button hidden
          class="btn btn-primary btn-margin"
          @click="logout()">
            Log Out
      </button>      
      <router-view
        :auth="auth" 
        :authenticated="authenticated">
      </router-view>
    </main>
    <v-navigation-drawer
      temporary
      :right="right"
      v-model="rightDrawer"
    >
      <v-list>
        <v-list-tile @click.native="right = !right">
          <v-list-tile-action>
            <v-icon light>compare_arrows</v-icon>
          </v-list-tile-action>
          <v-list-tile-title>Switch drawer (click me)</v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-footer :fixed="fixed">
      <span>&copy; 2017</span>
    </v-footer>
  </v-app>
</template>

<script>
import AuthService from './auth/AuthService'

const auth = new AuthService()

const { login, logout, authenticated, authNotifier, signup } = auth

  export default {
    name:"app",
    data () {
      authNotifier.on('authChange', authState => {
      this.authenticated = authState.authenticated
    })
    return {
        clipped: false,
        drawer: true,
        fixed: false,
        items: [
          { heading: 'Events', route: 'eventEdit', icon: 'add' },
          { icon: 'event_available', text: 'Quick Start', route: 'eventRoster' },
          { icon: 'view_list', text: 'My Events', route: 'eventIndex' },
          { icon: 'view_agenda', text: 'All Events', route: 'eventIndex' },
          { divider: true },
          { heading: 'Groups', route: 'groupEdit', icon: 'add' },
          { icon: 'group', text: 'My Groups', route: 'mygroupIndex', paramValue:"my" },
          { icon: 'view_agenda', text: 'All Groups', route: 'groupIndex' },
          { divider: true },          
          { heading: 'Questions', route: 'questionEdit', icon: 'add' },
          { icon: 'help', text: 'All Questions', route:'questionIndex' },
          { divider: true },          
          { heading: 'Members', route: 'register', icon: 'add' },
          { icon: 'perm_identity', text: 'All Members', route: 'individualIndex' },
/*
          { icon: 'view_list', text: 'My Events' },
          { icon: 'view_agenda', text: 'All Events' },
          { divider: true },{ heading: 'Labels' },
          { icon: 'add', text: 'Create new label' },
          { divider: true },
          { icon: 'archive', text: 'Archive' },
          { icon: 'delete', text: 'Trash' },
          { divider: true },
          { icon: 'settings', text: 'Settings' },
          { icon: 'chat_bubble', text: 'Trash' },
          { icon: 'help', text: 'Help' },
          { icon: 'phonelink', text: 'App downloads' },
          { icon: 'keyboard', text: 'Keyboard shortcuts' }
          ///{ icon: 'bubble_chart', title: 'Register', to: '/register' },
          { icon: 'bubble_chart', title: 'Edit Group', to: '/groupEdit' },
          { icon: 'bubble_chart', title: 'Edit Event', to: '/eventEdit' },
          { icon: 'bubble_chart', title: 'Roster', to: '/eventRoster' },
          { icon: 'bubble_chart', title: 'Individuals', to: '/individualIndex' },
          { icon: 'bubble_chart', title: 'Groups', to: '/groupIndex' },
          { icon: 'bubble_chart', title: 'Events', to: '/eventIndex' },
          { icon: 'bubble_chart', title: 'Edit Question', to: '/questionEdit' },
          { icon: 'bubble_chart', title: 'Questions', to: '/questionIndex' },
          { icon: 'bubble_chart', title: 'Select Group', to: '/individualGroupEdit' },
          { icon: 'bubble_chart', title: 'Upload Picture', to: '/individualUpload' },
          */
        ],
        miniVariant: false,
        right: true,
        rightDrawer: false,
        title: 'Event Checker',
        auth,
        authenticated,
      }
    },
    methods: {
      goToRouter(route, item) {
        this.$router.push(
          {
            path: "../../"+route, query:{ param:item.paramValue},
          }
        ); 
        //this.$router.go(this.$router.currentRoute);
      },
      login,
      logout,
      signup
    }
  }
</script>

<style lang="stylus">
  @import './stylus/main'
</style>
