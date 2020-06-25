<template>
  <el-select v-model=selectValue :clearable=clearable placeholder="请选择" @change="changeSelectHandler">
    <el-option
      v-for="item in statusOptions"
      :key="item.value"
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
        let dict = JSON.parse(localStorage.getItem('sysDict'))
        let param = {}
        param.groupCode = this.selectGroupCode
        SysDictAxios.list(param).then(res => {
          // debugger
          if (res.data.data.length > 0 ) {
            let selectDict = res.data.data
            // console.log(selectDict)
            for (let i = 0; i < selectDict.length; i++) {
              // console.log(selectDict[i].dictCode)
              if( this.ignoreCodes!=='' && (this.ignoreCodes.indexOf(selectDict[i].dictCode) > -1)){
                continue
              }else{
                let option = {}
                option.label = selectDict[i].dictName
                option.value = selectDict[i].dictCode
                this.statusOptions.push(option)
              }
            }
          }else{
            this.statusOptions = []
          }
        })
      },
      methods: {
        getOptions(){

        },
        changeSelectHandler(val){
          // console.log('changeHandler' + val)
          this.$emit('changeSelectHandler',this.selectValue)
        }
      }
    }
</script>

<style scoped>

</style>
