// 13位时间戳转字符串
import moment from "moment";


function formDatetime(row, column) {
  let date = row[column.property];
  if (date == undefined) {
    return "";
  }
  return moment(date).format("YYYY-MM-DD HH:mm:ss");
}


function formDa(row, column) {
  let date = row[column.property];
  if (date == undefined) {
    return "";
  }
  return moment(date).format("YYYY-MM-DD");
}






export {
  formDatetime,
  formDa

}
