/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户信息附加表DAO接口
 * @author dongge
 * @version 2017-11-02
 */
@MyBatisDao
public interface TUserDao extends CrudDao<TUser> {

    TUser getUserByLoginName(String loginName);

    int updUser(TUser tUser);

    int updSysUser(TUser tUser);

    void updsysuserPassword(User user);

    String getPassword(String loginName);

    int getcountbyinviter(String tPhone);

	void addpicturecode(Map map);

    int checkusername(String username);

    int checkphone(String phone);

	TUser getTUserByPhone(String tPhone);
	
}