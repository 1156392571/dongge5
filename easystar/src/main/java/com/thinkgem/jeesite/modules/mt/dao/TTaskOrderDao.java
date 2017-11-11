/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TTaskOrder;

/**
 * 任务订单表DAO接口
 * @author dongge
 * @version 2017-11-10
 */
@MyBatisDao
public interface TTaskOrderDao extends CrudDao<TTaskOrder> {

	TTaskOrder checkpost(TTaskOrder taskorder);

	void saveTaskorder(TTaskOrder tTaskOrder);

	void cancelTaskorder(String id);
	
}