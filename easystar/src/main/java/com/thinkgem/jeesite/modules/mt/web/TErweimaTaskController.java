/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.web;

import java.util.List;

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
import com.thinkgem.jeesite.modules.mt.entity.TErweimaTask;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TErweimaTaskService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 扫码任务Controller
 * @author dongge
 * @version 2017-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tErweimaTask")
public class TErweimaTaskController extends BaseController {

	@Autowired
	private TErweimaTaskService tErweimaTaskService;
	@Autowired
	private TUserService tUserService;
	
	
	@ModelAttribute
	public TErweimaTask get(@RequestParam(required=false) String id) {
		TErweimaTask entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tErweimaTaskService.get(id);
		}
		if (entity == null){
			entity = new TErweimaTask();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tErweimaTask:view")
	@RequestMapping(value = {"list", ""})
	public String list(TErweimaTask tErweimaTask, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TErweimaTask> page = tErweimaTaskService.findPage(new Page<TErweimaTask>(request, response), tErweimaTask); 
		model.addAttribute("tErweimaTask", tErweimaTask);
		model.addAttribute("page", page);
		return "modules/mt/tErweimaTaskList";
	}

	@RequiresPermissions("mt:tErweimaTask:view")
	@RequestMapping(value = "form")
	public String form(TErweimaTask tErweimaTask, Model model) {
		//获取所有的用户列表
		TUser tUser=new TUser();
		List<TUser> list=tUserService.findList(tUser);
		model.addAttribute("list", list);
		model.addAttribute("tErweimaTask", tErweimaTask);
		return "modules/mt/tErweimaTaskForm";
	}

	@RequiresPermissions("mt:tErweimaTask:edit")
	@RequestMapping(value = "save")
	public String save(TErweimaTask tErweimaTask, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tErweimaTask)){
			return form(tErweimaTask, model);
		}
		tErweimaTaskService.save(tErweimaTask);
		//审核成功之后就保存之后同时向对应的自己向上的A级，B级，C级
		//1.首先给当前加上做任务赚的钱，获取当前用户
		tUserService.updAcount(tErweimaTask);
		//2.给A级推荐人增加费用--10元
		tUserService.updAcountA(tErweimaTask.getTetUserid());
		//3.给B级推荐人增加费用--5元
		tUserService.updAcountB(tErweimaTask.getTetUserid());
		//3.给C级推荐人增加费用--2元
		tUserService.updAcountC(tErweimaTask.getTetUserid());
		
		addMessage(redirectAttributes, "保存扫码任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tErweimaTask/?repage";
	}
	
	@RequiresPermissions("mt:tErweimaTask:edit")
	@RequestMapping(value = "delete")
	public String delete(TErweimaTask tErweimaTask, RedirectAttributes redirectAttributes) {
		tErweimaTaskService.delete(tErweimaTask);
		addMessage(redirectAttributes, "删除扫码任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tErweimaTask/?repage";
	}

}