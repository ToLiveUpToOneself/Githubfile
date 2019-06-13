package com.wp.service.admin.log;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.bean.WpParams;
import com.wp.dao.admin.log.IContentLogDao;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.service.admin.log
 * 类名:ContentLogService
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年4月6日-上午10:41:49 
 */
@Service
public class ContentLogService implements IContentLogService {
	@Autowired
	private IContentLogDao contentLogDao;
	public List<HashMap<String, Object>> groupContent(WpParams params) {
		return contentLogDao.groupContent(params);
	}

	public List<Map<String, Object>> getContentsByMonth(WpParams params) {
		return contentLogDao.getContentsByMonth(params);
	}

	public int contentCount(WpParams params) {
		return contentLogDao.contentCount(params);
	}

}
