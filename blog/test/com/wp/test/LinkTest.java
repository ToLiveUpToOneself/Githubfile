package com.wp.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wp.bean.Link;
import com.wp.service.ILinkService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:springmvc/applicationContext.xml" })
public class LinkTest {
	@Autowired
	private ILinkService linkService;
	
	@Test
	public void handel(){
		List<Link> links = linkService.getLinks();
		for (Link link : links) {
			System.out.println(link.getName());
		}
		
	}
	@Test
	public void delLink(){
		int flag = linkService.delLink(2);
		System.out.println(flag);
	}
	@Test
	public void addLink(){
		Link link = new Link();
		link.setName("baasd");
		link.setLink("aaaasdas");
		int flag = linkService.saveLink(link);
		System.out.println(flag+"============="+link.getId());
	}
}
