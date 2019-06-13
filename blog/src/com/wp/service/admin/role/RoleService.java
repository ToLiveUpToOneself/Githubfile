package com.wp.service.admin.role;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.bean.Role;
import com.wp.bean.WpParams;
import com.wp.dao.admin.role.IRoleDao;


/**
 * 
 * 包名:com.wp.service.admin.role.impl
 * 类名:IRoleService  
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年04月02日-下午10:13:58
 */
@Service
public class RoleService implements IRoleService {
	@Autowired
	private IRoleDao roleDao;
	public int addRole(Role role) {
		role.setIsDelete(0);
		return roleDao.addRole(role);
	}
	public List<Role> findRoles(WpParams params) {
		return roleDao.findRoles(params);
	}
	public int count(WpParams params) {
		return roleDao.count(params);
	}
	public List<HashMap<String, Object>> findFilterUsers(WpParams params) {
		return roleDao.findFilterUsers(params);
	}
	public int countFilterUsers(WpParams params) {
		return roleDao.countFilterUsers(params);
	}
	public int saveRoleUsers(Integer userId, Integer roleId) {
		return roleDao.saveRoleUsers(userId, roleId);
	}
	public int delRoleUsers(Integer userId, Integer roleId) {
		return roleDao.delRoleUsers(userId, roleId);
	}
	public int saveRolePermission(Integer roleId, Integer permissionId) {
		return roleDao.saveRolePermission(roleId, permissionId);
	}
	public int delRolePermission(Integer roleId) {
		return roleDao.delRolePermission(roleId);
	}
	public List<HashMap<String, Object>> findFilterPermissions(Integer roleId) {
		return roleDao.findFilterPermissions(roleId);
	}
	public int countFilterPermissions(Integer roleId) {
		return roleDao.countFilterPermissions(roleId);
	}
	public List<HashMap<String, Object>> findRolesByUserId(Integer userId) {
		return roleDao.findRolesByUserId(userId);
	}
	
}

