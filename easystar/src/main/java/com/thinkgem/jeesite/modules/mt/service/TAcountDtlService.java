/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TAcountDtl;
import com.thinkgem.jeesite.modules.mt.dao.TAcountDtlDao;

/**
 * 账户明细表Service
 * @author dongge
 * @version 2017-11-23
 */
@Service
@Transactional(readOnly = true)
public class TAcountDtlService extends CrudService<TAcountDtlDao, TAcountDtl> {

	public TAcountDtl get(String id) {
		return super.get(id);
	}
	
	public List<TAcountDtl> findList(TAcountDtl tAcountDtl) {
		return super.findList(tAcountDtl);
	}
	
	public Page<TAcountDtl> findPage(Page<TAcountDtl> page, TAcountDtl tAcountDtl) {
		return super.findPage(page, tAcountDtl);
	}
	
	@Transactional(readOnly = false)
	public void save(TAcountDtl tAcountDtl) {
		super.save(tAcountDtl);
	}
	
	@Transactional(readOnly = false)
	public void delete(TAcountDtl tAcountDtl) {
		super.delete(tAcountDtl);
	}
	
}