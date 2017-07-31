import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import App1 from './App.1.vue'
import App2 from './App.2.vue'
import Register from './Register.vue'
import GroupEdit from './GroupEdit.vue'
import EventEdit from './EventEdit.vue'
import EventRoster from './EventRoster.vue'
import IndividualIndex from './IndividualIndex.vue'
import GroupIndex from './GroupIndex.vue'
import EventIndex from './EventIndex.vue'
import QuestionEdit from './QuestionEdit.vue'
import QuestionIndex from './QuestionIndex.vue'
import Vuetify from 'vuetify'

Vue.use(VueRouter);
Vue.use(Vuetify);

const routes = [
  {
    path:'/',
    component: GroupEdit,
  },
  {
    path:'/register',
    component: Register,
  },
  {
    path:'/groupEdit',
    component: GroupEdit,
  },
  {
    path:'/eventEdit',
    component: EventEdit,
  },
  {
    path:'/eventRoster',
    component: EventRoster,
  },
  {
    path:'/individualIndex',
    component: IndividualIndex,
  },
  {
    path:'/groupIndex',
    component: GroupIndex,
  },  
  {
    path:'/eventIndex',
    component: EventIndex,
  },
  {
    path:'/questionEdit',
    component: QuestionEdit,
  },
  {
    path:'/questionIndex',
    component: QuestionIndex,
  },
];

const router = new VueRouter(
  {
    routes
  }
);

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
