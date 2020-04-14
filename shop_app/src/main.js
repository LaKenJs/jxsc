import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Vant from 'vant'
import 'vant/lib/index.css'
import axios from 'axios'
axios.defaults.baseURL = 'http://127.0.0.1:8982/api/v1'
Vue.prototype.$http = axios

axios.interceptors.request.use(
  function (config) {
    let token = window.sessionStorage.getItem('token')
    if (token !== null) {
      config.headers.Authorization = 'Bearer ' + token
    }
    return config
  },
  function (error) {
    return Promise.reject(error)
  }
)
Vue.use(Vant)
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
