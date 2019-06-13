package com.wp.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wp.bean.Content;
import com.wp.bean.Role;
import com.wp.bean.WpParams;
import com.wp.service.IContentService;
import com.wp.service.admin.permission.IPermissionService;
import com.wp.service.admin.role.IRoleService;
import com.wp.service.admin.role.RoleService;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.test
 * 类名:PermissionTest
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年4月5日-下午2:10:34 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:springmvc/applicationContext.xml" })
public class PermissionTest {
	@Autowired
	private IPermissionService permissionService;
	@Autowired
	private IRoleService roleService;
	@Test
	public void findRoot(){
		WpParams params = new WpParams();
		
		List<Map<String, Object>> per = permissionService.findPermissionRoot(params);
		
		System.out.println(per);
	}
	@Test
	public void addRole(){
		Role role = new Role();
		role.setName("aaaaaa");
		role.setDescription("aaaaaaaaa");
		roleService.addRole(role);
		System.out.println(role.getId());
		
	}
		
	
}
