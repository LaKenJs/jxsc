<template>
  <div>
    <!-- 返回导肮 -->
    <van-nav-bar title="购物车" left-arrow @click-left="onClickLeft" />
    <!-- 循环单元格 -->
    <div style="margin-bottom: 140px;">
    <van-swipe-cell v-for="(item,index) in cart" :key="index">
      <!-- 单元格内容 -->
      <van-cell :border="false">
        <van-checkbox class="check"  @change="checkChange(index)" v-model="item.goods_ischeck"></van-checkbox>
        <van-card
         :price="item.goods_price"
         :title="item.goods_name"
         :thumb="item.goods_img"
        />
        <van-stepper
         v-model="item.goods_num"
         @change="stepChange(index)"
         min="1"
         max="20" />
      </van-cell>
     <template slot="right">
      <van-button square type="danger" text="删除" @click="delGoods(item.id)" />
      </template>
    </van-swipe-cell>
    </div>

    <!-- 底部 -->
    <van-submit-bar style="margin-bottom: 50px;" :price="totalPrice" button-text="提交订单" @submit="$router.push('/order/create')">
      <van-checkbox v-model="checkedAll" @click="checkAll">全选</van-checkbox>
      <span slot="tip">
        你的收货地址不支持同城送,
        <span>修改地址</span>
      </span>
    </van-submit-bar>
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
      active: 2,
      cart: [],
      totalPrice: 0,
      // 全选
      checkedAll: false
    }
  },
  methods: {
    // 返回上一级
    onClickLeft () {
      this.$router.go(-1)
    },
    async getCart () {
      let { data: res } = await this.$http.get('/cart')
      this.cart = res.result
      console.log(this.cart)
    },
    // 复选框选中
    async checkChange (ind) {
      this.totalPrice = 0
      this.updateCarts(ind)
      this.checkedAll = true
      for (let index = 0; index < this.cart.length; index++) {
        if (this.cart[index].goods_ischeck === false) {
          this.checkedAll = false
        } else {
          this.totalPrice += this.cart[index].goods_num * this.cart[index].goods_price * 100
        }
      }
    },
    // 步进器
    async stepChange (ind) {
      this.updateCarts(ind)
      this.checkChange(ind)
    },
    // 修改数据
    async updateCarts (i) {
      let updateInfo = {
        good_id: this.cart[i].id,
        good_num: this.cart[i].goods_num,
        is_ok: this.cart[i].goods_ischeck
      }
      console.log(updateInfo)
      await this.$http.post('/updateCart', updateInfo)
    },
    // 全选
    checkAll () {
      if (this.checkedAll !== true) {
        for (let index = 0; index < this.cart.length; index++) {
          this.cart[index].is_ok = true
        }
      } else {
        for (let index = 0; index < this.cart.length; index++) {
          this.cart[index].is_ok = false
        }
      }
    },
    async delGoods (id) {
      let { data: res } = await this.$http.delete('/delcart/' + id)
      console.log(res)
      if (res.ok === 1) {
        this.getCart()
        this.$toast.success('删除成功')
      }
    }
  },
  created () {
    this.getCart()
  }
}
</script>

<style scoped>
.van-stepper {
  position: absolute;
  top: 40%;
  right: 5%;
}

.check {
  position: absolute;
  z-index: 9999;
  margin-left: 10px;
  margin-top: 39px;
}

.allCheck {
  margin-left: 10px;
}

.van-card__header {
  margin-left: 32px;
}

#goodsdesc_card .van-card__thumb {
  width: 90px;
  height: 90px;
}

.van-button--normal[data-v-c028c34c] {
  padding: 32px 14px 71px 15px;
  margin-top: 8px;
  height: 100px;
}

.hui {
  width: 100%;
  height: 20px;
  background-color: #f2f2f2;
}
.van-cell {
  margin-top: 15px;
  padding: 0px 0px;
  background-color: white;
  position: relative;
}
.miaoshu {
  width: 93%;
  float: right;
}
.fuxuan {
  width: 25px;
  height: 106px;
  float: left;
  margin-top: 50px;
  /* margin-left: 3px; */
}
.van-button--normal {
  padding: 33px 14px 71px 15px;
  margin-top: 15px;
}
</style>
