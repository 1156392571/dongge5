/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.mt.entity.TBannerPhoto;
import com.thinkgem.jeesite.modules.mt.dao.TBannerPhotoDao;

/**
 * 页面广告Service
 * @author dongge
 * @version 2017-11-13
 */
@Service
@Transactional(readOnly = true)
public class TBannerPhotoService extends CrudService<TBannerPhotoDao, TBannerPhoto> {
    @Autowired TBannerPhotoDao tBannerPhotoDao;
    
	public TBannerPhoto get(String id) {
		return super.get(id);
	}
	
	public List<TBannerPhoto> findList(TBannerPhoto tBannerPhoto) {
		return super.findList(tBannerPhoto);
	}
	
	public Page<TBannerPhoto> findPage(Page<TBannerPhoto> page, TBannerPhoto tBannerPhoto) {
		return super.findPage(page, tBannerPhoto);
	}
	
	@Transactional(readOnly = false)
	public void save(TBannerPhoto tBannerPhoto) {
		super.save(tBannerPhoto);
	}
	
	@Transactional(readOnly = false)
	public void delete(TBannerPhoto tBannerPhoto) {
		super.delete(tBannerPhoto);
	}

    public List<TBannerPhoto> getheadbennerList(){
        return tBannerPhotoDao.getheadbennerList();
    }

    public List<TBannerPhoto> getsidebennerList()
    {
        return tBannerPhotoDao.getsidebennerList();
    }
	
}