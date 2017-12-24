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
import com.thinkgem.jeesite.modules.mt.entity.TMobileTask;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TMobileTaskService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 手机任务表Controller
 * @author donggge
 * @version 2017-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tMobileTask")
public class TMobileTaskController extends BaseController {

	@Autowired
	private TMobileTaskService tMobileTaskService;
	@Autowired
	private TUserService tUserService;
	
	@ModelAttribute
	public TMobileTask get(@RequestParam(required=false) String id) {
		TMobileTask entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tMobileTaskService.get(id);
		}
		if (entity == null){
			entity = new TMobileTask();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tMobileTask:view")
	@RequestMapping(value = {"list", ""})
	public String list(TMobileTask tMobileTask, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TMobileTask> page = tMobileTaskService.findPage(new Page<TMobileTask>(request, response), tMobileTask); 
		model.addAttribute("page", page);
		model.addAttribute("tMobileTask", tMobileTask);
		return "modules/mt/tMobileTaskList";
	}

	@RequiresPermissions("mt:tMobileTask:view")
	@RequestMapping(value = "form")
	public String form(TMobileTask tMobileTask, Model model) {
		model.addAttribute("tMobileTask", tMobileTask);
		return "modules/mt/tMobileTaskForm";
	}

	@RequiresPermissions("mt:tMobileTask:edit")
	@RequestMapping(value = "save")
	public String save(TMobileTask tMobileTask, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tMobileTask)){
			return form(tMobileTask, model);
		}
		Principal principal=UserUtils.getPrincipal();
        String id=principal.getId();
        tMobileTask.setTmtUserid(id);
		tMobileTaskService.save(tMobileTask);
		addMessage(redirectAttributes, "保存手机任务表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tMobileTask/?repage";
	}
	
	@RequiresPermissions("mt:tMobileTask:edit")
	@RequestMapping(value = "delete")
	public String delete(TMobileTask tMobileTask, RedirectAttributes redirectAttributes) {
		tMobileTaskService.delete(tMobileTask);
		addMessage(redirectAttributes, "删除手机任务表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tMobileTask/?repage";
	}

}