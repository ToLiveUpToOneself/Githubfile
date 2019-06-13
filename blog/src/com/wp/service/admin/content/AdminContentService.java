package com.wp.service.admin.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.bean.Content;
import com.wp.bean.WpParams;
import com.wp.dao.admin.content.IAdminContentDao;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.service.admin.content
 * 类名:AdminContentService
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年4月1日-下午10:34:48 
 */
@Service
public class AdminContentService implements IAdminContentService{
	@Autowired
	private IAdminContentDao adminContentDao;
	public List<Content> findContents(WpParams params) {
		return adminContentDao.findContents(params);
	}
	public int count(WpParams params) {
		return adminContentDao.count(params);
	}
	public int update(Content content) {
		return adminContentDao.update(content);
	}
	public boolean add(Content content) {
		return adminContentDao.add(content);
	}
	public Content getContent(Integer id) {
		return adminContentDao.getContent(id);
	}
	public int updateCon(Content content) {
		return adminContentDao.updateCon(content);
	}

}
