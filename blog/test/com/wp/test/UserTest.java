package com.wp.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wp.bean.User;
import com.wp.bean.WpParams;
import com.wp.service.admin.user.IUserService;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.test
 * 类名:UserTest
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年4月2日-上午11:01:14 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:springmvc/applicationContext.xml" })
public class UserTest {
	@Autowired
	private IUserService userService;
	@Test
	public void findUsers(){
		WpParams params = new WpParams();
		List<User> users = userService.findUsers(params);
		System.out.println(users);
	}
	@Test
	public void isemail(){
		int flag = userService.emailExist("279840109@qq.com");
		System.out.println(flag);
	}
	@Test
	public void isName(){
		int flag = userService.nameExist("asda");
		System.out.println(flag);
	}
}

