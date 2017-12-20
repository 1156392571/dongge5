/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TErweimaTask;
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

    @Transactional(readOnly = false)
	public void addpicturecode(Map map) {
		// TODO Auto-generated method stub
		tUserDao.addpicturecode(map);
	}

    public int checkusername(String username)
    {
        return tUserDao.checkusername(username);
    }

    public int checkphone(String phone)
    {
        return tUserDao.checkphone(phone);
    }

	public TUser getTUserByPhone(String tPhone) {
		// TODO Auto-generated method stub
		return tUserDao.getTUserByPhone(tPhone);
	}

	public int getcountExtendA(String id) {
		return tUserDao.getcountExtendA(id);
	}
	
	public int getcountExtendB(String id) {
		return tUserDao.getcountExtendB(id);
	}
	
	public int getcountExtendC(String id) {
		return tUserDao.getcountExtendC(id);
	}

	public String getphotourl(String id) {
		return tUserDao.getphotourl(id);
	}

	public List<TUser> getListExtendA(String id) {
		return tUserDao.getListExtendA(id);
	}

	public List<TUser> getListExtendB(String id) {
		return tUserDao.getListExtendB(id);
	}
	
	public List<TUser> getListExtendC(String id) {
		return tUserDao.getListExtendC(id);
	}

	@Transactional(readOnly = false)
	public void updAcount(TErweimaTask tErweimaTask) {
		tUserDao.updAcount(tErweimaTask);
	}
	
	@Transactional(readOnly = false)
	public void updAcountA(String id) {
		tUserDao.updAcountA(id);
	}
	
	@Transactional(readOnly = false)
	public void updAcountB(String id) {
		tUserDao.updAcountB(id);
	}
	
	@Transactional(readOnly = false)
	public void updAcountC(String id) {
		tUserDao.updAcountC(id);
	}

	@Transactional(readOnly = false)
    public void updAllsignBytimer()
    {
	    tUserDao.updAllsignBytimer();
    }

	@Transactional(readOnly = false)
    public void register(String loginName)
    {
	    tUserDao.register(loginName);
    }
}