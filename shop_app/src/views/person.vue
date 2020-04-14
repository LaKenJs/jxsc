<template>
  <div class="person">
    <van-nav-bar title="个人信息" left-arrow @click-left="onClickLeft" />
<div class="person-content" :data="userMsg">
      <div class="user-content">
      <h2>用户名</h2>
      <div class="info-avator" @click="editName">
        <div class="user-name">{{userMsg.user_name}}</div>
      </div>
    </div>
    <div class="user-content user-tel">
      <h2>手机号</h2>
      <div class="info-avator" @click="editTel">
        <div class="user-name">{{userMsg.telephone}}</div>
      </div>
    </div>
    <div class="user-content user-psd">
      <h2>密码</h2>
      <div class="info-avator" @click="editPsd">
        <div class="user-name" style="font-size: 0.8rem;">修改</div>
      </div>
    </div>
</div>

    <van-button class="btn-logout" type="danger" @click="logout">退出登录</van-button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      userMsg: []
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    logout () {
      window.sessionStorage.removeItem('token')
      this.$router.push('/login')
    },
    editName () {
      this.$router.push('/user-edit')
    },
    editTel () {
      this.$router.push('/user-edit')
    },
    editPsd () {
      this.$router.push('/user-edit')
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
.person {
  width: 375px;
  height: 667px;
  background-color: #f2f2f2
}

.user-content {
  cursor: pointer;
  margin-top:.8rem;
  padding: .6rem .4rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: 1px solid #ddd;
  background-color: #fff;
}

.user-content h2 {
  font-size: 1rem;
  color: #333;
  text-align: left;
  font-weight: 600;
  display: flex;
  justify-content: center;
  align-items: center;
}

.user-content .info-avator {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 0.7rem;
  color: #ccc;
  text-align: left;
}

.van-button--danger {
  margin-top: 50px;
  margin-left: 9px;
  width: 96%;
}
</style>
