import Vue from 'vue';
import Router from 'vue-router';

import Page1 from './pages/Page1.vue';
import Page2 from './pages/Page2.vue';

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/', component: Page1},
    {path: '/page2', component: Page2}
  ]
});

// const routes = [
//   {path: '/', component: Page1},
//   {path: '/page2', component: Page2}
//   ];

// export default new Router({ routes });