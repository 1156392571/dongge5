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
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.mt.dao.TUserDao;

/**
 * 用户信息附加表Service
 * @author dongge
 * @version 2017-11-02
 */
@Service
@Transactional(readOnly = true)
public class TUserService extends CrudService<TUserDao, TUser> {
    @Autowired TUserDao tUserDao;
    
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

	@Transactional(readOnly = false)
    public TUser getUserByLoginName(String loginName){
        return tUserDao.getUserByLoginName(loginName);
    }

	@Transactional(readOnly = false)
    public int updUser(TUser tUser)
    {
       
        return tUserDao.updUser(tUser);
    }

	@Transactional(readOnly = false)
    public int updSysUser(TUser tUser)
    {
        return tUserDao.updSysUser(tUser);
    }

    public String getPassword(String loginName)
    {
        return tUserDao.getPassword(loginName);
    }

    public int getcountbyinviter(String tPhone)
    {
        return tUserDao.getcountbyinviter(tPhone);
    }
	
}