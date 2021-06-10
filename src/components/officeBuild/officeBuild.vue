<template>
  <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="190">

    <FormItem label="写字楼名称" prop="title">
      <Input v-model="formValidate.title" placeholder="请输入写字楼名称"  ></Input>
    </FormItem>

    <FormItem label="写字楼经度" prop="longitude">
      <Input v-model="formValidate.longitude" placeholder="请输入写字楼经度"  ></Input>
    </FormItem>

    <FormItem label="写字楼纬度" prop="latitude">
      <Input v-model="formValidate.latitude" placeholder="请输入写字楼纬度"  ></Input>
    </FormItem>

    <FormItem label="项目图片，限6张图片" prop="picture">
      <cbUpload ref="editor5" v-model="formValidate.picture" ></cbUpload>
    </FormItem>

    <FormItem label="出租房源面积信息" prop="rentable_area">
      <Table border :columns="formValidate.columns" :data="formValidate.rentable_area">
        <template slot-scope="{ row }" slot="name">
          <strong>{{ row.name }}</strong>
        </template>
        <template slot-scope="{ row, index }" slot="action">
<!--          <Button type="primary" size="small" style="margin-right: 5px" @click="add()">添加</Button>-->
          <Button type="error" size="small" @click="remove(index)">删除</Button>
        </template>
      </Table>
      <Button type="primary" size="small" style="margin-top: 10px" @click="add()">添加面积信息</Button>
    </FormItem>

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
      <Input v-model="formValidate.floor" placeholder="请输入写字楼楼层"></Input>
    </FormItem>

    <FormItem label="电梯" prop="elevator">
      <Input v-model="formValidate.elevator" placeholder="请输入电梯部数"></Input>
    </FormItem>

    <FormItem label="物业" prop="property">
      <Input v-model="formValidate.property" placeholder="请输入物业公司"></Input>
    </FormItem>

    <FormItem label="物业管理费，单位(元/㎡/月)" prop="property_free">
      <Input v-model="formValidate.property_free" placeholder="请输入物业管理费"></Input>
    </FormItem>

    <FormItem label="日租金均价，单位(元/㎡·天)" prop="day_rent">
      <Input v-model="formValidate.day_rent" placeholder="请输入日租金均价"></Input>
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

    <FormItem label="每月车位费，单位(元)" prop="parking_free">
      <Input v-model="formValidate.parking_free" placeholder="请输入每月车位费"></Input>
    </FormItem>

    <FormItem label="实用率，单位(%)" prop="utility_rate">
      <Input v-model="formValidate.utility_rate" placeholder="请输入实用率"></Input>
    </FormItem>

    <FormItem label="绿化率，单位(%)" prop="greening_rate">
      <Input v-model="formValidate.greening_rate" placeholder="请输入绿化率"></Input>
    </FormItem>

    <FormItem label="项目介绍" prop="introduce">
      <tinymce-editor ref="editor"  v-model="formValidate.introduce" :cache="false"></tinymce-editor>
    </FormItem>

    <FormItem label="周边酒店、餐饮、银行介绍" prop="hotel_etc">
      <tinymce-editor ref="editor2"  v-model="formValidate.hotel_etc" :cache="false" ></tinymce-editor>
    </FormItem>

    <FormItem label="周边交通介绍" prop="traffic">
      <tinymce-editor ref="editor3" v-model="formValidate.traffic" :cache="false"></tinymce-editor>
    </FormItem>

    <FormItem label="周边入驻企业" prop="company">
      <Input v-model="formValidate.company" placeholder="请输入周边入驻企业"></Input>
    </FormItem>

    <FormItem>
      <Button type="primary" @click="handleSubmit('formValidate')">提交</Button>
      <Button @click="handleReset('formValidate')" style="margin-left: 8px">重置</Button>
    </FormItem>

    <Modal v-model="modal12" draggable scrollable title="添加房源信息" @on-ok="ok2" @on-cancel="cancel2">
      <Form label-position="left" :label-width="100">
        <FormItem label="面积">
          <Input v-model="table_area"></Input>
        </FormItem>
        <FormItem label="日租金">
          <Input v-model="table_day_rent"></Input>
        </FormItem>
        <FormItem label="备注">
          <Input v-model="table_remark"></Input>
        </FormItem>
      </Form>

    </Modal>
  </Form>
</template>
<script>
import TinymceText from '../editor/editor'
import cbUpload from './upload'
import axios from '@/libs/api.request'

export default {
  data () {
    return {
      defaultImg: [],
      modal12: false,
      modal13: false,
      formValidate: {
        title: '',
        type: '',
        picture: [],
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
        columns: [
          {
            title: '面积',
            key: 'area'
          },
          {
            title: '日租金',
            key: 'day_rent'
          },
          {
            title: '备注',
            key: 'remark'
          },
          {
            title: '操作',
            slot: 'action',
            width: 150,
            align: 'center'
          }
        ],
        rentable_area: []
      },
      table_area: '',
      table_day_rent: '',
      table_remark: '',
      host: '',
      ruleValidate: {
        title: [
          { required: true, message: '请输入写字楼名称', trigger: 'blur' }
        ],

        picture: [
          { required: true, type: 'array', min: 1, message: '请上传项目图片', trigger: 'change' },
          { type: 'array', max: 6, message: '最多请上传项目图片', trigger: 'change' }
        ],
        phone: [
          { required: true, message: '请输入手机号', trigger: 'blur' }
        ],
        type: [
          { required: true, message: '请输入写字楼类型', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '请输入写字楼地址', trigger: 'blur' }
        ],
        floor: [
          { required: true, message: '请输入写字楼楼层', trigger: 'blur' }
        ],
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
        ],
        longitude: [
          { required: true, message: '经度不能为空', trigger: 'blur' }
        ],
        latitude: [
          { required: true, message: '纬度不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    handleSubmit (name) {
      let _this = this
      this.$refs[name].validate((valid) => {
        if (valid) {
          let formValidate = this.formValidate
          axios.request({
            url: '/jd/admin/office/building',
            method: 'post',
            data: formValidate
          })
            .then(function (response) {
              _this.$Message.success('发布成功')
              _this.$router.push({
                name: 'home'
              })
            })
        } else {
          this.$Message.error('Fail!')
        }
      })
    },
    handleReset (name) {
      this.$refs[name].resetFields()
    },
    remove (index) {
      this.formValidate.rentable_area.splice(index, 1)
    },
    add () {
      this.modal12 = true
    },
    ok2 () {
      if (this.formValidate.rentable_area.length > 5) {
        this.$Message.error('不能超过6个信息')
        return
      }
      const data = {
        area: this.table_area,
        day_rent: this.table_day_rent,
        remark: this.table_remark
      }
      this.formValidate.rentable_area.push(data)
      this.cancel2()
    },
    cancel2 () {
      this.table_area = ''
      this.table_day_rent = ''
      this.table_remark = ''
    }
  },
  components: {
    'tinymce-editor': TinymceText,
    'cbUpload': cbUpload
  }
}
</script>
