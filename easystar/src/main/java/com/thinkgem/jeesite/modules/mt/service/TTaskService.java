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
import com.thinkgem.jeesite.modules.mt.entity.TTask;
import com.thinkgem.jeesite.modules.mt.dao.TTaskDao;

/**
 * 发布任务Service
 * @author dongge
 * @version 2017-11-09
 */
@Service
@Transactional(readOnly = true)
public class TTaskService extends CrudService<TTaskDao, TTask> {
	@Autowired
	TTaskDao tTaskDao;
	
	public TTask get(String id) {
		return super.get(id);
	}
	
	public List<TTask> findList(TTask tTask) {
		return super.findList(tTask);
	}
	
	public Page<TTask> findPage(Page<TTask> page, TTask tTask) {
		return super.findPage(page, tTask);
	}
	
	@Transactional(readOnly = false)
	public void save(TTask tTask) {
		super.save(tTask);
	}
	
	@Transactional(readOnly = false)
	public void delete(TTask tTask) {
		super.delete(tTask);
	}

	@Transactional(readOnly = false)
	public Page<TTask> findPageAndself(Page<TTask> page, TTask tTask) {
		tTask.setPage(page);
		page.setList(tTaskDao.findPageAndself(tTask));
		return page;
	}
	
}