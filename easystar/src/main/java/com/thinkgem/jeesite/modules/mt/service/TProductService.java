/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TProduct;
import com.thinkgem.jeesite.modules.mt.dao.TProductDao;

/**
 * 产品表Service
 * @author dongge
 * @version 2017-11-01
 */
@Service
@Transactional(readOnly = true)
public class TProductService extends CrudService<TProductDao, TProduct> {

	public TProduct get(String id) {
		return super.get(id);
	}
	
	public List<TProduct> findList(TProduct tProduct) {
		return super.findList(tProduct);
	}
	
	public Page<TProduct> findPage(Page<TProduct> page, TProduct tProduct) {
		return super.findPage(page, tProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(TProduct tProduct) {
		super.save(tProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(TProduct tProduct) {
		super.delete(tProduct);
	}
	
}