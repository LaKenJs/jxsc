<template>
  <div class="app">
    <div class="login">
      <van-nav-bar title="登录" left-arrow @click-left="onClickLeft" />
      <van-cell-group>
        <van-field
          v-model="telephone"
          required
          clearable
          label="用户名"
          left-icon="manager"
          placeholder="请输入用户名"
        />

        <van-field
          v-model="password"
          type="password"
          clearable
          label="密码"
          left-icon="lock"
          placeholder="请输入密码"
          required
        />
      </van-cell-group>

      <van-button class="login-btn" type="danger" @click="login">登录</van-button>
      <van-button class="login-btn" type="warning" @click="regist">没有账号?点击注册</van-button>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      telephone: '',
      password: ''
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    async login () {
      let { data: res } = await this.$http.post('/login', {
        telephone: this.telephone,
        password: this.password
      })
      console.log(this.telephone)
      console.log(res)
      if (res.ok !== 1) {
        window.sessionStorage.removeItem('token')
        this.$toast('登录失败，用户名或密码错误')
        this.telephone = ''
        this.password = ''
      }

      if (res.ok === 1) {
        sessionStorage.setItem('telephone', this.telephone)
        window.sessionStorage.setItem('token', res.token)
        this.$toast('登录成功')
        this.$router.push('/')
      }
    },
    regist () {
      this.$router.push('/regist')
    }
  }
}
</script>

<style>
.app {
  padding-bottom: 60px;
}

.login .van-cell-group {
  margin-top: 100px;
}

.login .login-btn {
  margin-top: 50px;
  width: 70%;
  margin-left: 50px;
}

.van-field__label {
  text-align: center;
}
</style>
