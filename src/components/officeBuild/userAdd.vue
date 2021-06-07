<template>
  <Form :model="formItem" :label-width="80">
    <FormItem label="账号">
      <Input v-model="formItem.username" placeholder="请输入账号"></Input>
    </FormItem>

    <FormItem label="密码">
      <Input v-model="formItem.password" type="password" placeholder="请输入密码"></Input>
    </FormItem>
    <FormItem>
      <Button type="primary">提交</Button>
    </FormItem>
  </Form>

</template>
<script>
  export default {
    data () {
      return {
        formItem: {
          password: '',
          username: ''
        }
      }
    }
  }
</script>
