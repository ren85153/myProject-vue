<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item><i class="el-icon-lx-calendar"></i>首页</el-breadcrumb-item>
        <el-breadcrumb-item>SysDict管理</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <!-- 查询表单 -->
      <div>
        <el-form ref="searchForm" :inline="true" :model="searchForm" class="demo-form-inline">
          <el-form-item label="字典名称">
            <el-input v-model="searchForm.dictName" placeholder="字典名称"></el-input>
          </el-form-item>
          <el-form-item label="字典编码">
            <el-input v-model="searchForm.dictCode" placeholder="字典编码"></el-input>
          </el-form-item>
          <el-form-item label="组名">
            <el-input v-model="searchForm.groupName" placeholder="组名"></el-input>
          </el-form-item>
          <el-form-item label="组编码">
            <el-input v-model="searchForm.groupCode" placeholder="组编码"></el-input>
          </el-form-item>
          <el-form-item label="状态">
            <mySelect :model="searchForm.status" :groupCode="groupCode" :ignoreCodes="['3']" @changeSelectHandler="changeSelectStatusHandler('searchForm',$event)"></mySelect>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="searchSubmit">查询</el-button>
          </el-form-item>
		    </el-form>
      </div>
      <!-- 新增 -->
      <div>
        <el-button icon="el-icon-circle-plus" type="primary" @click="handleCreated('createForm')">新增</el-button>
      </div>
      <!-- 中部列表表格 -->
      <div>
        <el-table
          :data="tableData"
          highlight-current-row
          border
          @selection-change="handleSelectionChange"
          @current-change="handtable"
        >
          <!--<el-table-includeJS type="selection" width="50" align="center" v-if="gg?true:false"></el-table-includeJS>-->
          <!--<el-table-includeJS label="序号" type="index" width="50" align="center" :index="indexMethod"></el-table-includeJS>-->
          <el-table-column label="序号" type="index" width="50" align="center"></el-table-column>
          <el-table-column
            v-for="(itemtest, index) in title"
            :key="index"
            v-if="!itemtest.operate"
            :prop="itemtest.prop"
            align="center"
            :label="itemtest.label"
            :formatter="itemtest.formatter"
          ></el-table-column>
          <el-table-column v-else :label="itemtest.label" :prop="itemtest.prop" align="center">
            <template slot-scope="scope">
              <slot :name="itemtest.prop" :$index="scope.$index" :row="scope.row"></slot>
              <!-- 对应slot name -->
            </template>
          </el-table-column>
          <el-table-column label="操作" fixed="right" width="200">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <!-- 分页 -->
        <!--<span class="demonstration">完整功能</span>-->
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page= currentPage
          :page-sizes="[10, 20, 30, 40]"
          :page-size= pagesize
          layout="total, sizes, prev, pager, next, jumper"
          :total= total
          :hide-on-single-page=false>
        </el-pagination>
      </div>
      <!-- 新增,编辑表单 -->
      <div>
        <el-dialog :title =dialogTitle :visible.sync="dialogFormVisible" :submitType= submitType :before-close="handleClose">
          <el-form :inline="true" :model="createForm" :rules="rules" ref="createForm" class="demo-form-inline" label-width="150px">
	          <el-form-item label="字典名称" prop="dictName">
	            <el-input v-model="createForm.dictName" placeholder="字典名称"></el-input>
	          </el-form-item>
	          <el-form-item label="字典编码" prop="dictCode">
	            <el-input v-model="createForm.dictCode" placeholder="字典编码"></el-input>
	          </el-form-item>
	          <el-form-item label="组名" prop="groupName">
	            <el-input v-model="createForm.groupName" placeholder="组名"></el-input>
	          </el-form-item>
	          <el-form-item label="组编码" prop="groupCode">
	            <el-input v-model="createForm.groupCode" placeholder="组编码"></el-input>
	          </el-form-item>
	          <el-form-item label="父级id" prop="parentId">
	            <el-input v-model="createForm.parentId" placeholder="父级id"></el-input>
	          </el-form-item>
            <el-form-item label="状态" prop="status" v-if = "this.submitType === 'edit'">
              <mySelect :model="createForm.status" :groupCode="groupCode" :ignoreCodes="['3']" @changeSelectHandler="changeSelectStatusHandler('createForm',$event)"></mySelect>
            </el-form-item>
	          <el-form-item label="排序" prop="dictOrder">
	            <el-input v-model="createForm.dictOrder" placeholder="排序"></el-input>
	          </el-form-item>
	          <el-form-item label="备注" prop="remark">
	            <el-input v-model="createForm.remark" placeholder="备注"></el-input>
	          </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <!--<el-button @click="dialogFormVisible = false">取 消</el-button>-->
            <el-button v-if = "this.submitType === 'add'" @click="resetForm('createForm')">重 置</el-button>
            <el-button type="primary"  @click="submitForm('createForm',submitType)">确 定</el-button>
          </div>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
  import bus from '../common/bus'
  import {formDatetime} from '../utils/formdata'
  import mySelect from '../common/MySelect'
  import {SysDictTable} from '../../api/tableJs/SysDictTable'
  import SysDictAxios from '../../api/axios/SysDictAxios'
  import axios from '@/libs/http' // 导入http中创建的axios实例
  export default {
    name: 'SysDict',
    data() {
      return {
        tableData: SysDictTable.tableData,
        searchForm: SysDictTable.searchForm,
        groupCode:'status',
        dialogFormVisible: false,
        dialogTitle:'',
        submitType:'',
        createForm: SysDictTable.createForm,
        deleteDialog:false,
        rules: SysDictTable.rules,
        title: SysDictTable.column,
        total:100,//默认数据总数
        pagesize:10,//每页的数据条数
        currentPage:1,//默认开始页面
      }
    },
    components: {
      mySelect
    },
    computed: {

    },
    created(){
      let param = {}
      param.currentPage = this.currentPage
      param.pageSize = this.pagesize
      this.getListByPageParam(param);
    },
    methods: {
      handleCreated(formName){
        this.dialogFormVisible = true
        this.submitType = 'add'
        this.createForm = this.clearForm(this.createForm);
      },
      // 获取子组件mySelect的值
      changeSelectStatusHandler(formName,e){
        console.log(this.$refs[formName])
        this.$refs[formName].model.status = e
      },
      searchSubmit() {
        let param = {}
        param.t = this.searchForm
        param.currentPage = this.currentPage
        param.pageSize = this.pagesize
        this.getListByPageParam(param);
      },
      indexMethod()  {  },
      handleSizeChange(val) {
        // console.log(`每页 ${val} 条`);
        let param = {}
        param.t = this.searchForm
        param.currentPage = this.currentPage
        param.pageSize = val
        this.getListByPageParam(param);
      },
      handleCurrentChange(val) {
        // console.log(`当前页: ${val}`);
        let param = {}
        param.t = this.searchForm
        param.currentPage = val
        param.pageSize = this.pagesize
        this.getListByPageParam(param);
      },
      getListByPageParam(param){
        // console.log(param);
        SysDictAxios.page(param).then(res => {
          // console.log(res.data);
          if (res.data.code != '-1') {
            this.tableData = res.data.data.records
            this.currentPage = res.data.data.current
            this.pagesize = res.data.data.size
            this.total = res.data.data.total
          }else{
            this.tableData = []
          }
        })
          .catch((error)=>{
            console.log(error);
          })
      },
      reflushTable(){
        let param = {}
        param.sysUser = this.searchForm
        param.currentPage = this.currentPage
        param.pageSize = this.pagesize
        this.getListByPageParam(param);
      },
      submitForm(formName,submitType) {
        if(submitType ==='add'){
          this.$refs[formName].validate((valid) => {
            if (valid) {
              let param = {}
              param.t = this.createForm
              SysDictAxios.add(param).then(res => {
                if (res.data.code != '-1') {
                  // this.tableData = res.data.data.msg
                  this.$message.success('操作成功！')
                  // console.log(res.data.data.msg);
                }else{
                  this.tableData = []
                }
                this.reflushTable()
              })
                .catch((error)=>{
                  console.log(error);
                })
              this.dialogFormVisible = false
            } else {
              // console.log('error submit!!');
              return false;
            }

          });
        }else if (submitType ==='edit'){
          // 修改
          this.$refs[formName].validate((valid) => {
            if (valid) {
              let param = {}
              param.t = this.createForm
              SysDictAxios.modify(param).then(res => {
                if (res.data.code != '-1') {
                  // this.tableData = res.data.data.msg
                  this.$message.success('操作成功！')
                  // console.log(res.data.data.msg);
                }else{
                  this.tableData = []
                }
                this.reflushTable()
              })
                .catch((error)=>{
                  console.log(error);
                })
              this.dialogFormVisible = false
            } else {
              // console.log('error submit!!');
              return false;
            }
          });
        }else if(submitType ==='del'){
          let id = param.id
          SysDictAxios.delete(id).then(res => {
            if (res.data.code != '-1') {
              // this.tableData = res.data.data.msg
              this.$message.success('操作成功！')
              // console.log(res.data.data.msg);
            }else{
              this.tableData = []
            }
            this.reflushTable()
          })
            .catch((error)=>{
              console.log(error);
            })
        }
        
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
      // 清空对象属性值
      clearForm(datas){
        let v_data ={};
        for(let key in datas){
          // console.log(key)
          if (datas[key] != null && datas[key] instanceof Array) {
            v_data[key]=[];
          }else {
            v_data[key] = '';
          }
        }
        return v_data
      },
      handleSelectionChange()  {  },
      handtable()  {  },
      // 鼠标置新增对话框外
      handleClose(done) {
        this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
      // 编辑
      handleEdit(index,row){
        this.submitType = 'edit'
        // console.log(row.id)
        SysDictAxios.get(row.id).then(res => {
          if (res.data.code != '-1') {
            this.dialogFormVisible = true
            console.log(res.data.data)
            this.createForm = res.data.data
          }else{
            this.tableData = []
          }
        })
          .catch((error)=>{
            console.log(error);
          })
      },
      handleDelete(index,row){
        // this.deleteDialog = true
        this.submitType = 'del'
        this.$confirm('确认关闭？')
          .then(_ => {
            // console.log(123)
            SysDictAxios.delete(row.id).then(res => {
              if (res.data.code != '-1') {
                // this.dialogFormVisible = true
                // this.createForm = res.data.data
              }else{
                this.tableData = []
              }
              this.reflushTable()
            })
              .catch((error)=>{
                console.log(error);
              })
          })
          .catch(_ => {
            console.log(456)
          });
      },


    }
  }
</script>

<style>
</style>
