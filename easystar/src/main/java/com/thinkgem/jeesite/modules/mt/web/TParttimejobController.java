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
import com.thinkgem.jeesite.modules.mt.entity.TParttimejob;
import com.thinkgem.jeesite.modules.mt.service.TParttimejobService;

/**
 * 兼职表Controller
 * @author dongge
 * @version 2017-11-27
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tParttimejob")
public class TParttimejobController extends BaseController {

	@Autowired
	private TParttimejobService tParttimejobService;
	
	@ModelAttribute
	public TParttimejob get(@RequestParam(required=false) String id) {
		TParttimejob entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tParttimejobService.get(id);
		}
		if (entity == null){
			entity = new TParttimejob();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tParttimejob:view")
	@RequestMapping(value = {"list", ""})
	public String list(TParttimejob tParttimejob, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TParttimejob> page = tParttimejobService.findPage(new Page<TParttimejob>(request, response), tParttimejob); 
		model.addAttribute("page", page);
		return "modules/mt/tParttimejobList";
	}

	@RequiresPermissions("mt:tParttimejob:view")
	@RequestMapping(value = "form")
	public String form(TParttimejob tParttimejob, Model model) {
		model.addAttribute("tParttimejob", tParttimejob);
		return "modules/mt/tParttimejobForm";
	}

	@RequiresPermissions("mt:tParttimejob:edit")
	@RequestMapping(value = "save")
	public String save(TParttimejob tParttimejob, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tParttimejob)){
			return form(tParttimejob, model);
		}
		tParttimejobService.save(tParttimejob);
		addMessage(redirectAttributes, "保存兼职表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tParttimejob/?repage";
	}
	
	@RequiresPermissions("mt:tParttimejob:edit")
	@RequestMapping(value = "delete")
	public String delete(TParttimejob tParttimejob, RedirectAttributes redirectAttributes) {
		tParttimejobService.delete(tParttimejob);
		addMessage(redirectAttributes, "删除兼职表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tParttimejob/?repage";
	}

}