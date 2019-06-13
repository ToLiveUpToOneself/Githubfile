package com.wp.service.admin.log;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.bean.Log;
import com.wp.bean.WpParams;
import com.wp.dao.admin.log.ILogDao;


/**
 * 
 * 包名:com.wp.service.admin.log.impl
 * 类名:ILogService  
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年04月05日-下午06:06:43
 */
@Service
public class LogService implements ILogService {
	@Autowired
	private ILogDao logDao;

	public List<Log> findLogs(WpParams params) {
		return logDao.findLogs(params);
	}

	public int count(WpParams params) {
		return logDao.count(params);
	}

	public int saveLog(Log log) {
		return logDao.saveLog(log);
	}

	public List<HashMap<String, Object>> groupLogs(WpParams params) {
		return logDao.groupLogs(params);
	}

	public List<Map<String, Object>> getLogsByMonth(WpParams params) {
		return logDao.getLogsByMonth(params);
	}

	public int logCount(WpParams params) {
		return logDao.logCount(params);
	}
	
}

