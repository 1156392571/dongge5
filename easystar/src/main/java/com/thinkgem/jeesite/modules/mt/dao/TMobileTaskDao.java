/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TMobileTask;

/**
 * 手机任务表DAO接口
 * @author donggge
 * @version 2017-12-21
 */
@MyBatisDao
public interface TMobileTaskDao extends CrudDao<TMobileTask> {
	
}