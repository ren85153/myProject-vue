<template>
  <div>
    <div class="crumbs">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item><i class="el-icon-lx-calendar"></i>首页</el-breadcrumb-item>
        <el-breadcrumb-item>SysLogs管理</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="container">
      <!-- 查询表单 -->
      <div>
        <el-form :inline="true" :model="searchForm" ref="searchForm" class="demo-form-inline">
          <el-form-item label="操作类型">
            <el-input v-model="searchForm.operType" placeholder="操作类型"></el-input>
          </el-form-item>
          <el-form-item label="操作内容">
            <el-input v-model="searchForm.operContent" placeholder="操作内容"></el-input>
          </el-form-item>
          <el-form-item label="操作时间">
            <el-input v-model="searchForm.createTime" placeholder="操作时间"></el-input>
          </el-form-item>
          <!--<el-form-item label="操作人">-->
            <!--<el-input v-model="searchForm.createId" placeholder="操作人"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="IP地址">-->
            <!--<el-input v-model="searchForm.ip" placeholder="IP地址"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展">-->
            <!--<el-input v-model="searchForm.reserve" placeholder="扩展"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展1">-->
            <!--<el-input v-model="searchForm.reserve1" placeholder="扩展1"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展2">-->
            <!--<el-input v-model="searchForm.reserve2" placeholder="扩展2"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展3">-->
            <!--<el-input v-model="searchForm.reserve3" placeholder="扩展3"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展4">-->
            <!--<el-input v-model="searchForm.reserve4" placeholder="扩展4"></el-input>-->
          <!--</el-form-item>-->
          <!--<el-form-item label="扩展5">-->
            <!--<el-input v-model="searchForm.reserve5" placeholder="扩展5"></el-input>-->
          <!--</el-form-item>-->
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
      <!--<div>-->
        <!--<el-dialog :title =dialogTitle :visible.sync="dialogFormVisible" :submitType= submitType :before-close="handleClose">-->
          <!--<el-form :inline="true" :model="createForm" :rules="rules" ref="createForm" class="demo-form-inline" label-width="150px">-->
	          <!--<el-form-item label="操作类型" prop="operType">-->
	            <!--<el-input v-model="createForm.operType" placeholder="操作类型"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="操作内容" prop="operContent">-->
	            <!--<el-input v-model="createForm.operContent" placeholder="操作内容"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="操作时间" prop="createTime">-->
	            <!--<el-input v-model="createForm.createTime" placeholder="操作时间"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="操作人" prop="createId">-->
	            <!--<el-input v-model="createForm.createId" placeholder="操作人"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="IP地址" prop="ip">-->
	            <!--<el-input v-model="createForm.ip" placeholder="IP地址"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展" prop="reserve">-->
	            <!--<el-input v-model="createForm.reserve" placeholder="扩展"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展1" prop="reserve1">-->
	            <!--<el-input v-model="createForm.reserve1" placeholder="扩展1"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展2" prop="reserve2">-->
	            <!--<el-input v-model="createForm.reserve2" placeholder="扩展2"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展3" prop="reserve3">-->
	            <!--<el-input v-model="createForm.reserve3" placeholder="扩展3"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展4" prop="reserve4">-->
	            <!--<el-input v-model="createForm.reserve4" placeholder="扩展4"></el-input>-->
	          <!--</el-form-item>-->
	          <!--<el-form-item label="扩展5" prop="reserve5">-->
	            <!--<el-input v-model="createForm.reserve5" placeholder="扩展5"></el-input>-->
	          <!--</el-form-item>-->
          <!--</el-form>-->
          <!--<div slot="footer" class="dialog-footer">-->
            <!--&lt;!&ndash;<el-button @click="dialogFormVisible = false">取 消</el-button>&ndash;&gt;-->
            <!--<el-button @click="resetForm('createForm')">重 置</el-button>-->
            <!--<el-button type="primary"  @click="submitForm('createForm',submitType)">确 定</el-button>-->
          <!--</div>-->
        <!--</el-dialog>-->
      <!--</div>-->
    </div>
  </div>
</template>

<script>
  import bus from '../common/bus';
  import {formDatetime} from '../utils/formdata';
  import {SysLogsTable} from '../../api/tableJs/SysLogsTable';
  import SysLogsAxios from '../../api/axios/SysLogsAxios'
  import axios from '@/libs/http' // 导入http中创建的axios实例
  export default {
    name: 'SysLogs',
    data() {
      return {
        tableData: SysLogsTable.tableData,
        searchForm: SysLogsTable.searchForm,
        dialogFormVisible: false,
        dialogTitle:'',
        submitType:'',
        createForm: SysLogsTable.createForm,
        deleteDialog:false,
        rules: SysLogsTable.rules,
        title: SysLogsTable.column,
        total:100,//默认数据总数
        pagesize:10,//每页的数据条数
        currentPage:1,//默认开始页面
      }
    },
    components: {

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
        if(this.$refs[formName]){
          this.resetForm(formName)
        }
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
        param.pageSize = this.val
        this.getListByPageParam(param);
      },
      handleCurrentChange(val) {
        // console.log(`当前页: ${val}`);
        let param = {}
        param.condition = this.searchForm
        param.currentPage = this.val
        param.pageSize = this.pagesize
        this.getListByPageParam(param);
      },
      getListByPageParam(param){
        SysLogsAxios.page(param).then(res => {
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
        param.t = this.searchForm
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
              SysLogsAxios.add(param).then(res => {
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
              SysLogsAxios.modify(param).then(res => {
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
          SysLogsAxios.delete(id).then(res => {
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
        SysLogsAxios.get(row.id).then(res => {
          if (res.data.code != '-1') {
            this.dialogFormVisible = true
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
            SysLogsAxios.delete(row.id).then(res => {
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
