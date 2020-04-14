<template>
  <div class="home">
    <van-nav-bar title="京西商城" left-text="三" right-text="登录" @click-left="onClickLeft" @click-right="onClickRight"/>
    <van-search
  v-model="query"
  show-action
  placeholder="请输入搜索关键词"
  @search="getGoodsList()"
>
  <div slot="action" @click="getGoodsList()">搜索</div>
</van-search>
    <van-swipe :autoplay="3000">
      <van-swipe-item v-for="(item, index) in images" :key="index">
        <img :src="item.image" style="width:100%" />
      </van-swipe-item>
    </van-swipe>
    <div class="goodsList">
      <div class="header">
        <img class="head_img" src="//img11.360buyimg.com/jdphoto/jfs/t1/31601/22/15554/14040/5cc2a86fEbdb1098b/88174b36f85283b6.png" alt="">
      </div>
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
    </div>
    <div style="clear:left;"></div>
    <van-tabbar v-model="active">
      <van-tabbar-item icon="shop-collect" to="/">首页</van-tabbar-item>
      <van-tabbar-item icon="weapp-nav" to="/categoies">分类</van-tabbar-item>
      <van-tabbar-item icon="shopping-cart" to="/cart">购物车</van-tabbar-item>
      <van-tabbar-item icon="manager" to="/me">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
import '../filter'
export default {
  data () {
    return {
      active: 0,
      images: [],
      cateList: [],
      goodsList: [],
      query: ''
    }
  },
  methods: {
    onClickLeft () {
      this.$router.push('/categoies')
    },
    onClickRight () {
      this.$router.push('/login')
    },
    toDesc (id) {
      window.sessionStorage.setItem('goodId', id)
      this.$router.push('/goodsdesc')
    },
    async getImages () {
      let { data: res } = await this.$http.get('/swiper')
      this.images = res.data
      console.log(res)
    },
    async getGoodsList () {
      // console.log()
      let { data: res } = await this.$http.get('/goodsList?query=' + this.query)
      this.goodsList = res.data
      console.log(res)
    }
  },
  created () {
    this.getImages()
    this.getGoodsList()
  }
}
</script>

<style scoped>
.home {
  width: 100%;
  height: 100%;
  /* background-color: #f0f2f5; */
  padding-bottom: 50px;
}
.goodsList .header .head_img {
  width: 100%;
  height: 100%;
  opacity: 1;
}
.tag_list {
  display: inline-flex;
  margin-top: 8px;
}
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
.one,
.two {
  background-color: #838bfe;
  color: #fff;
  font-size: 10px;
  padding: 4px 5px;
  border-radius: 3px;
  margin-left: 5px;
}

.van-col {
  font-size: 14px;
  margin-left: 5px;
  margin-top: 5px;
}

.van-tab--active:hover {
  color: #ee0a24;
}

.van-tab__pane {
  margin-bottom: 50px;
}
</style>
