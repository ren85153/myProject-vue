<template>
  <el-select v-model=selectValue :clearable=clearable placeholder="请选择" @change="changeSelectHandler">
    <el-option
      v-for="(item,key) in statusOptions"
      :key="item.groupCode+'-'+key"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
</template>

<script>
  import SysDictAxios from '../../api/axios/SysDictAxios'
    export default {
      name: "MySelect",
      props: {
        model: {
          type: String,
          default: '',
          required: true
        },
        groupCode: {
          type: String,
          default: '',
          required: true
        },
        clearable: {
          type: Boolean,
          default: true,
          required: false
        },
        ignoreCodes: {
          type: Array,
          default: '',
          required: false
        },
      },
      watch: {
        model:function(newVal,oldVal){
          if(newVal !== oldVal){
            this.selectValue = this.model
            // console.log('newVal=' + newVal + ', oldVal=' + oldVal + ',this.model=' + this.model +',selectValue=' + this.selectValue)
            // this.getOptions()
          }
        }
      },
      data() {
        return {
          selectValue: this.model,
          selectGroupCode: this.groupCode,
          statusOptions: [],
        }
      },
      components: {

      },
      computed: {

      },
      created(){
        this.getOptions()
      },
      methods: {
        getOptions(){
          let param = {}
          let t = {}
          t.groupCode = this.selectGroupCode
          param.t = t
          // console.log(this.selectGroupCode)
          if(this.selectGroupCode =undefined || this.selectGroupCode ===''){
            this.statusOptions = []
            return
          }
          // console.log(param)
          SysDictAxios.list(param).then(res => {
            // debugger
            if (res.data.data.length > 0 ) {
              let selectDict = res.data.data
              // console.log(selectDict)
              let arr = []
              for (let i = 0; i < selectDict.length; i++) {
                // console.log(selectDict[i].dictCode)
                if( this.ignoreCodes!=='' && (this.ignoreCodes.indexOf(selectDict[i].dictCode) > -1)){
                  continue
                }else{
                  let option = {}
                  option.groupCode = selectDict[i].groupCode
                  option.label = selectDict[i].dictName
                  option.value = selectDict[i].dictCode
                  arr.push(option)
                  // this.statusOptions.push(option)
                }
              }
              // this.statusOptions = arr
              this.statusOptions = JSON.parse(JSON.stringify(arr))
            }else{
              this.statusOptions = []
            }
          })
        },
        changeSelectHandler(){
          // console.log('changeHandler' + this.selectValue)
          this.$emit('changeSelectHandler',this.selectValue)
        },

      }
    }
</script>

<style scoped>

</style>
