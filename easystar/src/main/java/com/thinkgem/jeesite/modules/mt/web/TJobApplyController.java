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
import com.thinkgem.jeesite.modules.mt.entity.TJobApply;
import com.thinkgem.jeesite.modules.mt.service.TJobApplyService;

/**
 * 兼职申请表Controller
 * @author dongge
 * @version 2017-11-27
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tJobApply")
public class TJobApplyController extends BaseController {

	@Autowired
	private TJobApplyService tJobApplyService;
	
	@ModelAttribute
	public TJobApply get(@RequestParam(required=false) String id) {
		TJobApply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tJobApplyService.get(id);
		}
		if (entity == null){
			entity = new TJobApply();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tJobApply:view")
	@RequestMapping(value = {"list", ""})
	public String list(TJobApply tJobApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TJobApply> page = tJobApplyService.findPage(new Page<TJobApply>(request, response), tJobApply); 
		model.addAttribute("page", page);
		return "modules/mt/tJobApplyList";
	}

	@RequiresPermissions("mt:tJobApply:view")
	@RequestMapping(value = "form")
	public String form(TJobApply tJobApply, Model model) {
		model.addAttribute("tJobApply", tJobApply);
		return "modules/mt/tJobApplyForm";
	}

	@RequiresPermissions("mt:tJobApply:edit")
	@RequestMapping(value = "save")
	public String save(TJobApply tJobApply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tJobApply)){
			return form(tJobApply, model);
		}
		tJobApplyService.save(tJobApply);
		addMessage(redirectAttributes, "保存兼职申请表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tJobApply/?repage";
	}
	
	@RequiresPermissions("mt:tJobApply:edit")
	@RequestMapping(value = "delete")
	public String delete(TJobApply tJobApply, RedirectAttributes redirectAttributes) {
		tJobApplyService.delete(tJobApply);
		addMessage(redirectAttributes, "删除兼职申请表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tJobApply/?repage";
	}

}