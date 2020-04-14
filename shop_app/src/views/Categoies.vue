<template>
  <div class="categoies">
    <van-nav-bar title="分类" left-arrow @click-left="onClickLeft" />
    <van-tabs v-model="activeName" @click="onClick()">
      <van-tab v-for="(item, index) in cate_list" :key="index" :title="item.cate_title" :name="item.id" ></van-tab>
    </van-tabs>
    <div class="content" v-for="(item, index) in goodsList" :key="index"  @click="toDesc(item.id)">
       <div class="image">
        <a href="javascript:;"><img :src="item.recommend_img" alt=""></a>
       </div>
       <span class="desc">{{item.recommend_desc}}</span>
       <p class="price">
        <span class="left">￥{{item.recommend_price}}</span>
        <span class="right">看相似</span>
       </p>
    </div>
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
      active: 1,
      activeName: 1,
      cate_list: [],
      goodsList: []
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    async getCategoies () {
      let { data: res } = await this.$http.get('/cate_page')
      this.cate_list = res.data
      console.log(res)
    },
    async getGoodsList () {
      let { data: res } = await this.$http.get('/goodsList?cate_id=' + this.activeName)
      this.goodsList = res.data
      console.log(res)
    },
    onClick () {
      this.getGoodsList()
    },
    toDesc (id) {
      window.sessionStorage.setItem('goodId', id)
      this.$router.push('/goodsdesc')
    }
  },
  created () {
    this.getCategoies()
    this.getGoodsList()
  }
}
</script>

<style scoped>
.content {
  padding-right: 2px;
  float: left;
  width: 50%;
  box-sizing: border-box;
  padding-bottom: 4px;
  position: relative;
}
.content img {
  opacity: 1;
    width: 176px;
    height: 176px;
}

.content .desc {
      box-sizing: border-box;
    height: 31px;
    font-size: 13px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-break: break-all;
    color: #232326;
    margin-top: 5px;
    line-height: 16px;
    margin-bottom: 3px;
    padding: 0 4px;
}

.content .price {
  font-size: 13px;
  overflow: hidden;
  position: relative;
  height: 26px;
}

.content .price .left {
    color: #f23030;
    display: inline-block;
    padding: 0 5px 0 4px;
    position: relative;
    top: 1px;
    height: 25px;
    line-height: 25px;
}

.content .price .right {
    display: block;
    position: absolute;
    top: 0;
    right: 8px;
    line-height: 21px;
    text-align: center;
    color: #686868;
    font-size: 12px;
    cursor: pointer;
    width: 49px;
    height: 24px;
    border: 1px solid #ccc;
}
</style>
