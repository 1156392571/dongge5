/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.dao.TUserDao;

/**
 * 用户信息附加表Service
 * @author dongge
 * @version 2017-11-02
 */
@Service
@Transactional(readOnly = true)
public class TUserService extends CrudService<TUserDao, TUser> {

	public TUser get(String id) {
		return super.get(id);
	}
	
	public List<TUser> findList(TUser tUser) {
		return super.findList(tUser);
	}
	
	public Page<TUser> findPage(Page<TUser> page, TUser tUser) {
		return super.findPage(page, tUser);
	}
	
	@Transactional(readOnly = false)
	public void save(TUser tUser) {
		super.save(tUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(TUser tUser) {
		super.delete(tUser);
	}
	
}