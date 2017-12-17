/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TErweimaTask;
import com.thinkgem.jeesite.modules.mt.dao.TErweimaTaskDao;

/**
 * 扫码任务Service
 * @author dongge
 * @version 2017-12-15
 */
@Service
@Transactional(readOnly = true)
public class TErweimaTaskService extends CrudService<TErweimaTaskDao, TErweimaTask> {

	public TErweimaTask get(String id) {
		return super.get(id);
	}
	
	public List<TErweimaTask> findList(TErweimaTask tErweimaTask) {
		return super.findList(tErweimaTask);
	}
	
	public Page<TErweimaTask> findPage(Page<TErweimaTask> page, TErweimaTask tErweimaTask) {
		return super.findPage(page, tErweimaTask);
	}
	
	@Transactional(readOnly = false)
	public void save(TErweimaTask tErweimaTask) {
		super.save(tErweimaTask);
	}
	
	@Transactional(readOnly = false)
	public void delete(TErweimaTask tErweimaTask) {
		super.delete(tErweimaTask);
	}
	
}