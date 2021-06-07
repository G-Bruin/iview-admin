<template>
  <div>
  <div class="demo-upload-list" v-for="item in uploadList" :key="item">
<!--    <template v-if="item.status === 'finished'">-->
      <img :src="item">
      <div class="demo-upload-list-cover">
<!--        <Icon type="ios-eye-outline" @click.native="handleView(item.name)"></Icon>-->
        <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
      </div>
<!--    </template>-->
<!--    <template v-else>-->
<!--      <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>-->
<!--    </template>-->
  </div>
  <Upload
    ref="upload"
    :show-upload-list="false"
    :default-file-list="uploadList"
    :on-success="handleSuccess"
    :format="['jpg','jpeg','png']"
    :max-size="2048"
    :on-format-error="handleFormatError"
    :on-exceeded-size="handleMaxSize"
    :before-upload="handleBeforeUpload"
    multiple
    type="drag"
    action="http://127.0.0.1:8701/admin/office/building"
    style="display: inline-block;width:58px;">
    <div style="width: 58px;height:58px;line-height: 58px;">
      <Icon type="ios-camera" size="20"></Icon>
    </div>
  </Upload>
  <Modal title="View Image" v-model="visible">
    <img :src="'https://o5wwk8baw.qnssl.com/' + imgName + '/large'" v-if="visible" style="width: 100%">
  </Modal>
  </div>
</template>
<script>
export default {
  data () {
    return {
      defaultList: [
        // {
        //   'name': 'a42bdcc1178e62b4694c830f028db5c0',
        //   'url': 'https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar'
        // },
        // {
        //   'name': 'bc7521e033abdd1e92222d733590f104',
        //   'url': 'https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar'
        // }
      ],
      imgName: '',
      visible: false,
      uploadList: []
    }
  },
  watch: {
    uploadList () {
      this.$emit('input', this.uploadList)
    }
  },
  methods: {
    handleView (name) {
      this.imgName = name
      this.visible = true
    },
    handleRemove (file) {
      this.uploadList.splice(this.uploadList.indexOf(file), 1)
    },
    handleSuccess (res, file) {
      file.url = 'https://ss.lanqb.com/084b0003-c9cc-4997-8336-d3cfbbd7784e.jpg?imageView2/2/w/820/h/0'
      this.uploadList.push(file.url)
    },
    handleFormatError (file) {
      this.$Notice.warning({
        title: '格式不正确',
        desc: 'File format of ' + file.name + ' is incorrect, please select jpg or png.'
      })
    },
    handleMaxSize (file) {
      this.$Notice.warning({
        title: '最大限制10M',
        desc: 'File  ' + file.name + ' is too large, no more than 2M.'
      })
    },
    handleBeforeUpload () {
      const check = this.uploadList.length < 6
      if (!check) {
        this.$Notice.warning({
          title: '不能超过6个'
        })
      }
      return check
    }
  }
  // mounted () {
  //   this.uploadList = this.$refs.upload.fileList
  // }
}
</script>
<style>
  .demo-upload-list{
    display: inline-block;
    width: 60px;
    height: 60px;
    text-align: center;
    line-height: 60px;
    border: 1px solid transparent;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
    position: relative;
    box-shadow: 0 1px 1px rgba(0,0,0,.2);
    margin-right: 4px;
  }
  .demo-upload-list img{
    width: 100%;
    height: 100%;
  }
  .demo-upload-list-cover{
    display: none;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0,0,0,.6);
  }
  .demo-upload-list:hover .demo-upload-list-cover{
    display: block;
  }
  .demo-upload-list-cover i{
    color: #fff;
    font-size: 20px;
    cursor: pointer;
    margin: 0 2px;
  }
</style>
