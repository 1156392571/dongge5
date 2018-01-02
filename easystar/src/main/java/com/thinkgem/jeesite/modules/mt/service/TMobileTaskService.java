/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TMobileTask;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.dao.TMobileTaskDao;

/**
 * 手机任务表Service
 * @author donggge
 * @version 2017-12-21
 */
@Service
@Transactional(readOnly = true)
public class TMobileTaskService extends CrudService<TMobileTaskDao, TMobileTask> {
	@Autowired
	TMobileTaskDao tMobileTaskDao;
	public TMobileTask get(String id) {
		return super.get(id);
	}
	
	public List<TMobileTask> findList(TMobileTask tMobileTask) {
		return super.findList(tMobileTask);
	}
	
	public Page<TMobileTask> findPage(Page<TMobileTask> page, TMobileTask tMobileTask) {
		return super.findPage(page, tMobileTask);
	}
	
	@Transactional(readOnly = false)
	public void save(TMobileTask tMobileTask) {
		super.save(tMobileTask);
	}
	
	@Transactional(readOnly = false)
	public void delete(TMobileTask tMobileTask) {
		super.delete(tMobileTask);
	}

	public List<Map<Object, Object>> findTaskList() {
		return tMobileTaskDao.findTaskList();
	}

	@Transactional(readOnly = false)
	public void toaddoneview(String id) {
		tMobileTaskDao.toaddoneview(id);
	}

	
}