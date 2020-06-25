
import {formDatetime} from '../../components/utils/formdata';

// SysUser表格column
var demo = {}

demo.column  = [

  {
    label: "姓名",
    prop: "userName",
    operate: false,
  },

  {
    label: "账号",
    prop: "account",
    operate: false,
  },

  // {
  // 	label: "密码",
  // 	prop: "password",
  // 	operate: false,
  // },

  {
    label: "邮箱",
    prop: "email",
    operate: false,
  },

  {
    label: "手机号",
    prop: "telephone",
    operate: false,
  },

  {
    label: "地址",
    prop: "address",
    operate: false,
  },

  {
    label: "证件类型",
    prop: "cartType",
    operate: false,
  },

  {
    label: "证件号码",
    prop: "cartNo",
    operate: false,
  },

  {
    label: "国籍",
    prop: "nationality",
    operate: false,
  },

  // {
  // 	label: "生日",
  // 	prop: "birth",
  // 	operate: false,
  // },

  {
    label: "性别",
    prop: "sex",
    operate: false,
  },

  {
    label: "状态",
    prop: "status",
    operate: false,
  },

  // {
  // 	label: "登录错误次数",
  // 	prop: "errorCount",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "登录IP",
  // 	prop: "loginIp",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "登录mac地址",
  // 	prop: "loginMac",
  // 	operate: false,
  // },

  {
    label: "创建时间",
    prop: "createTime",
    operate: false,
  },
  //
  // {
  // 	label: "创建人id",
  // 	prop: "createId",
  // 	operate: false,
  // },

  {
    label: "创建人姓名",
    prop: "createName",
    operate: false,
  },

  {
    label: "修改时间",
    prop: "updateTime",
    operate: false,
  },

  // {
  // 	label: "修改人id",
  // 	prop: "updateId",
  // 	operate: false,
  // },

  {
    label: "修改人姓名",
    prop: "updateName",
    operate: false,
  },

  // {
  // 	label: "账号类型",
  // 	prop: "accountType",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "备注",
  // 	prop: "remark",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展",
  // 	prop: "reserve",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展1",
  // 	prop: "reserve1",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展2",
  // 	prop: "reserve2",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展3",
  // 	prop: "reserve3",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展4",
  // 	prop: "reserve4",
  // 	operate: false,
  // },
  //
  // {
  // 	label: "扩展5",
  // 	prop: "reserve5",
  // 	operate: false,
  // },

]
demo.tableData  = []
demo.searchForm   = {
  userName: '',
  account: '',
  password: '',
  email: '',
  telephone: '',
  address: '',
  cartType: '',
  cartNo: '',
  nationality: '',
  birth: '',
  sex: '',
  status: '',
  errorCount: '',
  loginIp: '',
  loginMac: '',
  createTime: '',
  createId: '',
  createName: '',
  updateTime: '',
  updateId: '',
  updateName: '',
  accountType: '',
  remark: '',
  reserve: '',
  reserve1: '',
  reserve2: '',
  reserve3: '',
  reserve4: '',
  reserve5: '',
}
demo.createForm   = {
  userName: '',
  account: '',
  password: '',
  email: '',
  telephone: '',
  address: '',
  cartType: '',
  cartNo: '',
  nationality: '',
  birth: '',
  sex: '',
  status: '',
  errorCount: '',
  loginIp: '',
  loginMac: '',
  createTime: '',
  createId: '',
  createName: '',
  updateTime: '',
  updateId: '',
  updateName: '',
  accountType: '',
  remark: '',
  reserve: '',
  reserve1: '',
  reserve2: '',
  reserve3: '',
  reserve4: '',
  reserve5: '',
}
demo.rules =  {
  userName: [
    { required: true, message: '用户名', trigger: 'blur' },
    { min: 2, max: 6, message: '2 到 6 个字符', trigger: 'blur' }
  ],
  account: [
    { required: true, message: '账号', trigger: 'blur' }
  ],
  email: [
    { type: 'email', required: true, message: '邮箱', trigger: 'blur' }
  ],
  telephone: [
    // { type: 'date', required: true, message: '手机号', trigger: 'change' }
    { required: true, message: '手机号', trigger: 'blur' },
  ],
  address: [
    // { type: 'array', required: true, message: '地址', trigger: 'change' }
    { required: true, message: '地址', trigger: 'blur' },
  ],
  cartType: [
    { required: true, message: '证件类型', trigger: 'blur' }
  ],
  cartNo: [
    { required: true, message: '证件号码', trigger: 'blur' }
  ],
  nationality: [
    { required: true, message: '国籍', trigger: 'blur' }
  ],
  sex: [
    { required: true, message: '性别', trigger: 'blur' }
  ],
}


export {
  demo
}
