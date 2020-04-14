<template>
  <div class="app">
    <div class="regist">
      <van-nav-bar title="注册" left-arrow @click-left="onClickLeft" />
      <van-cell-group>
        <van-field
          v-model="telephone"
          required
          clearable
          label="手机号"
          left-icon="lock"
          placeholder="请输入账号"
        />

        <van-field
          v-model="password"
          type="password"
          label="密码"
          left-icon="lock"
          placeholder="请输入密码"
          required
        />

        <van-field
          v-model="password_o"
          type="password"
          label="确认密码"
          left-icon="lock"
          placeholder="请输入确认密码"
          required
        />
      </van-cell-group>

      <van-button class="login-btn" type="danger" @click="regist">注册</van-button>
      <van-button class="login-btn" type="warning" @click="login">已有账号?点击登录</van-button>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      telephone: '',
      password: '',
      password_o: ''
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    login () {
      this.$router.push('/login')
    },
    async regist () {
      if (this.password === this.password_o) {
        let { data: res } = await this.$http.post(
          '/regist',
          {
            telephone: this.telephone,
            password: this.password
          }
        )

        console.log(res)

        this.$toast.success('注册成功')
        this.$router.push('/login')
      } else {
        alert('两次密码不一致')
      }
    }
  }
}
</script>

<style>
.app {
  padding-bottom: 60px;
}

.regist .van-cell-group {
  margin-top: 100px;
}

.regist .login-btn {
  margin-top: 50px;
  width: 70%;
  margin-left: 50px;
}

.van-field__label {
  text-align: center;
}
</style>
