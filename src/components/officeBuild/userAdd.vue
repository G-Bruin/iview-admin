<template>
  <Form ref="formValidate" :model="formValidate" :rules="ruleValidate"  :label-width="80">
    <FormItem label="账号" prop="username">
      <Input v-model="formValidate.username" placeholder="请输入账号"></Input>
    </FormItem>

    <FormItem label="密码" prop="password">
      <Input v-model="formValidate.password" type="password" placeholder="请输入密码"></Input>
    </FormItem>
    <FormItem>
      <Button type="primary" @click="handleSubmit('formValidate')">提交</Button>
      <Button @click="handleReset('formValidate')" style="margin-left: 8px">重置</Button>
    </FormItem>
  </Form>

</template>
<script>
import axios from '@/libs/api.request'
// import HttpRequest from '@/libs/axios'

export default {
  data () {
    return {
      tableData: [],
      formValidate: {
        username: '',
        password: ''
      },
      ruleValidate: {
        username: [
          { required: true, message: '请输入账号', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    handleSubmit (name) {
      // let _this = this
      // let formValidate = _this.formValidate
      axios.request({
        url: '/api/admin/auth/login',
        method: 'post'
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })

        // this.$refs[name].validate((valid) => {
        //   if (valid) {
        //     this.$Message.success('Success!')
        //   } else {
        //     this.$Message.error('Fail!')
        //   }
        // })
    },
    handleReset (name) {
      this.$refs[name].resetFields()
    }
  }
}
</script>
