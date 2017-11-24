/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TBannerPhoto;

/**
 * 页面广告DAO接口
 * @author dongge
 * @version 2017-11-13
 */
@MyBatisDao
public interface TBannerPhotoDao extends CrudDao<TBannerPhoto> {

    List<TBannerPhoto> getheadbennerList();

    List<TBannerPhoto> getsidebennerList();
	
}