/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TJobApply;
import com.thinkgem.jeesite.modules.mt.dao.TJobApplyDao;

/**
 * 兼职申请表Service
 * @author dongge
 * @version 2017-11-27
 */
@Service
@Transactional(readOnly = true)
public class TJobApplyService extends CrudService<TJobApplyDao, TJobApply> {

	public TJobApply get(String id) {
		return super.get(id);
	}
	
	public List<TJobApply> findList(TJobApply tJobApply) {
		return super.findList(tJobApply);
	}
	
	public Page<TJobApply> findPage(Page<TJobApply> page, TJobApply tJobApply) {
		return super.findPage(page, tJobApply);
	}
	
	@Transactional(readOnly = false)
	public void save(TJobApply tJobApply) {
		super.save(tJobApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(TJobApply tJobApply) {
		super.delete(tJobApply);
	}
	
}