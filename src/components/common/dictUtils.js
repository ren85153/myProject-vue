


function getDictName(dictGroupCode,dictValue){
  let dict = JSON.parse(localStorage.getItem('sysDict'))
  let dictName = ''
  // console.log(dict)
  // debugger
  if(dict){
    for (let i = 0; i < dict.length; i++) {
      // console.log(dictGroupCode + '====' + dictValue)
      let gCode = dict[i].groupCode
      let dCode = dict[i].dictCode
      // console.log(gCode  + '====' + dCode)
      if( gCode === dictGroupCode && dCode === dictValue){
        dictName = dict[i].dictName
      }else{
        continue
      }
    }
    return dictName
  }else{
    return dictName
  }
}

export {getDictName};
