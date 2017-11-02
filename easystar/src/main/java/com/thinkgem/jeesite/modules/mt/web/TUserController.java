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
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TUserService;

/**
 * 用户信息附加表Controller
 * @author dongge
 * @version 2017-11-02
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tUser")
public class TUserController extends BaseController {

	@Autowired
	private TUserService tUserService;
	
	@ModelAttribute
	public TUser get(@RequestParam(required=false) String id) {
		TUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tUserService.get(id);
		}
		if (entity == null){
			entity = new TUser();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(TUser tUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TUser> page = tUserService.findPage(new Page<TUser>(request, response), tUser); 
		model.addAttribute("tUser", tUser);
		model.addAttribute("page", page);
		return "modules/mt/tUserList";
	}

	@RequiresPermissions("mt:tUser:view")
	@RequestMapping(value = "form")
	public String form(TUser tUser, Model model) {
		model.addAttribute("tUser", tUser);
		return "modules/mt/tUserForm";
	}

	@RequiresPermissions("mt:tUser:edit")
	@RequestMapping(value = "save")
	public String save(TUser tUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tUser)){
			return form(tUser, model);
		}
		tUserService.save(tUser);
		addMessage(redirectAttributes, "保存用户信息附加表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tUser/?repage";
	}
	
	@RequiresPermissions("mt:tUser:edit")
	@RequestMapping(value = "delete")
	public String delete(TUser tUser, RedirectAttributes redirectAttributes) {
		tUserService.delete(tUser);
		addMessage(redirectAttributes, "删除用户信息附加表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tUser/?repage";
	}

}