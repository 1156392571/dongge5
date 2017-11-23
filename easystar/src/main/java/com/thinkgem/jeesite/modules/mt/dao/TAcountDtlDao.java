/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TAcountDtl;

/**
 * 账户明细表DAO接口
 * @author dongge
 * @version 2017-11-23
 */
@MyBatisDao
public interface TAcountDtlDao extends CrudDao<TAcountDtl> {
	
}