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
import com.thinkgem.jeesite.modules.mt.entity.TDbPlatform;
import com.thinkgem.jeesite.modules.mt.service.TDbPlatformService;

/**
 * 担保平台Controller
 * @author dongge
 * @version 2017-11-13
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tDbPlatform")
public class TDbPlatformController extends BaseController {

	@Autowired
	private TDbPlatformService tDbPlatformService;
	
	@ModelAttribute
	public TDbPlatform get(@RequestParam(required=false) String id) {
		TDbPlatform entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tDbPlatformService.get(id);
		}
		if (entity == null){
			entity = new TDbPlatform();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tDbPlatform:view")
	@RequestMapping(value = {"list", ""})
	public String list(TDbPlatform tDbPlatform, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TDbPlatform> page = tDbPlatformService.findPage(new Page<TDbPlatform>(request, response), tDbPlatform); 
		model.addAttribute("page", page);
		return "modules/mt/tDbPlatformList";
	}

	@RequiresPermissions("mt:tDbPlatform:view")
	@RequestMapping(value = "form")
	public String form(TDbPlatform tDbPlatform, Model model) {
		model.addAttribute("tDbPlatform", tDbPlatform);
		return "modules/mt/tDbPlatformForm";
	}

	@RequiresPermissions("mt:tDbPlatform:edit")
	@RequestMapping(value = "save")
	public String save(TDbPlatform tDbPlatform, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tDbPlatform)){
			return form(tDbPlatform, model);
		}
		tDbPlatformService.save(tDbPlatform);
		addMessage(redirectAttributes, "保存担保平台成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tDbPlatform/?repage";
	}
	
	@RequiresPermissions("mt:tDbPlatform:edit")
	@RequestMapping(value = "delete")
	public String delete(TDbPlatform tDbPlatform, RedirectAttributes redirectAttributes) {
		tDbPlatformService.delete(tDbPlatform);
		addMessage(redirectAttributes, "删除担保平台成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tDbPlatform/?repage";
	}

}