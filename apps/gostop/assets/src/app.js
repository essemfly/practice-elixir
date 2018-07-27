import Vue from 'vue'
import App from './App.vue'
import Main from './Main.vue'

new Vue({
  el: '#app',
  render: function(h) {
    const path = window.location.pathname;
    switch(path) {
      case "/":
        return h(App);
      case "/main":
        return h(Main);
    }
  }
})