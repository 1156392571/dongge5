/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.web;

import java.util.Map;

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
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;
import com.thinkgem.jeesite.modules.mt.service.TMobiletaskApplyService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;

/**
 * 手机做任务Controller
 * @author dongg
 * @version 2017-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tMobiletaskApply")
public class TMobiletaskApplyController extends BaseController {

	@Autowired
	private TMobiletaskApplyService tMobiletaskApplyService;
	@Autowired
	private TUserService tUserService;
	
	@ModelAttribute
	public TMobiletaskApply get(@RequestParam(required=false) String id) {
		TMobiletaskApply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tMobiletaskApplyService.get(id);
		}
		if (entity == null){
			entity = new TMobiletaskApply();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tMobiletaskApply:view")
	@RequestMapping(value = {"list", ""})
	public String list(TMobiletaskApply tMobiletaskApply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TMobiletaskApply> page = tMobiletaskApplyService.findPage(new Page<TMobiletaskApply>(request, response), tMobiletaskApply); 
		model.addAttribute("tMobiletaskApply", tMobiletaskApply);
		model.addAttribute("page", page);
		return "modules/mt/tMobiletaskApplyList";
	}

	@RequiresPermissions("mt:tMobiletaskApply:view")
	@RequestMapping(value = "form")
	public String form(TMobiletaskApply tMobiletaskApply, Model model) {
		model.addAttribute("tMobiletaskApply", tMobiletaskApply);
		return "modules/mt/tMobiletaskApplyForm";
	}

	@RequiresPermissions("mt:tMobiletaskApply:edit")
	@RequestMapping(value = "save")
	public String save(TMobiletaskApply tMobiletaskApply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tMobiletaskApply)){
			return form(tMobiletaskApply, model);
		}
		tMobiletaskApplyService.save(tMobiletaskApply);
		addMessage(redirectAttributes, "保存手机做任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tMobiletaskApply/?repage";
	}
	
	@RequiresPermissions("mt:tMobiletaskApply:edit")
	@RequestMapping(value = "delete")
	public String delete(TMobiletaskApply tMobiletaskApply, RedirectAttributes redirectAttributes) {
		tMobiletaskApplyService.delete(tMobiletaskApply);
		addMessage(redirectAttributes, "删除手机做任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tMobiletaskApply/?repage";
	}

	@RequestMapping(value = "checkpass")
	public String checkpass(TMobiletaskApply tMobiletaskApply, Model model, RedirectAttributes redirectAttributes) {
		if("2".equals(tMobiletaskApply.getTmaStatus())){
			//说明任务审核成功了
			//获取所有的有关信息
			Map<String,String> map=tMobiletaskApplyService.getMapByid(tMobiletaskApply.getId());
			//1.更新自己的当前账户
			tUserService.updateSelfAcount(map);
			//2.更新A对应的钱
			tUserService.updateAcountA(map);
			//2.更新B对应的钱
			tUserService.updateAcountB(map);
			//2.更新C对应的钱
			tUserService.updateAcountC(map);
			
		}
		tMobiletaskApplyService.updatetofailed(tMobiletaskApply);
		addMessage(redirectAttributes, "保存手机做任务成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tMobiletaskApply/?repage";
	}
	
}