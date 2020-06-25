/**
 * 接口域名的管理
 */

// const baseUrl = 'http:127.0.0.1:8888/api'
const baseUrl = '/api'
const base = {
  baseUrl: baseUrl,
  // 获取所有字典
  SysUserList: baseUrl + '/sysUser/list',
  SysUserPage: baseUrl + '/sysUser/page',
  SysUserGet: baseUrl + '/sysUser/get',
  SysUserAdd: baseUrl + '/sysUser/add',
  SysUserModify: baseUrl + '/sysUser/modify',
  SysUserDelete: baseUrl + '/sysUser/delete',

  SysUserRoleList: baseUrl + '/sysUserRole/list',
  SysUserRolePage: baseUrl + '/sysUserRole/page',
  SysUserRoleGet: baseUrl + '/sysUserRole/get',
  SysUserRoleAdd: baseUrl + '/sysUserRole/add',
  SysUserRoleModify: baseUrl + '/sysUserRole/modify',
  SysUserRoleDelete: baseUrl + '/sysUserRole/delete',

  SysRoleList: baseUrl + '/sysRole/list',
  SysRolePage: baseUrl + '/sysRole/page',
  SysRoleGet: baseUrl + '/sysRole/get',
  SysRoleAdd: baseUrl + '/sysRole/add',
  SysRoleModify: baseUrl + '/sysRole/modify',
  SysRoleDelete: baseUrl + '/sysRole/delete',

  SysRoleMenuList: baseUrl + '/sysRoleMenu/list',
  SysRoleMenuPage: baseUrl + '/sysRoleMenu/page',
  SysRoleMenuGet: baseUrl + '/sysRoleMenu/get',
  SysRoleMenuAdd: baseUrl + '/sysRoleMenu/add',
  SysRoleMenuModify: baseUrl + '/sysRoleMenu/modify',
  SysRoleMenuDelete: baseUrl + '/sysRoleMenu/delete',

  SysMenuList: baseUrl + '/sysMenu/list',
  SysMenuPage: baseUrl + '/sysMenu/page',
  SysMenuGet: baseUrl + '/sysMenu/get',
  SysMenuAdd: baseUrl + '/sysMenu/add',
  SysMenuModify: baseUrl + '/sysMenu/modify',
  SysMenuDelete: baseUrl + '/sysMenu/delete',

  SysLogsList: baseUrl + '/sysLogs/list',
  SysLogsPage: baseUrl + '/sysLogs/page',
  SysLogsGet: baseUrl + '/sysLogs/get',
  SysLogsAdd: baseUrl + '/sysLogs/add',
  SysLogsModify: baseUrl + '/sysLogs/modify',
  SysLogsDelete: baseUrl + '/sysLogs/delete',

  SysDictList: baseUrl + '/sysDict/list',
  SysDictPage: baseUrl + '/sysDict/page',
  SysDictGet: baseUrl + '/sysDict/get',
  SysDictAdd: baseUrl + '/sysDict/add',
  SysDictModify: baseUrl + '/sysDict/modify',
  SysDictDelete: baseUrl + '/sysDict/delete',
}

export default base
