<template>
  <div class="goodsdesc">
    <van-nav-bar
      title="商品详情"
      left-arrow
       @click-left="onClickLeft"
    />
    <van-swipe :autoplay="3000">
      <van-swipe-item v-for="(item, index) in images" :key="index">
        <img :src="item.goods_imgs" style="width:100%" />
      </van-swipe-item>
    </van-swipe>
    <div class="goods-msg">
      <span class="price">￥<em>{{goodsMsg.good_price}}</em></span>
      <div class="desc">
        <h1>{{goodsMsg.good_title}}</h1>
      </div>
    </div>
    <div>
      <div class="goods-msg head">
        <h4 style="font-size: 14px;">商品信息</h4>
      </div>
      <div class="goods-msg-image">
        <img v-for="(item, index) in descimgs" :key="index" :src="item.img" alt="">
      </div>
    </div>
    <van-popup
    v-model="show"
    position="bottom"
    closeable
    close-icon="close"
    :style="{ height: '45%' }"
    >
    <div class="p-head">
      <div>
        <img class="p-img" :src="goodsMsg.good_avator" alt="">
        <p class="p-price">￥<em>{{goodsMsg.good_price}}</em></p>
        <p class="p-prop">
          <span>已选</span> 大气黑色 流苏包
        </p>
      </div>
    </div>
    <div class="p-color">
      <div class="color">颜色:</div>
      <div class="color-choice">
        <span v-for="(item,index) in goodsMsg.good_attr" :key="index" @click="attrBtn(index)" class="p-choice">{{item}}</span>
      </div>
    </div>
    <div class="p-count">
      <p class="count">数量:<van-stepper v-model="value" /></p>
    </div>
    <van-button class="add" type="danger" @click="addCart">确认</van-button>
    </van-popup>
    <van-goods-action>
    <van-goods-action-icon icon="chat-o" text="客服" color="#07c160" />
    <van-goods-action-icon icon="cart-o" text="购物车" />
    <van-goods-action-button @click="onClickButton" type="warning" text="加入购物车"/>
    <van-goods-action-button type="danger" text="立即购买" @click="onClickButton"/>
    </van-goods-action>
  </div>
</template>

<script>
export default {
  data () {
    return {
      images: [],
      show: false,
      value: 1,
      data: [],
      descimgs: [],
      goodsMsg: [],
      good_attr: ''
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    async getImages () {
      let id = window.sessionStorage.getItem('goodId')
      let { data: res } = await this.$http.get(`/goodsdesc?id=` + id)
      this.images = res.data
    },
    async getGoodsImgs () {
      let id = window.sessionStorage.getItem('goodId')
      let { data: res } = await this.$http.get('/goodsdescimgs?id=' + id)
      this.descimgs = res.data
    },
    async getGoodsMsg () {
      let id = window.sessionStorage.getItem('goodId')
      let { data: res } = await this.$http.get('/goodsmesg?id=' + id)
      this.goodsMsg = res.data[0]
      this.goodsMsg.good_attr = this.goodsMsg.good_attr.split(',')
      console.log(this.goodsMsg.good_attr)
    },
    attrBtn (i) {
      this.good_attr = this.goodsMsg.good_attr[i]
    },
    async addCart () {
      let id = window.sessionStorage.getItem('goodId')
      // console.log(id, this.good_attr, this.value)
      const { data: res } = await this.$http.post('/cartadd', {
        id: id,
        attr: this.good_attr,
        number: this.value
      })
      console.log(res)
      this.$router.push('/cart')
    },
    onClickButton () {
      this.show = true
    }
  },
  created () {
    this.getImages()
    this.getGoodsImgs()
    this.getGoodsMsg()
  }
}
</script>

<style scoped>
.goodsdesc {
  width: 100%;
  height: 100%;
  padding-bottom: 50px;
}

.goods-msg {
  padding-top: 16px;
  padding-bottom: 0;
  position: relative;
  padding: 0 10px;
  line-height: 20px;
  margin-bottom: 5px;
  font-size: 12px;
}

.goods-msg .price {
  font-family: JDZH-Regular;
    font-size: 16px;
    line-height: 30px;
    font-size: 22px;
    color: #f2270c;
    display: inline-block;
}

.goods-msg .desc h1 {
  font-weight: 700;
    line-height: 24px;
    padding-right: 0;
    min-height: 36px;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
    position: relative;
    color: #333;
    overflow: hidden;
    font-size: 16px;
}

.goods-msg-image img {
  width: 100%;
}

.p-head {
    height: 70px;
    padding: 0 0 10px 110px;
    background-color: #fff;
    position: relative;
    line-height: 46px;
    font-size: 16px;
    color: #333;
}

.p-img {
  position: absolute;
    left: 10px;
    border-radius: 2px;
    width: 90px;
    height: 90px;
}

.p-price {
  display: inline-block;
    height: 40px;
    line-height: 40px;
    color: #e4393c;
    font-size: 10px;
}

.p-prop {
  word-break: break-all;
    font-size: 12px;
    color: #333;
    line-height: 1.4em;
    padding-right: 10px;
}

.p-prop span {
  color: #999;
}

.p-color .color {
  font-size: 12px;
  color: #999;
  margin: 0 10px;
  height: 40px;
  line-height: 40px;
}

.color-choice {
  overflow: hidden;
  margin-bottom: 3px;
}

.p-choice {
  float: left;
  display: inline-block;
  padding: 0 10px;
  min-width: 20px;
  max-width: 270px;
  overflow: hidden;
  height: 30px;
  line-height: 30px;
  text-align: center;
  margin-left: 10px;
  margin-bottom: 10px;
  border-radius: 4px;
  color: #333;
  background-color: #f7f7f7;
  font-size: 14px;
}

.p-choice:hover {
  background-color: #ff2000;
  color: #fff;
}

.p-count {
    padding: 0 10px 13px;
}

.count {
  font-size: 12px;
  color: #999;
  height: 31px;
  line-height: 31px;
}

.van-stepper {
    display: inline-block;
    position: absolute;
    left: 265px;

}

.add {
  top: 27px;
  width: 375px;
}

/*
.van-goods-action {
  z-index: 3001;
} */
</style>
