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
import com.thinkgem.jeesite.modules.mt.entity.TAcountDtl;
import com.thinkgem.jeesite.modules.mt.service.TAcountDtlService;

/**
 * 账户明细表Controller
 * @author dongge
 * @version 2017-11-23
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tAcountDtl")
public class TAcountDtlController extends BaseController {

	@Autowired
	private TAcountDtlService tAcountDtlService;
	
	@ModelAttribute
	public TAcountDtl get(@RequestParam(required=false) String id) {
		TAcountDtl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tAcountDtlService.get(id);
		}
		if (entity == null){
			entity = new TAcountDtl();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tAcountDtl:view")
	@RequestMapping(value = {"list", ""})
	public String list(TAcountDtl tAcountDtl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TAcountDtl> page = tAcountDtlService.findPage(new Page<TAcountDtl>(request, response), tAcountDtl); 
		model.addAttribute("page", page);
		return "modules/mt/tAcountDtlList";
	}

	@RequiresPermissions("mt:tAcountDtl:view")
	@RequestMapping(value = "form")
	public String form(TAcountDtl tAcountDtl, Model model) {
		model.addAttribute("tAcountDtl", tAcountDtl);
		return "modules/mt/tAcountDtlForm";
	}

	@RequiresPermissions("mt:tAcountDtl:edit")
	@RequestMapping(value = "save")
	public String save(TAcountDtl tAcountDtl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tAcountDtl)){
			return form(tAcountDtl, model);
		}
		tAcountDtlService.save(tAcountDtl);
		addMessage(redirectAttributes, "保存账户明细表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tAcountDtl/?repage";
	}
	
	@RequiresPermissions("mt:tAcountDtl:edit")
	@RequestMapping(value = "delete")
	public String delete(TAcountDtl tAcountDtl, RedirectAttributes redirectAttributes) {
		tAcountDtlService.delete(tAcountDtl);
		addMessage(redirectAttributes, "删除账户明细表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tAcountDtl/?repage";
	}

}