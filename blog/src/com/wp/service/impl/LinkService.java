package com.wp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.bean.Link;
import com.wp.dao.ILinkDao;
import com.wp.service.ILinkService;

@Service
public class LinkService implements ILinkService{

	@Autowired
	private ILinkDao linkDao;

	public List<Link> getLinks() {
		return linkDao.getLinks();
	}

	public int saveLink(Link link) {
		return linkDao.saveLink(link);
	}

	public int delLink(Integer id) {
		return linkDao.delLink(id);
	}

	public int updateLink(Link link) {
		return linkDao.updateLink(link);
	}
	
	
	
	
}
