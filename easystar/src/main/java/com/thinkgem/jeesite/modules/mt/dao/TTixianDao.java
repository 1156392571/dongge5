/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TTixian;

/**
 * 提现记录表DAO接口
 * @author dongge
 * @version 2017-12-17
 */
@MyBatisDao
public interface TTixianDao extends CrudDao<TTixian> {

	void updatestatus(TTixian tTixian);
	
}