package com.wp.dao.admin.permission;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wp.bean.Permission;
import com.wp.bean.WpParams;

/**
 * 
 * 
 * 包名:com.wp.dao.admin.permission 
 * 类名:IPermissionDao  
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年04月05日-下午11:51:38
 */
public interface IPermissionDao {
	/**
	 * 
	 * 查询根节点
	 * com.wp.dao.admin.permission 
	 * 方法名：findPermissionRoot
	 * 创建人：hl
	 * 时间：2017年4月5日-下午2:01:23 
	 * @param params
	 * @return List<Permission>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Permission> findPermissionRoot(WpParams params);
	/**
	 * 
	 * 查询子节点
	 * com.wp.dao.admin.permission 
	 * 方法名：findPermissionChildren
	 * 创建人：hl
	 * 时间：2017年4月5日-下午2:03:44 
	 * @param id
	 * @return List<Permission>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Permission> findPermissionChildren(@Param("id")Integer id);
	/**
	 * 
	 * 总数
	 * com.wp.dao.admin.permission 
	 * 方法名：count
	 * 创建人：hl
	 * 时间：2017年4月5日-下午2:04:16 
	 * @param params
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public int count(WpParams params);
	/**
	 * 
	 * 查询用户所拥有的权限
	 * com.wp.dao.admin.permission 
	 * 方法名：findUserPermission
	 * 创建人：hl
	 * 时间：2017年4月5日-下午2:04:29 
	 * @param userId
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findUserPermission(@Param("userId")Integer userId);
	
}

