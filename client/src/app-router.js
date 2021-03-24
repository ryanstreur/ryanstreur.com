import { h } from 'vue'

import HomeComponent from './routes/Home.vue'

const routes = {
  '/': HomeComponent,
}

const AppRouter = {
  data: () => ({
    currentRoute: window.location.pathname
  }),

  computed: {
    CurrentComponent() {
      return routes[this.currentRoute] || NotFoundComponent
    }
  },

  render() {
    return h(this.CurrentComponent)
  }
}

export default AppRouter