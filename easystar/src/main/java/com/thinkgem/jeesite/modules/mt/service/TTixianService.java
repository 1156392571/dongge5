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
import com.thinkgem.jeesite.modules.mt.entity.TTixian;
import com.thinkgem.jeesite.modules.mt.dao.TTixianDao;

/**
 * 提现记录表Service
 * @author dongge
 * @version 2017-12-17
 */
@Service
@Transactional(readOnly = true)
public class TTixianService extends CrudService<TTixianDao, TTixian> {
	@Autowired
	TTixianDao tTixianDao;
	
	public TTixian get(String id) {
		return super.get(id);
	}
	
	public List<TTixian> findList(TTixian tTixian) {
		return super.findList(tTixian);
	}
	
	public Page<TTixian> findPage(Page<TTixian> page, TTixian tTixian) {
		return super.findPage(page, tTixian);
	}
	
	@Transactional(readOnly = false)
	public void save(TTixian tTixian) {
		super.save(tTixian);
	}
	
	@Transactional(readOnly = false)
	public void delete(TTixian tTixian) {
		super.delete(tTixian);
	}

	@Transactional(readOnly = false)
	public void updatestatus(TTixian tTixian) {
		tTixianDao.updatestatus(tTixian);
	}

	@Transactional(readOnly = false)
    public void updatAacountByid(TTixian tTixian)
    {
	    tTixianDao.updatAacountByid(tTixian);
    }
	
}