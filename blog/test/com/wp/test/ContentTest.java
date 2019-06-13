package com.wp.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wp.bean.Content;
import com.wp.bean.WpParams;
import com.wp.service.IContentService;
import com.wp.service.admin.content.IAdminContentService;

/**
 * 
 * 工程名:blog
 * 包名:com.wp.test
 * 类名:ContentTest
 * 创建人:hl
 * Email:279840109@qq.com
 * 时间：2017年3月31日-下午3:15:17 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:springmvc/applicationContext.xml" })
public class ContentTest {
	@Autowired
	private IContentService contentService;
	
	@Autowired
	private IAdminContentService adminContentService;
	
	@Test
	public void findContents(){
		WpParams params = new WpParams();
		List<Content> contents = contentService.findContents(params);
		System.out.println(contents);
	}
	@Test
	public void count(){
		WpParams params = new WpParams();
		int count = contentService.count(params);
		System.out.println(count);
	}
	@Test
	public void add(){
		Content content = new Content();
		content.setTitle("aaaaaaaa");
		content.setDescription("adsadasdasd");
		content.setAuthor("文鹏");
		content.setChannelId(2);
		content.setContent("阿斯顿卡萨丁杰卡斯阿打算尽快还能");
		content.setKeywords("asdasdfasdas");
		boolean flag = adminContentService.add(content);
		System.out.println(flag);
	}
	@Test
	public void testhits(){
		Content content = new Content();
		content.setId(22);
		content.setHits(100);
		try {
			adminContentService.update(content);
			System.out.println("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
		
	
}
