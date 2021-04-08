import { h } from 'vue'
import { createWebHistory, createRouter } from 'vue-router';

import HomeComponent from './routes/Home.vue'
import ParticleTest from './routes/ParticleTest.vue'

const routes = [
  {
    path: '/', component: HomeComponent
  }, {
    path: '/particle', component: ParticleTest
  }
]

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
