<template>
  <div class="me">
    <van-nav-bar
      title="我的"
      left-arrow
      @click-left="onClickLeft"
    />
  <a class="profile-link" href="/person" :data="userMsg">
  <img class="profile-image" :src="userMsg.user_img" alt="">
  <div class="user-info">
    <div class="user-name">{{userMsg.telephone}}</div>
  </div>
  </a>
  <ul class="clear" style="list-style: none;">
    <a class="info-data-link" href="">
      <span class="info-data-top">
        <b>0</b>元
      </span>
      <span class="info-data-bottom">我的余额</span>
    </a>
    <a class="info-data-link" href="">
      <span class="info-data-top">
        <b>0</b>个
      </span>
      <span class="info-data-bottom">我的优惠</span>
    </a>
    <a class="info-data-link" href="">
      <span class="info-data-top">
        <b>0</b>分
      </span>
      <span class="info-data-bottom">我的积分</span>
    </a>
  </ul>
      <van-tabbar v-model="active">
      <van-tabbar-item icon="shop-collect" to="/">首页</van-tabbar-item>
      <van-tabbar-item icon="weapp-nav" to="/categoies">分类</van-tabbar-item>
      <van-tabbar-item icon="shopping-cart" to="/cart">购物车</van-tabbar-item>
      <van-tabbar-item icon="manager" to="/me">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
export default {
  data () {
    return {
      active: 3,
      userMsg: {
        username: '',
        password: '',
        user_img: ''
      }
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    async getUserMsg () {
      let { data: res } = await this.$http.get('/userMessage?tele=' + window.sessionStorage.getItem('telephone'))
      console.log(res)
      this.userMsg = res.data[0]
    }
  },
  created () {
    this.getUserMsg()
  }
}
</script>

<style scoped>
.me {
  width: 100%;
  height: 100%;
}

a {
  text-decoration: none;
}

.profile-link {
  /* display: block; */
  display: flex;
  /* justify-content: none; */
  align-items: center;
  /* box-align: center; */
  padding: 2.666667rem .6rem;
  background-color: #999;
}

.profile-image {
  display: inline-block;
  width: 3.5rem;
  height: 3.5rem;
  border-radius: 50%;
  vertical-align: middle;
  font-size: .2rem;
}

.user-info {
  margin-left: .48rem;
  flex-grow: 1;
}

.user-info .user-name {
  font-weight: 700;
  font-size: 0.8rem;
  color: #fff;
  text-align: left;
}

.info-data-link {
  width: 33.33%;
  display: inline-block;
  border-right: 1px solid #f1f1f1;
  box-sizing: border-box;
}

.info-data-link span {
  display: block;
  width: 100%;
}

.info-data-top {
    font-size: 0.55rem;
    color: #333;
    text-align: center;
    padding: .853333rem 0 .453333rem;
}

.info-data-bottom {
  font-size: 1rem;
  color: #666;
  text-align: center;
  font-weight: 400;
  padding-bottom: .45333rem;
}
</style>
