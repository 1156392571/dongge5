/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TDbPlatform;
import com.thinkgem.jeesite.modules.mt.dao.TDbPlatformDao;

/**
 * 担保平台Service
 * @author dongge
 * @version 2017-11-13
 */
@Service
@Transactional(readOnly = true)
public class TDbPlatformService extends CrudService<TDbPlatformDao, TDbPlatform> {
	@Autowired
	TDbPlatformDao tDbPlatformDao;
	
	public TDbPlatform get(String id) {
		return super.get(id);
	}
	
	public List<TDbPlatform> findList(TDbPlatform tDbPlatform) {
		return super.findList(tDbPlatform);
	}
	
	public Page<TDbPlatform> findPage(Page<TDbPlatform> page, TDbPlatform tDbPlatform) {
		return super.findPage(page, tDbPlatform);
	}
	
	@Transactional(readOnly = false)
	public void save(TDbPlatform tDbPlatform) {
		super.save(tDbPlatform);
	}
	
	@Transactional(readOnly = false)
	public void delete(TDbPlatform tDbPlatform) {
		super.delete(tDbPlatform);
	}

	public Page<TDbPlatform> findPageLimit(Page<TDbPlatform> page, TDbPlatform tDbPlatform) {
		tDbPlatform.setPage(page);
		page.setList(tDbPlatformDao.findPageLimit(tDbPlatform));
		return page;
	}
	
}