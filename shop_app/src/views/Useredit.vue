<template>
  <div class="user-edit">
    <van-nav-bar title="修改信息" left-arrow @click-left="onClickLeft" />
    <div class="edit-content edit-username">
        <input v-model="username" type="text" placeholder="请输入新用户名">
        <div>
            <p>修改内容在5-8个子符之间</p>
        </div>
    </div>
    <div class="edit-content edit-password">
        <input v-model="password" type="text" placeholder="请输入新的密码">
        <div>
            <p>修改内容在8-16个子符之间</p>
        </div>
    </div>
    <van-button type="info" @click="editUser">确认修改</van-button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      username: '',
      password: ''
    }
  },
  methods: {
    onClickLeft () {
      this.$router.go(-1)
    },
    async editUser () {
      if (this.username.trim() === '' || this.password.trim() === '') {
        this.$toast('用户名或密码不能为空')
        return
      }
      let { data: res } = await this.$http.put('/editUser', {
        telephone: window.sessionStorage.getItem('telephone'),
        username: this.username,
        password: this.password
      })
      console.log(res)
      if (res.ok === 1) {
        this.$toast.success('修改成功')
      }
    }
  }
}
</script>

<style scoped>
.user-edit {
    width: 375px;
    height: 667px;
    background-color: #f2f2f2;
}

.user-edit .edit-content input {
    background: none;
    width: 347px;
    height: 40px;
    border: 1px solid #ddd;
    border-radius: 2px;
    padding: 4px 9px;
    margin-left: 3px;
    line-height: 40px;
    font-size: 16px;
    display: block;
}

.edit-content p {
    width: 100%;
    text-indent: 8px;
    font-size: 12px;
    color: #666;
    text-align: left;
    padding: 5px 0px 10px;
}

.van-button--info {
    width: 92%;
    margin-top: 50px;
    margin-left: 9px;
}
</style>
