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
import com.thinkgem.jeesite.modules.mt.entity.TTaskOrder;
import com.thinkgem.jeesite.modules.mt.service.TTaskOrderService;

/**
 * 任务订单表Controller
 * @author dongge
 * @version 2017-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tTaskOrder")
public class TTaskOrderController extends BaseController {

	@Autowired
	private TTaskOrderService tTaskOrderService;
	
	@ModelAttribute
	public TTaskOrder get(@RequestParam(required=false) String id) {
		TTaskOrder entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tTaskOrderService.get(id);
		}
		if (entity == null){
			entity = new TTaskOrder();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tTaskOrder:view")
	@RequestMapping(value = {"list", ""})
	public String list(TTaskOrder tTaskOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TTaskOrder> page = tTaskOrderService.findPage(new Page<TTaskOrder>(request, response), tTaskOrder); 
		model.addAttribute("page", page);
		return "modules/mt/tTaskOrderList";
	}

	@RequiresPermissions("mt:tTaskOrder:view")
	@RequestMapping(value = "form")
	public String form(TTaskOrder tTaskOrder, Model model) {
		model.addAttribute("tTaskOrder", tTaskOrder);
		return "modules/mt/tTaskOrderForm";
	}

	@RequiresPermissions("mt:tTaskOrder:edit")
	@RequestMapping(value = "save")
	public String save(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tTaskOrder)){
			return form(tTaskOrder, model);
		}
		tTaskOrderService.save(tTaskOrder);
		addMessage(redirectAttributes, "保存任务订单表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTaskOrder/?repage";
	}
	
	@RequiresPermissions("mt:tTaskOrder:edit")
	@RequestMapping(value = "delete")
	public String delete(TTaskOrder tTaskOrder, RedirectAttributes redirectAttributes) {
		tTaskOrderService.delete(tTaskOrder);
		addMessage(redirectAttributes, "删除任务订单表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTaskOrder/?repage";
	}

}