<template>
  <v-app light>
    <v-navigation-drawer
      permanent
      :mini-variant="miniVariant"
      :clipped="!clipped"
      v-model="drawer"
    >
      <v-list>
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
        </v-list-tile>
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
        <v-icon>menu</v-icon>
      </v-btn>
    </v-toolbar>
    <main>
      <router-view></router-view>
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
  export default {
    name:"app",
    data () {
      return {
        clipped: false,
        drawer: true,
        fixed: false,
        items: [
          { icon: 'bubble_chart', title: 'Register', to: '/register' },
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
        ],
        miniVariant: false,
        right: true,
        rightDrawer: false,
        title: 'Sign Up',
      }
    },
  }
</script>

<style lang="stylus">
  @import './stylus/main'
</style>
