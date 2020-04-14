import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  // 首页
  {
    path: '/',
    name: 'home',
    component: Home
  },
  // 商品详情
  {
    path: '/goodsdesc',
    component: () => import('../views/GoodsDesc.vue')
  },
  // 分类
  {
    path: '/categoies',
    component: () => import('../views/Categoies.vue')
  },
  // 支付成功
  {
    path: '/paysuccess',
    component: () => import('../views/PaySuccess.vue'),
    meta: { mustLogin: true }
  },
  // 创建订单
  {
    path: '/order/create',
    component: () => import('../views/CreateOrder.vue')
  },
  // 创建订单地址
  {
    path: '/order/adress',
    component: () => import('../views/CreateAdress.vue')
  },
  // {
  //   path: '/order/controlAdress',
  //   component: () => import('../views/AdressControl.vue')
  // },
  // 购物车
  {
    path: '/cart',
    component: () => import('../views/Cart.vue')
  },
  // 登录
  {
    path: '/login',
    component: () => import('../views/Login.vue')
  },
  // 注册
  {
    path: '/regist',
    component: () => import('../views/Regist.vue')
  },
  // 自己
  {
    path: '/me',
    component: () => import('../views/Me.vue'),
    meta: { mustLogin: true }
  },
  // 个人中心
  {
    path: '/person',
    component: () => import('../views/person.vue')
  },
  // 修改个人资料
  {
    path: '/user-edit',
    component: () => import('../views/Useredit.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
export default router
