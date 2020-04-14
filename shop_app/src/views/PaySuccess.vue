<template>
  <div class="success_pay">
    <van-nav-bar title="支付成功" left-arrow @click-left="onClickLeft" />
    <div class="pay-content">
      <img
        style="display: inherit; margin: 100px auto auto auto; width: 93px;"
        src="../../public/images/small-icon/支付成功.png"
        alt
      />
      <span class="text-title">支付成功</span>
      <p class="text-content">我们将立即为您发货，请注意查收</p>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    }
  }
}
</script>

<style scoped>
body {
  width: 100%;
  height: 100%;
  background-color: #f2f2f2;
}

.success_pay {
  width: 100%;
  height: 100%;
}

.van-icon-arrow-left:before {
  color: #000;
}

.van-nav-bar__title {
  font-size: 18px;
}

.pay-content .text-title {
  display: inherit;
  font-size: 18px;
  font-weight: 500;
  margin-top: 12px;
  color: #30d224;
  text-align: center;
}

.pay-content .text-content {
  text-align: center;
  /* margin-top: 13px; */
  padding: 13px 0;
  color: #797979;
  font-weight: 500;
}

.van-button--danger {
  border-radius: 21px;
}

.van-button {
  width: 50%;
  left: 93px;
  top: 60px;
}
</style>
