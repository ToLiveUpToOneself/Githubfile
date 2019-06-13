package com.wp.service.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.wp.bean.User;
import com.wp.bean.WpParams;
import com.wp.dao.admin.user.IUserDao;
import com.wp.util.Utils;


/**
 * 
 * 包名:com.wp.service.admin.user.impl
 * 类名:IUserService  
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年04月02日-下午10:14:53
 */
@Service
public class UserService implements IUserService {
	@Autowired
	private IUserDao userDao;
	public List<User> findUsers(WpParams params) {
		return userDao.findUsers(params);
	}
	public int count(WpParams params) {
		return userDao.count(params);
	}
	public int updateUser(User user) {
		if(user.getPassword() != null){
			user.setPassword(Utils.md5Base64(Utils.md5Base64(user.getPassword())+"wp"));
		}
		return userDao.updateUser(user);
	}
	
	/*@Cacheable(cacheNames="permissionCache")*/
	public User getLoginUser(WpParams params) {
		String pas = params.getPassword() + "wp";
		params.setPassword(Utils.md5Base64(pas));
		return userDao.getLoginUser(params);
	}
	public int saveUser(User user) {
		user.setForbiden(1);
		user.setIsDelete(0);
		user.setPassword(Utils.md5Base64(Utils.md5Base64(user.getPassword())+"wp"));
		return userDao.saveUser(user);
	}
	public int delUser(WpParams params) {
		return userDao.delUser(params);
	}
	public User getUser(Integer id) {
		return userDao.getUser(id);
	}
	public int nameExist(String name) {
		return userDao.nameExist(name);
	}
	public int emailExist(String email) {
		return userDao.emailExist(email);
	}
}

