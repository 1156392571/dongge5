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
import com.thinkgem.jeesite.modules.mt.entity.TTask;
import com.thinkgem.jeesite.modules.mt.service.TTaskService;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 发布任务Controller
 * @author dongge
 * @version 2017-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tTask")
public class TTaskController extends BaseController {

	@Autowired
	private TTaskService tTaskService;
	
	@ModelAttribute
	public TTask get(@RequestParam(required=false) String id) {
		TTask entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tTaskService.get(id);
		}
		if (entity == null){
			entity = new TTask();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tTask:view")
	@RequestMapping(value = {"list", ""})
	public String list(TTask tTask, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TTask> page = tTaskService.findPage(new Page<TTask>(request, response), tTask); 
		model.addAttribute("page", page);
		model.addAttribute("tTask", tTask);
		return "modules/mt/tTaskList";
	}

	@RequiresPermissions("mt:tTask:view")
	@RequestMapping(value = "form")
	public String form(TTask tTask, Model model) {
		model.addAttribute("tTask", tTask);
		return "modules/mt/tTaskForm";
	}

	@RequiresPermissions("mt:tTask:edit")
	@RequestMapping(value = "save")
	public String save(TTask tTask, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tTask)){
			return form(tTask, model);
		}
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		String task_userId=principal.getLoginName();
		tTask.setTaskUserid(task_userId);
		tTaskService.save(tTask);
		addMessage(redirectAttributes, "保存发布任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTask/?repage";
	}
	
	@RequiresPermissions("mt:tTask:edit")
	@RequestMapping(value = "delete")
	public String delete(TTask tTask, RedirectAttributes redirectAttributes) {
		tTaskService.delete(tTask);
		addMessage(redirectAttributes, "删除发布任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTask/?repage";
	}

}