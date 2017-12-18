/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.web;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.mt.entity.TTixian;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TTixianService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 提现记录表Controller
 * @author dongge
 * @version 2017-12-17
 */
@Controller
@RequestMapping(value = "${adminPath}/mt/tTixian")
public class TTixianController extends BaseController {

	@Autowired
	private TTixianService tTixianService;
	@Autowired
	private TUserService tUserService;
	
	@ModelAttribute
	public TTixian get(@RequestParam(required=false) String id) {
		TTixian entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tTixianService.get(id);
		}
		if (entity == null){
			entity = new TTixian();
		}
		return entity;
	}
	
	@RequiresPermissions("mt:tTixian:view")
	@RequestMapping(value = {"list", ""})
	public String list(TTixian tTixian, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TTixian> page = tTixianService.findPage(new Page<TTixian>(request, response), tTixian); 
		model.addAttribute("tTixian", tTixian);
		model.addAttribute("page", page);
		return "modules/mt/tTixianList";
	}

	@RequiresPermissions("mt:tTixian:view")
	@RequestMapping(value = "form")
	public String form(TTixian tTixian, Model model) {
		model.addAttribute("tTixian", tTixian);
		return "modules/mt/tTixianForm";
	}

	@RequiresPermissions("mt:tTixian:edit")
	@RequestMapping(value = "save")
	public String save(TTixian tTixian, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tTixian)){
			return form(tTixian, model);
		}
		tTixianService.save(tTixian);
		addMessage(redirectAttributes, "保存提现记录表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTixian/?repage";
	}
	
	@RequiresPermissions("mt:tTixian:edit")
	@RequestMapping(value = "delete")
	public String delete(TTixian tTixian, RedirectAttributes redirectAttributes) {
		tTixianService.delete(tTixian);
		addMessage(redirectAttributes, "删除提现记录表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTixian/?repage";
	}

	
	@RequiresPermissions("mt:tTixian:edit")
	@RequestMapping(value = "update")
	public String update(TTixian tTixian, RedirectAttributes redirectAttributes) {
		tTixianService.updatestatus(tTixian);
		addMessage(redirectAttributes, "更新提现记录表成功");
		return "redirect:"+Global.getAdminPath()+"/mt/tTixian/?repage";
	}
	
	
	@RequestMapping(value = "tixiansubmit")
	@ResponseBody
	public Map<String,Object> tixiansubmit(@RequestBody String postData, 
            HttpServletRequest req, HttpServletResponse res) {
	    Map<String,Object> resultmap=new HashMap<String, Object>();
        JSONObject json = JSONObject.parseObject(postData);
        BigDecimal ttGetcashcount = new BigDecimal(json.getString("ttGetcashcount"));
        String ttAlipay = json.getString("ttAlipay");
        TTixian tTixian=new TTixian();
        tTixian.setTtGetcashcount(ttGetcashcount);
        tTixian.setTtAlipay(ttAlipay);
        tTixian.setTtGetcashstatus("1");
		Principal principal=UserUtils.getPrincipal();
		TUser tUser=tUserService.getUserByLoginName(principal.getLoginName());
		tTixian.setTtUserid(tUser.getId());
		String code="";
		String msg="";
		tTixianService.save(tTixian);
        //保存的同时进行更新操作
        tTixianService.updatAacountByid(tTixian);
		try{
	        code="1";
	        msg="提现申请已提交，到账时间为一个工作日内";
        }
        catch (Exception e){
            e.getMessage();
            code="0";
            msg="提现申请失败！！";
        }
		resultmap.put("code", code);
		resultmap.put("msg", msg);
		return resultmap;
	}
}