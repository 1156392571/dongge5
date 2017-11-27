/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TParttimejob;
import com.thinkgem.jeesite.modules.mt.dao.TParttimejobDao;

/**
 * 兼职表Service
 * @author dongge
 * @version 2017-11-27
 */
@Service
@Transactional(readOnly = true)
public class TParttimejobService extends CrudService<TParttimejobDao, TParttimejob> {

	public TParttimejob get(String id) {
		return super.get(id);
	}
	
	public List<TParttimejob> findList(TParttimejob tParttimejob) {
		return super.findList(tParttimejob);
	}
	
	public Page<TParttimejob> findPage(Page<TParttimejob> page, TParttimejob tParttimejob) {
		return super.findPage(page, tParttimejob);
	}
	
	@Transactional(readOnly = false)
	public void save(TParttimejob tParttimejob) {
		super.save(tParttimejob);
	}
	
	@Transactional(readOnly = false)
	public void delete(TParttimejob tParttimejob) {
		super.delete(tParttimejob);
	}
	
}