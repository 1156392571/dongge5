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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TMobiletaskApplyService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

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
			//同时添加一条数据到自己这个账户下
			//首先就是通过当前的id获取自己的A,B,C三级的用户id
			Map<Object,Object> mapdtl=tUserService.getAllmessageByApplyid(tMobiletaskApply.getId());
			String userid=(String) mapdtl.get("id");//做任务的用户id
			String Auserid=(String) mapdtl.get("Auserid");//返佣的A级用户id
			String Buserid=(String) mapdtl.get("Buserid");//返佣的B级用户id
			String Cuserid=(String) mapdtl.get("Cuserid");//返佣的C级用户id
			String phone=(String) mapdtl.get("t_phone");//做任务的用户手机号
			String taskname=(String) mapdtl.get("tmt_name");//做任务的任务名称tmt_name
			BigDecimal price=(BigDecimal) mapdtl.get("tmt_price");//做任务的用户id
			BigDecimal tmt_rebateA= (BigDecimal)mapdtl.get("tmt_rebateA");
			BigDecimal tmt_rebateB=(BigDecimal)mapdtl.get("tmt_rebateB");
			BigDecimal tmt_rebateC=(BigDecimal)mapdtl.get("tmt_rebateC");
            String id=IdGen.uuid();
            String idA=IdGen.uuid();
            String idB=IdGen.uuid();
            String idC=IdGen.uuid();
            Map<String,Object> mapU=new HashMap<String,Object>();
            Map<String,Object> mapA=new HashMap<String,Object>();
            Map<String,Object> mapB=new HashMap<String,Object>();
            Map<String,Object> mapC=new HashMap<String,Object>();
            //当前用户
            mapU.put("id", id);
            mapU.put("tma_userid", userid);
            mapU.put("tma_dtlname",taskname);
            mapU.put("tma_jine",price);
            mapU.put("tma_reserve1","1");
            tUserService.addtomobileacountdtl(mapU);
            //A级用户
            mapA.put("id", idA);
            mapA.put("tma_userid", Auserid);
            mapA.put("tma_dtlname",phone+"用户为你赚赏金");
            mapA.put("tma_jine",tmt_rebateA);
            mapA.put("tma_reserve1","2");
            mapA.put("tma_fromuserid",userid);
            tUserService.addtomobileacountdtl(mapA);
            //B级用户
            mapB.put("id", idB);
            mapB.put("tma_userid", Buserid);
            mapB.put("tma_dtlname",phone+"用户为你赚赏金");
            mapB.put("tma_jine",tmt_rebateB);
            mapB.put("tma_reserve1","2");
            mapB.put("tma_fromuserid",userid);
            tUserService.addtomobileacountdtl(mapB);
            //C级用户
            mapC.put("id", idC);
            mapC.put("tma_userid", Cuserid);
            mapC.put("tma_dtlname",phone+"用户为你赚赏金");
            mapC.put("tma_jine",tmt_rebateC);
            mapC.put("tma_reserve1","2");
            mapC.put("tma_fromuserid",userid);
            tUserService.addtomobileacountdtl(mapC);
			
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