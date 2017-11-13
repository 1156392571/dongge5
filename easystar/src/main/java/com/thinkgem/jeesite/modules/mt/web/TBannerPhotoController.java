/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.mt.entity.TBannerPhoto;
import com.thinkgem.jeesite.modules.mt.service.TBannerPhotoService;

/**
 * 页面广告Controller
 * @author dongge
 * @version 2017-11-13
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tBannerPhoto")
public class TBannerPhotoController extends BaseController {

	@Autowired
	private TBannerPhotoService tBannerPhotoService;
	
	@ModelAttribute
	public TBannerPhoto get(@RequestParam(required=false) String id) {
		TBannerPhoto entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tBannerPhotoService.get(id);
		}
		if (entity == null){
			entity = new TBannerPhoto();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tBannerPhoto:view")
	@RequestMapping(value = {"list", ""})
	public String list(TBannerPhoto tBannerPhoto, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TBannerPhoto> page = tBannerPhotoService.findPage(new Page<TBannerPhoto>(request, response), tBannerPhoto); 
		model.addAttribute("page", page);
		return "modules/mt/tBannerPhotoList";
	}

	@RequiresPermissions("mt:tBannerPhoto:view")
	@RequestMapping(value = "form")
	public String form(TBannerPhoto tBannerPhoto, Model model) {
		model.addAttribute("tBannerPhoto", tBannerPhoto);
		return "modules/mt/tBannerPhotoForm";
	}

	@RequiresPermissions("mt:tBannerPhoto:edit")
	@RequestMapping(value = "save")
	public String save(TBannerPhoto tBannerPhoto, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tBannerPhoto)){
			return form(tBannerPhoto, model);
		}
		tBannerPhotoService.save(tBannerPhoto);
		addMessage(redirectAttributes, "保存页面广告成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tBannerPhoto/?repage";
	}
	
	@RequiresPermissions("mt:tBannerPhoto:edit")
	@RequestMapping(value = "delete")
	public String delete(TBannerPhoto tBannerPhoto, RedirectAttributes redirectAttributes) {
		tBannerPhotoService.delete(tBannerPhoto);
		addMessage(redirectAttributes, "删除页面广告成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tBannerPhoto/?repage";
	}

}