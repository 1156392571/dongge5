/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TUser;

/**
 * 用户信息附加表DAO接口
 * @author dongge
 * @version 2017-11-02
 */
@MyBatisDao
public interface TUserDao extends CrudDao<TUser> {

    TUser getUserByLoginName(String loginName);
	
}