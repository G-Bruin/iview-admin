<template>
  <div>
    <Form >
      <FormItem prop="user">
        <div style="margin-top: 6px">
          标题：
          <Input placeholder="请输入标题" v-model="title" style="width: auto">
          </Input>

          <Button type="primary" shape="circle" icon="ios-search" @click="search()" style="margin-left:1cm;" ></Button>
        </div>
      </FormItem>
    </Form>
    <Table border :columns="columns" :data="data">
      <template slot-scope="{ row }" slot="name">
        <strong>{{ row.name }}</strong>
      </template>
      <template slot-scope="{ row, index }" slot="action">
        <Button type="primary" size="small" style="margin-right: 5px" @click="show(index)">预览</Button>
        <Button type="primary" size="small" style="margin-right: 5px" @click="push(row)">修改</Button>
<!--        <Button type="error" size="small" @click="remove(index)">下架</Button>-->
      </template>
    </Table>
    <template>
      <Card>
        <div style="text-align:center">
<!--          <Page :total="100" :page-size="page"  :on-change="jumpPage"/>-->

            <Page :total="total"  :page-size="page"
                  @on-change="changePage" show-total />
          </div>
      </Card>
    </template>

  </div>
</template>
<script>
import axios from '@/libs/api.request'
export default {
  data () {
    return {
      columns: [
        {
          title: '标题',
          key: 'title'
        },
        {
          title: '类型',
          key: 'type'
        },
        {
          title: '物业',
          key: 'property'
        },
        {
          title: '日租金均价',
          key: 'day_rent'
        },
        {
          title: '竣工年月',
          key: 'complete_day'
        },
        {
          title: '开发商',
          key: 'developer'
        },
        {
          title: '销售联系电话',
          key: 'phone'
        },
        {
          title: '地址',
          key: 'address'
        },
        {
          title: '操作',
          slot: 'action',
          width: 150,
          align: 'center'
        }
      ],
      data: [
        // {
        //   name: 'John Brown',
        //   age: 18,
        //   address: 'New York No. 1 Lake Park'
        // },
        // {
        //   name: 'Jim Green',
        //   age: 24,
        //   address: 'London No. 1 Lake Park'
        // },
        // {
        //   name: 'Joe Black',
        //   age: 30,
        //   address: 'Sydney No. 1 Lake Park'
        // },
        // {
        //   name: 'Jon Snow',
        //   age: 26,
        //   address: 'Ottawa No. 2 Lake Park'
        // }
      ],
      per_page: 10,
      total: 0,
      page: 1,
      title: ''
    }
  },
  mounted () {
    this.getList(this.page)
  },
  methods: {

    changePage (page) {
      console.log(page)
      this.getList(page)
    },

    search () {
      this.getList(1)
    },

    push (row) {
      console.log(row)
      this.$router.push({ name: 'officeBuild-edit', query: { id: row.id } })
    },

    getList (page) {
      let _this = this
      axios.request({
        url: '/jd/admin/office/building',
        method: 'get',
        params: { 'title': _this.title, 'page': page, 'per_page': _this.per_page }
      })
        .then(function (response) {
          let data = response.data.data
          _this.total = data.total
          _this.data = data.data
        })
    }
  }
}
</script>
