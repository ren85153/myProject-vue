/**
 * axios封装
 * 请求拦截、响应拦截、错误统一处理
 */

import axios from 'axios'   //引入 axios

import router from '../router/index'
import qs from 'qs'; // 引入qs模块，get，某些请求会用得到
// import { Message } from 'element-ui'    //引入 element-ui 的 Message 模块，用于信息提示
import {Message, Loading } from 'element-ui';
// import store from '@/store'     //引入 vuex 中的数据
// import { getToken } from '@/utils/auth'   //引入拿到的权限tocken




const service = axios.create({
  baseURL: process.env.BASE_API, // api 的 base_url
  timeout: 10 * 1000 , // request timeout  设置请求超时时间
  responseType: "json",
  withCredentials : true, // 是否允许带cookie这些

})
service.defaults.headers.post['Content-Type'] = 'application/json'
service.defaults.headers.get['Content-Type'] = 'application/x-www-form-urlencoded'
/**
 * 提示函数
 */
// const tip = msg => {
//   Modal.$message({
//     message: '恭喜你，这是一条成功消息',
//     type: 'success'
//   })
// }

/* eslint-disable no-new */
//使用钩子函数对路由进行权限跳转
router.beforeEach((to, from, next) => {
  // debugger
  // console.log('路由跳转到' + to.fullPath);
  const role = localStorage.getItem('ms_username');
  if (!role && to.path !== '/login') {
    next('/login');
  } else if (to.meta.permission) {
    // 如果是管理员权限则可进入，这里只是简单的模拟管理员权限而已
    role === 'admin' ? next() : next('/403');
  } else {
    // 简单的判断IE10及以下不进入富文本编辑器，该组件不兼容
    if (navigator.userAgent.indexOf('MSIE') > -1 && to.path === '/editor') {
      Vue.prototype.$alert('vue-quill-editor组件不兼容IE10及以下浏览器，请使用更高版本的浏览器查看', '浏览器不兼容通知', {
        confirmButtonText: '确定'
      });
    } else {
      next();
    }
  }
})

/**
 * 请求失败后的错误统一处理
 * @param {Number} status 请求失败的状态码
 */
const errorHandle = (status, other) => {
  // 状态码判断
  switch (status) {
    // 401: 未登录状态，跳转登录页
    case 401:
      toLogin()
      break
    // 403 token过期
    // 清除token并跳转登录页
    case 403:
      // tip('登录过期，请重新登录')
      // localStorage.removeItem('token')
      // cookie.removeToken()
      // store.commit('loginSuccess', null)
      // setTimeout(() => {
      //   toLogin()
      // }, 1000)
      break
    // 404请求不存在
    case 404:
      // tip('请求的资源不存在')
      break
    default:
  }
}
// create an axios instance
service.interceptors.request.use(
  config => {
    Loading.service({text:"Loading..."});
    // 在发送请求之前做什么
    if (config.method === 'get') {
      //  给data赋值以绕过if判断
      // config.data = qs.stringify(config.data);

    }else if(config.method === "post") {
      // 序列化
      // config.data = qs.stringify(config.data);
      // config.data = JSON.stringify(config.data);
      // 温馨提示,若是贵公司的提交能直接接受json 格式,可以不用 qs 来序列化的
    }else {
      // if (store.getters.token) {
      //   // 若是有做鉴权token , 就给头部带上token
      //   // 让每个请求携带token-- ['X-Token']为自定义key 请根据实际情况自行修改
      //   // 若是需要跨站点,存放到 cookie 会好一点,限制也没那么多,有些浏览环境限制了 localstorage (隐身模式)的使用
      //   config.headers['X-Token'] = getToken()
      // }
    }
    return config;
  },
  error => {
    // 对请求错误做些什么，自己定义
    //使用element-ui的message进行信息提示
    Message({
      showClose: true,
      message: error,
      type: 'warning'
    });
    return Promise.reject(error);
  }
);
// response interceptor
service.interceptors.response.use(
  response => {
    Loading.service().close();
    // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据
    // 否则的话抛出错误
    if (response.status === 200) {
      return Promise.resolve(response);
    } else {
      return Promise.reject(response);
    }
  },
  // 服务器状态码不是2开头的的情况
  // 这里可以跟你们的后台开发人员协商好统一的错误状态码
  // 然后根据返回的状态码进行一些操作，例如登录过期提示，错误提示等等
  // 下面列举几个常见的操作，其他需求可自行扩展
  error => {
    // debugger
    Loading.service().close();
    // console.log(error)
    if (error.response) {
      switch (error.response.status) {
        // 401: 未登录
        // 未登录则跳转登录页面，并携带当前页面的路径
        // 在登录成功后返回当前页面，这一步需要在登录页操作。
        case 401:
          router.replace({
            path: '/login',
            query: {
              redirect: router.currentRoute.fullPath
            }
          });
          break;

        // 403 token过期
        // 登录过期对用户进行提示
        // 清除本地token和清空vuex中token对象
        // 跳转登录页面
        case 403:
          Message({
            showClose: true,
            message: '权限不足,请联系管理员!',
            type: 'warning'
          });
          // 清除token
          localStorage.removeItem('token');
          // store.commit('loginSuccess', null);
          // // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面
          // setTimeout(() => {
          //   router.replace({
          //     path: '/login',
          //     query: {
          //       redirect: router.currentRoute.fullPath
          //     }
          //   });
          // }, 1000);
          break;

        // 404请求不存在
        case 404:
          Message({
            showClose: true,
            message: '服务器被吃了⊙﹏⊙∥',
            type: 'warning'
          });
          break;
        // 其他错误，直接抛出错误提示
        default:
          Message({
            showClose: true,
            message: '未知错误',
            type: 'warning'
          });
      }
      return Promise.reject(error.response);
    }
  }
);

export default service
