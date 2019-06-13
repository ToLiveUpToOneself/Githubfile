package com.wp.dao;

import org.apache.ibatis.annotations.Param;

import com.wp.bean.Channel;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.dao
 * 类名:IChannelDao
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年4月1日-下午2:37:33 
 */
public interface IChannelDao {
	/**
	 * 
	 * 根据名字查询栏目
	 * com.wp.dao 
	 * 方法名：getChannelByName
	 * 创建人：hl
	 * 时间：2017年4月1日-下午2:38:53 
	 * @param name
	 * @return Channel
	 * @exception 
	 * @since  1.0.0
	 */
	public Channel getChannelByName(@Param("name")String name);
	
}
