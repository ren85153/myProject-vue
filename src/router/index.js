import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/dashboard'
    },
    {
      path: '/',
      component: resolve => require(['../components/common/Home.vue'], resolve),
      meta: { title: '自述文件' },
      children:[
        {
          path: '/dashboard',
          component: resolve => require(['../components/page/Dashboard.vue'], resolve),
          meta: { title: '系统首页' }
        },
        {
          path: '/SysUser',
          component: resolve => require(['../components/page/SysUser.vue'], resolve),
          meta: { title: '用户管理' }
        },
        {
          path: '/SysRole',
          component: resolve => require(['../components/page/SysRole.vue'], resolve),
          meta: { title: '角色管理' }
        },
        {
          path: '/SysMenu',
          component: resolve => require(['../components/page/SysMenu.vue'], resolve),
          meta: { title: '菜单管理' }
        },
        {
          path: '/SysDict',
          component: resolve => require(['../components/page/SysDict.vue'], resolve),
          meta: { title: '字典管理' }
        },
        {
          path: '/SysMonitor',
          // component: resolve => require(['../components/page/Dashboard.vue'], resolve),
          meta: { title: '监控平台' },
          children:[
            {
              path: '/SysMonitor',
              component: resolve => require(['../components/page/SysLogs.vue'], resolve),
              meta: { title: '系统日志' },
            },
            // {
            //   path: '/SysMonitor',
            //   component: resolve => require(['../components/page/Dashboard.vue'], resolve),
            //   meta: { title: '数据库监测' },
            // }
          ]
        },
        {
          path: '/404',
          component: resolve => require(['../components/page/404.vue'], resolve),
          meta: { title: '404' }
        },
        {
          path: '/403',
          component: resolve => require(['../components/page/403.vue'], resolve),
          meta: { title: '403' }
        }
      ]
    },
    {
      path: '/login',
      component: resolve => require(['../components/page/Login.vue'], resolve)
    },
    {
      path: '*',
      redirect: '/404'
    }
  ]
})
