/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TTask;

/**
 * 发布任务DAO接口
 * @author dongge
 * @version 2017-11-09
 */
@MyBatisDao
public interface TTaskDao extends CrudDao<TTask> {

	List<TTask> findPageAndself(TTask tTask);

	void updateAmount(String id);

	void updateaddAmount(String id);
	
}