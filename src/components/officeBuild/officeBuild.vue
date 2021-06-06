<template>
  <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="190">

    <FormItem label="写字楼名称" prop="title">
      <Input v-model="formValidate.title" placeholder="请输入写字楼名称"  ></Input>
    </FormItem>

    <!-- todo 上传 picture position_picture -->
    <FormItem label="销售手机号" prop="phone">
      <Input v-model="formValidate.phone" placeholder="请输入手机号"></Input>
    </FormItem>

    <FormItem label="类型" prop="type">
      <Input v-model="formValidate.type" placeholder="请输入写字楼等级类型"></Input>
    </FormItem>

    <FormItem label="地址" prop="address">
      <Input v-model="formValidate.address" placeholder="请输入写字楼地址"></Input>
    </FormItem>

    <FormItem label="楼层" prop="floor">
      <Input v-model="formValidate.address" placeholder="请输入写字楼楼层"></Input>
    </FormItem>

    <FormItem label="电梯" prop="elevator">
      <Input v-model="formValidate.elevator" placeholder="请输入电梯部数"></Input>
    </FormItem>

    <FormItem label="物业" prop="property">
      <Input v-model="formValidate.property" placeholder="请输入物业公司"></Input>
    </FormItem>

    <FormItem label="物业管理费" prop="parking_free">
      <Input v-model="formValidate.property" placeholder="请输入物业管理费，单位（元/㎡/月）"></Input>
    </FormItem>

    <FormItem label="日租金均价" prop="day_rent">
      <Input v-model="formValidate.day_rent" placeholder="请输入日租金均价，单位（元/㎡·天 ）"></Input>
    </FormItem>

    <FormItem label="竣工年月" prop="complete_day">
      <Input v-model="formValidate.complete_day" placeholder="请输入竣工年月"></Input>
    </FormItem>

    <FormItem label="开发商" prop="developer">
      <Input v-model="formValidate.developer" placeholder="请输入开发商"></Input>
    </FormItem>

    <FormItem label="总建筑面积" prop="area">
      <Input v-model="formValidate.area" placeholder="请输入总建筑面积"></Input>
    </FormItem>

    <FormItem label="标准层面积" prop="marker_area">
      <Input v-model="formValidate.marker_area" placeholder="请输入标准层面积"></Input>
    </FormItem>

    <FormItem label="净高" prop="clear_height">
      <Input v-model="formValidate.clear_height" placeholder="请输入净高"></Input>
    </FormItem>

    <FormItem label="停车位" prop="parking_space">
      <Input v-model="formValidate.parking_space" placeholder="请输入停车位"></Input>
    </FormItem>

    <FormItem label="每月车位费" prop="parking_free">
      <Input v-model="formValidate.parking_free" placeholder="请输入每月车位费"></Input>
    </FormItem>

    <FormItem label="实用率" prop="utility_rate">
      <Input v-model="formValidate.utility_rate" placeholder="请输入实用率"></Input>
    </FormItem>

    <FormItem label="绿化率" prop="greening_rate">
      <Input v-model="formValidate.greening_rate" placeholder="请输入绿化率"></Input>
    </FormItem>

    <FormItem label="绿化率" prop="rentable_area">
      <Input v-model="formValidate.rentable_area" placeholder="请输入数组出租面积"></Input>
    </FormItem>

    <FormItem label="项目介绍" prop="introduce">
      <Input v-model="formValidate.introduce" placeholder="请输入项目介绍"></Input>
    </FormItem>

    <FormItem label="周边酒店、餐饮、银行介绍" prop="hotel_etc">
      <Input v-model="formValidate.hotel_etc" placeholder="周边酒店、餐饮、银行介绍"></Input>
    </FormItem>

<!--    <FormItem label="周边餐饮" prop="dining">-->
<!--      <Input v-model="formValidate.dining" placeholder="请输入周边餐饮"></Input>-->
<!--    </FormItem>-->

<!--    <FormItem label="周边银行" prop="bank">-->
<!--      <Input v-model="formValidate.bank" placeholder="请输入周边银行"></Input>-->
<!--    </FormItem>-->

    <FormItem label="周边交通介绍" prop="traffic">
      <Input v-model="formValidate.traffic" placeholder="请输入周边交通介绍"></Input>
    </FormItem>

<!--    <FormItem label="周边公交车站" prop="bus">-->
<!--      <Input v-model="formValidate.bus" placeholder="请输入周边公交车站"></Input>-->
<!--    </FormItem>-->

    <FormItem label="周边入驻企业" prop="company">
      <Input v-model="formValidate.company" placeholder="请输入周边入驻企业"></Input>
    </FormItem>

    <FormItem>
      <Button type="primary" @click="handleSubmit('formValidate')">提交</Button>
      <Button @click="handleReset('formValidate')" style="margin-left: 8px">重置</Button>
    </FormItem>
  </Form>
</template>
<script>
export default {
  data () {
    return {
      formValidate: {
        title: '',
        type: '',
        address: '',
        floor: '',
        phone: '',
        property: '',
        property_free: '',
        day_rent: '',
        parking_space: '',
        parking_free: '',
        introduce: '',
        hotel_etc: '',
        traffic: '',
        // interest: [],
        date: '',
        time: '',
        desc: ''
      },
      ruleValidate: {
        title: [
          { required: true, message: '请输入写字楼名称', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '请输入手机号', trigger: 'blur' }
        ],
        type: [
          { required: true, message: '请输入写字楼类型', trigger: 'blur' }
          // { type: 'email', message: 'Incorrect email format', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '请输入写字楼地址', trigger: 'blur' }
        ],
        floor: [
          { required: true, message: '请输入写字楼楼层', trigger: 'blur' }
        ],
        // interest: [
        //   { required: true, type: 'array', min: 1, message: 'Choose at least one hobby', trigger: 'change' },
        //   { type: 'array', max: 2, message: 'Choose two hobbies at best', trigger: 'change' }
        // ],
        property: [
          { required: true, message: '请输入物业公司', trigger: 'blur' }
        ],
        property_free: [
          { required: true, message: '物业管理费', trigger: 'blur' }
        ],
        day_rent: [
          { required: true, message: '请输入日租金均价，单位（元/㎡·天 ）', trigger: 'blur' }
        ],
        parking_space: [
          { required: true, message: '物业管理费', trigger: 'blur' }
        ],
        parking_free: [
          { required: true, message: '请输入停车位数量', trigger: 'blur' }
        ],
        introduce: [
          { required: true, message: '请输入项目介绍', trigger: 'blur' }
        ],
        hotel_etc: [
          { required: true, message: '周边酒店、餐饮、银行介绍', trigger: 'blur' }
        ],
        traffic: [
          { required: true, message: '周边交通介绍', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    handleSubmit (name) {
      this.$refs[name].validate((valid) => {
        if (valid) {
          this.$Message.success('Success!')
        } else {
          this.$Message.error('Fail!')
        }
      })
    },
    handleReset (name) {
      this.$refs[name].resetFields()
    }
  }
}
</script>
