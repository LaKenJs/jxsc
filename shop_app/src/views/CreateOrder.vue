<template>
  <div class="create-order">
    <van-nav-bar title="填写订单" left-arrow @click-left="onClickLeft" />
    <van-cell is-link @click="createAdress">收货地址</van-cell>
    <div class="order-price">
      <div class="sum">
        <span style="float: left;color: #a0a0a0;">商品合计:</span>
        <span style=" float: left;margin-left: 15px;">￥{{this.totalPrice | money}}</span>
      </div>
      <div class="fare">
        <span style="float: left;color: #a0a0a0;">运费:</span>
        <span style=" float: left; margin-left: 15px;">￥{{this.price_o | money}}</span>
      </div>
    </div>

    <van-card
      v-for="(item, index) in goods"
      :key="index"
      :num="item.goods_num"
      :price="item.goods_price"
      :desc="item.goods_attrs"
      :title="item.goods_desc"
      :thumb="item.goods_img"
    />

    <div class="order-pay">
      <div class="pay-price">
        <span>应付:</span>
        <span style="color: #e60000;">￥{{totalPrice | money}}</span>
      </div>
      <van-button type="danger" @click="pay">立即支付</van-button>
    </div>
  </div>
</template>

<script>
import '../filter'
export default {
  data () {
    return {
      price: 80,
      price_o: 10,
      goods: [],
      totalPrice: 0
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    createAdress () {
      this.$router.push('/order/adress')
    },
    async getCart () {
      let { data: res } = await this.$http.get('/cartdata')
      console.log(res)
      this.goods = res.result
      for (let i = 0; i < res.result.length; i++) {
        this.totalPrice += this.goods[i].goods_num * this.goods[i].goods_price
      }
    },
    pay () {
      this.$router.push('/paysuccess')
    }
  },
  created () {
    this.getCart()
  }

}
</script>

<style scoped>
body {
  width: 100%;
  height: 100%;
  background: #f2f2f2;
}
.van-icon-arrow-left:before {
  color: #000;
  font-weight: 800;
}

/* .van-cell { */
  /* margin: 10px 0;
  height: 100px;
  line-height: 80px; */
/* } */

.van-cell__right-icon {
  line-height: 80px;
}

.van-cell__value--alone {
  font-size: 18px;
  color: #a0a0a0;
      margin: 10px 0;
    height: 88px;
    line-height: 65px;
}

.order-price {
  height: 100px;
  background: #fff;
}

.order-price .sum {
  width: 350px;
  margin: 0 10px;
  border-bottom: 1px solid #ccc;
  height: 50%;
  line-height: 50px;
}

.order-price .fare {
  height: 50%;
  line-height: 50px;
  width: 350px;
  margin: 0 10px;
}

.van-image__img {
  width: 90px !important;
  height: 90px !important;
}

.van-card__num {
  font-weight: 600;
  font-size: 14px;
  float: right;
}

.order-pay {
  position: fixed;
  bottom: 0;
  display: inherit;
  /* color: #fff; */
  background: #fff;
  width: 100%;
}

.pay-price {
  float: left;
  line-height: 42px;
  margin-left: 16px;
}

.van-button {
  float: right;
  width: 30%;
}
</style>
