// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios';
import ElementUI from 'element-ui';
// 1. 导入弹框提示组件
import { Message } from 'element-ui'
import VueI18n from 'vue-i18n';
import { i18nMsg } from './components/common/i18n';
import 'element-ui/lib/theme-chalk/index.css'; // 默认主题
// import '../static/css/theme-green/index.css';       // 浅绿色主题
// import './assets/css/icon.css';
import "babel-polyfill";// Babel是一个广泛使用的转码器，可以将ES6代码转为ES5代码，从而可以在现有环境执行。所以你可以用ES6编写，而不用考虑环境支持的问题。



Vue.config.productionTip = false

Vue.prototype.$axios = axios;
// 2. 全局挂载 Message 组件
Vue.prototype.$message = Message

Vue.use(VueI18n);
Vue.use(ElementUI, {
  size: 'small'
});
const i18n = new VueI18n({
    locale: 'zh',
    i18nMsg
})





new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
})
