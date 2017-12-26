/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;

/**
 * 手机做任务DAO接口
 * @author dongg
 * @version 2017-12-23
 */
@MyBatisDao
public interface TMobiletaskApplyDao extends CrudDao<TMobiletaskApply> {

	void updatetofailed(TMobiletaskApply tMobiletaskApply);

	Map<String, String> getMapByid(String id);

    List<TMobiletaskApply> findListByTaskApplyExport(
            TMobiletaskApply tmobiletaskapply);

	int checkifexist(TMobiletaskApply tmobiletaskapply);
	
}