import Vue from 'vue'
import Router from 'vue-router'
//import App1 from './../App.1.vue'
//import App2 from './../App.2.vue'
import Register from './../components/individual/Register.vue'
import GroupEdit from './../components/group/GroupEdit.vue'
import EventEdit from './../components/event/EventEdit.vue'
import EventRoster from './../components/event/EventRoster.vue'
import IndividualIndex from './../components/individual/IndividualIndex.vue'
import GroupIndex from './../components/group/GroupIndex.vue'
import GroupList from './../components/group/GroupList.vue'
import EventIndex from './../components/event/EventIndex.vue'
import QuestionEdit from './../components/question/QuestionEdit.vue'
import QuestionIndex from './../components/question/QuestionIndex.vue'
import IndividualGroupEdit from './../components/individual/IndividualGroupEdit.vue'
import IndividualUpload from './../components/individual/IndividualUpload.vue'
import CallBack from './../components/CallBack.vue'

Vue.use(Router);
//Vue.use(Vuetify);

const routes = [
  {
    path:'/',
    component: GroupEdit,
  },
  {
    path:'/callback',
    component: CallBack,
  },
  {
    name:'Register',
    path:'/register',
    component: Register,
  },
  {
    path:'/groupEdit/:id',
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
    path:'/groupList',
    component: GroupList,
  },  
  {
    path:'/mygroupIndex',
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
  {
    path:'/individualGroupEdit',
    component: IndividualGroupEdit,
  },
    {
    path:'/individualUpload',
    component: IndividualUpload,
  },
];

const router = new Router(
  {
    mode: 'history',
    //base: window.location.pathName,
    //root: '/',
    routes
  }
);

export default router
