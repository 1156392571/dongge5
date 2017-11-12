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
import com.thinkgem.jeesite.modules.mt.entity.TTaskOrder;
import com.thinkgem.jeesite.modules.mt.dao.TTaskOrderDao;

/**
 * 任务订单表Service
 * @author dongge
 * @version 2017-11-10
 */
@Service
@Transactional(readOnly = true)
public class TTaskOrderService extends CrudService<TTaskOrderDao, TTaskOrder> {
	@Autowired TTaskOrderDao tTaskOrderDao;
	
	public TTaskOrder get(String id) {
		return super.get(id);
	}
	
	public List<TTaskOrder> findList(TTaskOrder tTaskOrder) {
		return super.findList(tTaskOrder);
	}
	
	public Page<TTaskOrder> findPage(Page<TTaskOrder> page, TTaskOrder tTaskOrder) {
		return super.findPage(page, tTaskOrder);
	}
	
	@Transactional(readOnly = false)
	public void save(TTaskOrder tTaskOrder) {
		super.save(tTaskOrder);
	}
	
	@Transactional(readOnly = false)
	public void delete(TTaskOrder tTaskOrder) {
		super.delete(tTaskOrder);
	}

	@Transactional(readOnly = false)
	public TTaskOrder checkpost(TTaskOrder taskorder) {
		return tTaskOrderDao.checkpost(taskorder);
	}

	@Transactional(readOnly = false)
	public void saveTaskorder(TTaskOrder tTaskOrder) {
		tTaskOrderDao.saveTaskorder(tTaskOrder);
	}

	@Transactional(readOnly = false)
	public void cancelTaskorder(String id) {
		tTaskOrderDao.cancelTaskorder(id);
	}

	@Transactional(readOnly = false)
	public void handTaskorder(TTaskOrder tTaskOrder) {
		tTaskOrderDao.handTaskorder(tTaskOrder);
	}

	@Transactional(readOnly = false)
	public void outtime(TTaskOrder tTaskOrder) {
		tTaskOrderDao.outtime(tTaskOrder);
	}
	
}