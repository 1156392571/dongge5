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
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;
import com.thinkgem.jeesite.modules.mt.dao.TMobiletaskApplyDao;

/**
 * 手机做任务Service
 * @author dongg
 * @version 2017-12-23
 */
@Service
@Transactional(readOnly = true)
public class TMobiletaskApplyService extends CrudService<TMobiletaskApplyDao, TMobiletaskApply> {
	@Autowired
	TMobiletaskApplyDao tMobiletaskApplyDao;
	
	public TMobiletaskApply get(String id) {
		return super.get(id);
	}
	
	public List<TMobiletaskApply> findList(TMobiletaskApply tMobiletaskApply) {
		return super.findList(tMobiletaskApply);
	}
	
	public Page<TMobiletaskApply> findPage(Page<TMobiletaskApply> page, TMobiletaskApply tMobiletaskApply) {
		return super.findPage(page, tMobiletaskApply);
	}
	
	@Transactional(readOnly = false)
	public void save(TMobiletaskApply tMobiletaskApply) {
		super.save(tMobiletaskApply);
	}
	
	@Transactional(readOnly = false)
	public void delete(TMobiletaskApply tMobiletaskApply) {
		super.delete(tMobiletaskApply);
	}

	@Transactional(readOnly = false)
	public void updatetofailed(TMobiletaskApply tMobiletaskApply) {
		tMobiletaskApplyDao.updatetofailed(tMobiletaskApply);
	}

	public Map<String, String> getMapByid(String id) {
		return tMobiletaskApplyDao.getMapByid(id);
	}
	
}