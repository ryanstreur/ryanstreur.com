import { createApp } from 'vue'

import Particles from 'particles.vue3'

import App from './App.vue'
import { router } from './app-router'

createApp(App).use(Particles).use(router).mount('#app')