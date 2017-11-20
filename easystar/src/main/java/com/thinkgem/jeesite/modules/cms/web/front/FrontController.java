/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Comment;
import com.thinkgem.jeesite.modules.cms.entity.Link;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.service.CommentService;
import com.thinkgem.jeesite.modules.cms.service.LinkService;
import com.thinkgem.jeesite.modules.cms.service.SiteService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.mt.entity.TDbPlatform;
import com.thinkgem.jeesite.modules.mt.entity.TProduct;
import com.thinkgem.jeesite.modules.mt.entity.TTask;
import com.thinkgem.jeesite.modules.mt.entity.TTaskOrder;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.mt.service.TDbPlatformService;
import com.thinkgem.jeesite.modules.mt.service.TProductService;
import com.thinkgem.jeesite.modules.mt.service.TTaskOrderService;
import com.thinkgem.jeesite.modules.mt.service.TTaskService;
import com.thinkgem.jeesite.modules.mt.service.TUserService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 网站Controller
 * @author ThinkGem
 * @version 2013-5-29
 */
@Controller
@RequestMapping(value = "${frontPath}")
public class FrontController extends BaseController{
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private SiteService siteService;
	@Autowired
	private TProductService tProductService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private TTaskService tTaskService;
	@Autowired
	private TTaskOrderService tTaskOrderService;
	@Autowired
	private TDbPlatformService tDbPlatformService;
	@Autowired
	private TUserService tUserService;
	
	
	/**
	 * 网站首页
	 * */
	@RequestMapping
	public String index(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		model.addAttribute("isIndex", true);
//		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontIndex";
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontproductList";
	}
	
	/**
	 * 网站首页
	 */
	@RequestMapping(value = "index-{siteId}${urlSuffix}")
	public String index(@PathVariable String siteId, Model model) {
		if (siteId.equals("1")){
			return "redirect:"+Global.getFrontPath();
		}
		Site site = CmsUtils.getSite(siteId);
		// 子站有独立页面，则显示独立页面
		if (StringUtils.isNotBlank(site.getCustomIndexView())){
			model.addAttribute("site", site);
			model.addAttribute("isIndex", true);
			return "modules/cms/front/themes/"+site.getTheme()+"/frontIndex"+site.getCustomIndexView();
		}
		// 否则显示子站第一个栏目
		List<Category> mainNavList = CmsUtils.getMainNavList(siteId);
		if (mainNavList.size() > 0){
			String firstCategoryId = CmsUtils.getMainNavList(siteId).get(0).getId();
			return "redirect:"+Global.getFrontPath()+"/list-"+firstCategoryId+Global.getUrlSuffix();
		}else{
			model.addAttribute("site", site);
			return "modules/cms/front/themes/"+site.getTheme()+"/frontListCategory";
		}
	}
	
	/**
	 * 内容列表
	 */
	@RequestMapping(value = "list-{categoryId}${urlSuffix}")
	public String list(@PathVariable String categoryId, @RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="15") Integer pageSize, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		Site site = siteService.get(category.getSite().getId());
		model.addAttribute("site", site);
		// 2：简介类栏目，栏目第一条内容
		if("2".equals(category.getShowModes()) && "article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId().equals("1")){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			model.addAttribute("category", category);
			model.addAttribute("categoryList", categoryList);
			// 获取文章内容
			Page<Article> page = new Page<Article>(1, 1, -1);
			Article article = new Article(category);
			page = articleService.findPage(page, article, false);
			if (page.getList().size()>0){
				article = page.getList().get(0);
				article.setArticleData(articleDataService.get(article.getId()));
				articleService.updateHitsAddOne(article.getId());
			}
			model.addAttribute("article", article);
            CmsUtils.addViewConfigAttribute(model, category);
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
			return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
		}else{
			List<Category> categoryList = categoryService.findByParentId(category.getId(), category.getSite().getId());
			// 展现方式为1 、无子栏目或公共模型，显示栏目内容列表
			if("1".equals(category.getShowModes())||categoryList.size()==0){
				// 有子栏目并展现方式为1，则获取第一个子栏目；无子栏目，则获取同级分类列表。
				if(categoryList.size()>0){
					category = categoryList.get(0);
				}else{
					// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
					if (category.getParent().getId().equals("1")){
						categoryList.add(category);
					}else{
						categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
					}
				}
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				// 获取内容列表
				if ("article".equals(category.getModule())){
					Page<Article> page = new Page<Article>(pageNo, pageSize);
					//System.out.println(page.getPageNo());
					page = articleService.findPage(page, new Article(category), false);
					model.addAttribute("page", page);
					// 如果第一个子栏目为简介类栏目，则获取该栏目第一篇文章
					if ("2".equals(category.getShowModes())){
						Article article = new Article(category);
						if (page.getList().size()>0){
							article = page.getList().get(0);
							article.setArticleData(articleDataService.get(article.getId()));
							articleService.updateHitsAddOne(article.getId());
						}
						model.addAttribute("article", article);
			            CmsUtils.addViewConfigAttribute(model, category);
			            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
						return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
					}
				}else if ("link".equals(category.getModule())){
					Page<Link> page = new Page<Link>(1, -1);
					page = linkService.findPage(page, new Link(category), false);
					model.addAttribute("page", page);
				}
				String view = "/frontList";
				if (StringUtils.isNotBlank(category.getCustomListView())){
					view = "/"+category.getCustomListView();
				}
	            CmsUtils.addViewConfigAttribute(model, category);
                site =siteService.get(category.getSite().getId());
                //System.out.println("else 栏目第一条内容 _2 :"+category.getSite().getTheme()+","+site.getTheme());
				return "modules/cms/front/themes/"+siteService.get(category.getSite().getId()).getTheme()+view;
				//return "modules/cms/front/themes/"+category.getSite().getTheme()+view;
			}
			// 有子栏目：显示子栏目列表
			else{
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categoryList);
				String view = "/frontListCategory";
				if (StringUtils.isNotBlank(category.getCustomListView())){
					view = "/"+category.getCustomListView();
				}
	            CmsUtils.addViewConfigAttribute(model, category);
				return "modules/cms/front/themes/"+site.getTheme()+view;
			}
		}
	}

	/**
	 * 内容列表（通过url自定义视图）
	 */
	@RequestMapping(value = "listc-{categoryId}-{customView}${urlSuffix}")
	public String listCustom(@PathVariable String categoryId, @PathVariable String customView, @RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="15") Integer pageSize, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		Site site = siteService.get(category.getSite().getId());
		model.addAttribute("site", site);
		List<Category> categoryList = categoryService.findByParentId(category.getId(), category.getSite().getId());
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryList);
        CmsUtils.addViewConfigAttribute(model, category);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontListCategory"+customView;
	}

	/**
	 * 显示内容
	 */
	@RequestMapping(value = "view-{categoryId}-{contentId}${urlSuffix}")
	public String view(@PathVariable String categoryId, @PathVariable String contentId, Model model) {
		Category category = categoryService.get(categoryId);
		if (category==null){
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "error/404";
		}
		model.addAttribute("site", category.getSite());
		if ("article".equals(category.getModule())){
			// 如果没有子栏目，并父节点为跟节点的，栏目列表为当前栏目。
			List<Category> categoryList = Lists.newArrayList();
			if (category.getParent().getId().equals("1")){
				categoryList.add(category);
			}else{
				categoryList = categoryService.findByParentId(category.getParent().getId(), category.getSite().getId());
			}
			// 获取文章内容
			Article article = articleService.get(contentId);
			if (article==null || !Article.DEL_FLAG_NORMAL.equals(article.getDelFlag())){
				return "error/404";
			}
			// 文章阅读次数+1
			articleService.updateHitsAddOne(contentId);
			// 获取推荐文章列表
			List<Object[]> relationList = articleService.findByIds(articleDataService.get(article.getId()).getRelation());
			// 将数据传递到视图
			model.addAttribute("category", categoryService.get(article.getCategory().getId()));
			model.addAttribute("categoryList", categoryList);
			article.setArticleData(articleDataService.get(article.getId()));
			model.addAttribute("article", article);
			model.addAttribute("relationList", relationList); 
            CmsUtils.addViewConfigAttribute(model, article.getCategory());
            CmsUtils.addViewConfigAttribute(model, article.getViewConfig());
            Site site = siteService.get(category.getSite().getId());
            model.addAttribute("site", site);
//			return "modules/cms/front/themes/"+category.getSite().getTheme()+"/"+getTpl(article);
            return "modules/cms/front/themes/"+site.getTheme()+"/"+getTpl(article);
		}
		return "error/404";
	}
	
	/**
	 * 内容评论
	 */
	@RequestMapping(value = "comment", method=RequestMethod.GET)
	public String comment(String theme, Comment comment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Comment> page = new Page<Comment>(request, response);
		Comment c = new Comment();
		c.setCategory(comment.getCategory());
		c.setContentId(comment.getContentId());
		c.setDelFlag(Comment.DEL_FLAG_NORMAL);
		page = commentService.findPage(page, c);
		model.addAttribute("page", page);
		model.addAttribute("comment", comment);
		return "modules/cms/front/themes/"+theme+"/frontComment";
	}
	
	/**
	 * 内容评论保存
	 */
	@ResponseBody
	@RequestMapping(value = "comment", method=RequestMethod.POST)
	public String commentSave(Comment comment, String validateCode,@RequestParam(required=false) String replyId, HttpServletRequest request) {
		if (StringUtils.isNotBlank(validateCode)){
			if (ValidateCodeServlet.validate(request, validateCode)){
				if (StringUtils.isNotBlank(replyId)){
					Comment replyComment = commentService.get(replyId);
					if (replyComment != null){
						comment.setContent("<div class=\"reply\">"+replyComment.getName()+":<br/>"
								+replyComment.getContent()+"</div>"+comment.getContent());
					}
				}
				comment.setIp(request.getRemoteAddr());
				comment.setCreateDate(new Date());
				comment.setDelFlag(Comment.DEL_FLAG_AUDIT);
				commentService.save(comment);
				return "{result:1, message:'提交成功。'}";
			}else{
				return "{result:2, message:'验证码不正确。'}";
			}
		}else{
			return "{result:2, message:'验证码不能为空。'}";
		}
	}
	
	/**
	 * 站点地图
	 */
	@RequestMapping(value = "map-{siteId}${urlSuffix}")
	public String map(@PathVariable String siteId, Model model) {
		Site site = CmsUtils.getSite(siteId!=null?siteId:Site.defaultSiteId());
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontMap";
	}

    private String getTpl(Article article){
        if(StringUtils.isBlank(article.getCustomContentView())){
            String view = null;
            Category c = article.getCategory();
            boolean goon = true;
            do{
                if(StringUtils.isNotBlank(c.getCustomContentView())){
                    view = c.getCustomContentView();
                    goon = false;
                }else if(c.getParent() == null || c.getParent().isRoot()){
                    goon = false;
                }else{
                    c = c.getParent();
                }
            }while(goon);
            return StringUtils.isBlank(view) ? Article.DEFAULT_TEMPLATE : view;
        }else{
            return article.getCustomContentView();
        }
    }
    
    /**
	 * 跳转到注册页面
	 */
	@RequestMapping(value = "toreg")
	public String toreg(TUser tUser,Model model){
		model.addAttribute("tUser", tUser);
		return "modules/sys/userReg";
	}
	
	/**
	 * 保存注册
	 */
	@RequestMapping(value = "saveRegister")
	public String saveRegister(TUser tUser,Model model,RedirectAttributes redirectAttributes) {
		//保存注册信息
			systemService.saveRegister(tUser);
			return "modules/sys/userlogin";
	}
	
    
    /**
     * 跳转到产品中心页面
     * @param model
     * @return
     */
    @RequestMapping(value="productList")
	public String productList(TProduct tProduct,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "12") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Category category = categoryService.get("4bbd32c498c945b78a98e423b52f8684");
        model.addAttribute("category", category);
        Page<TProduct> page = tProductService.findPage(new Page<TProduct>(request, response, pageSize), tProduct); 
		model.addAttribute("page", page);
		model.addAttribute("tProduct", tProduct);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontproductList";
	}
    
    
    /**
	 * 跳转到前台发布产品信息页面
	 */
	@RequestMapping(value = "postmessage")
	public String postmessage(TProduct tProduct,Model model,RedirectAttributes redirectAttributes) {
		Principal principal = UserUtils.getPrincipal();
		//判断用户是否已经登录，未登录直接进入登录页面，已登录进入发布信息页面
		if(principal!=null){
			model.addAttribute("tProduct", tProduct);
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			Category category = categoryService.get("4bbd32c498c945b78a98e423b52f8684");
	        model.addAttribute("category", category);
			return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontpostProduct";
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	/**
	 * 保存用户发布的产品信息
	 */
	@RequestMapping(value = "saveproduct")
	public String saveproduct(TProduct tProduct, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		String pro_userId=principal.getLoginName();
		tProduct.setProUserid(pro_userId);
		tProductService.save(tProduct);
        return "redirect:"+Global.getFrontPath()+"/productList/?repage";
	}
	
	
	/**
	 * 跳转到发布任务页面
	 */
    @RequestMapping(value="taskList")
	public String taskList(TTask tTask,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "12") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
        Page<TTask> page = tTaskService.findPage(new Page<TTask>(request, response, pageSize),tTask); 
		model.addAttribute("page", page);
		model.addAttribute("tTask", tTask);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/fronttaskList";
	}
	
    /**
	 * 跳转到前台发布任务信息页面
	 */
	@RequestMapping(value = "postTask")
	public String postTask(TTask tTask,Model model,RedirectAttributes redirectAttributes) {
		Principal principal = UserUtils.getPrincipal();
		//判断用户是否已经登录，未登录直接进入登录页面，已登录进入发布信息页面
		if(principal!=null){
			model.addAttribute("tTask", tTask);
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontpostTask";
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	/**
	 * 保存用户发布的产品信息
	 */
	@RequestMapping(value = "saveTask")
	public String saveTask(TTask tTask, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		String pro_userId=principal.getLoginName();
		tTask.setTaskUserid(pro_userId);
		tTaskService.save(tTask);
        return "redirect:"+Global.getFrontPath()+"/taskList/?repage";
	}
	
	/**
	 * 
	 * 用户申请任务订单，需要跳转到一个申请订单的页面
	 * 里面会显示这条任务的详情，同时会有接单以及交单两个按钮
	 */
	@RequestMapping(value = "taskdetail")
	public String taskdetail(TTask tTask,Model model,RedirectAttributes redirectAttributes) {
		Principal principal = UserUtils.getPrincipal();
		//判断用户是否已经登录，未登录直接进入登录页面，已登录进入任务详情页面
		if(principal!=null){
			//这一步是会显示该任务的详情
			TTask tTask1=tTaskService.get(tTask);
			System.out.println(tTask1+"===");
			model.addAttribute("tTask", tTask1);
			Site site = CmsUtils.getSite(Site.defaultSiteId());
			model.addAttribute("site", site);
			//查看当前用户是否已经申请过了，如果已经在申请了，显示剩余多长时间，如果失败或者未申请，都可以重新进行申请
			String toPosterid=principal.getLoginName();
			String toTaskid=tTask.getId();
			//===================添加的地方========================
			TTaskOrder taskorder=new TTaskOrder();
			taskorder.setToTaskid(toTaskid);
			taskorder.setToPosterid(toPosterid);
			//查看是否申请过
			taskorder=tTaskOrderService.checkpost(taskorder);
			model.addAttribute("taskorder", taskorder);
			return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontTaskdetail";
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	/**
	 * 申请该任务，则插入数据，更改状态为申请中，同时任务数也相应的减1，前台在该申请数量为0的时候，不让用户再进行申请了
	 */
	@RequestMapping(value = "saveTaskorder")
	public String saveTaskorder(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		if(principal!=null){
			String toPosterid=principal.getLoginName();
			//同时改变任务的数量-1
			tTaskService.updateAmount(tTaskOrder.getToTaskid());
			tTaskOrder.setToPosterid(toPosterid);
			String id=IdGen.uuid();
			tTaskOrder.setId(id);
			//任务订单状态为正在申请中
			tTaskOrder.setToType("1");
			tTaskOrder.preInsert();
			tTaskOrderService.saveTaskorder(tTaskOrder);
		    return "redirect:"+Global.getFrontPath()+"/taskdetail?id="+tTaskOrder.getToTaskid();
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	
	/**
	 * 取消参与任务
	 */
	@RequestMapping(value = "cancelTaskorder")
	public String cancelTaskorder(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		if(principal!=null){
			tTaskOrderService.cancelTaskorder(tTaskOrder.getId());
			tTaskOrder=tTaskOrderService.get(tTaskOrder.getId());
			tTaskService.updateaddAmount(tTaskOrder.getToTaskid());
	        return "redirect:"+Global.getFrontPath()+"/taskdetail?id="+tTaskOrder.getToTaskid();
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	
	
	/**
	 * 交单格式，手机号，姓名，身份证号,id
	 * 
	 */
	@RequestMapping(value = "handTaskorder")
	public String updTaskorder(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		Principal principal = UserUtils.getPrincipal();
		if(principal!=null){
			tTaskOrderService.handTaskorder(tTaskOrder);
			tTaskOrder=tTaskOrderService.get(tTaskOrder.getId());
	        return "redirect:"+Global.getFrontPath()+"/taskdetail?id="+tTaskOrder.getToTaskid();
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	/**
	 * 超时执行的操作
	 */
	@RequestMapping(value = "outtime")
	public String outtime(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		Principal principal = UserUtils.getPrincipal();
		if(principal!=null){
			tTaskOrder=tTaskOrderService.get(tTaskOrder.getId());
	        return "redirect:"+Global.getFrontPath()+"/taskdetail?id="+tTaskOrder.getToTaskid();
		}else{
			return "modules/sys/userlogin";
		}
	}
	
	/**
	 * 我的中心
	 */
	@RequestMapping(value="mycenter")
	public String taskList(Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMycenter";
	}
	
	
	/**
	 * 用户获取自己下面的发布的产品列表
	 */
	@RequestMapping(value = "MyproductList")
	public String MyproductList(TProduct tProduct,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "5") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Principal principal = UserUtils.getPrincipal();
		String proUserid=principal.getLoginName();
		tProduct.setProUserid(proUserid);
        Page<TProduct> page = tProductService.findPage(new Page<TProduct>(request, response, pageSize), tProduct); 
		model.addAttribute("page", page);
		model.addAttribute("tProduct", tProduct);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMyproductList";
	}
	
	
	/**
	 * 用户获取自己下面发布的任务列表
	 */
	@RequestMapping(value="MytaskList")
	public String MytaskList(TTask tTask,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "5") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Principal principal = UserUtils.getPrincipal();
		String taskUserid=principal.getLoginName();
		tTask.setTaskUserid(taskUserid);
        Page<TTask> page = tTaskService.findPage(new Page<TTask>(request, response, pageSize),tTask); 
		model.addAttribute("page", page);
		model.addAttribute("tTask", tTask);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMytaskList";
	}
	
	/**
	 * 用户获取自己下面发布的任务被别人申请的列表(审核中，审核成功，审核失败，未打款，已打款)
	 */
	@RequestMapping(value="MytaskBypostedList")
	public String MytaskBypostedList(TTaskOrder tTaskOrder,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "5") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Principal principal = UserUtils.getPrincipal();
		String taskUserid=principal.getLoginName();
		tTaskOrder.setToReserve1(taskUserid);
        Page<TTaskOrder> page = tTaskOrderService.findPageByposted(new Page<TTaskOrder>(request, response, pageSize),tTaskOrder); 
		model.addAttribute("page", page);
		model.addAttribute("tTaskOrder", tTaskOrder);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMytaskBypostedList";
	}
	
	
	/**
	 * 用户获取自己下面申请的任务列表
	 */
	@RequestMapping(value="MytaskorderList")
	public String MytaskList(TTaskOrder tTaskOrder,HttpServletRequest request,HttpServletResponse response,
			@RequestParam(required = false,defaultValue = "1") Integer pageNo, 
            @RequestParam(required = false, defaultValue = "5") Integer pageSize,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Principal principal = UserUtils.getPrincipal();
		String toPosterid=principal.getLoginName();
		tTaskOrder.setToPosterid(toPosterid);
        Page<TTaskOrder> page = tTaskOrderService.findPageByPosterid(new Page<TTaskOrder>(request, response, pageSize),tTaskOrder); 
		model.addAttribute("page", page);
		model.addAttribute("tTaskOrder", tTaskOrder);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMytaskorderList";
	}
	
	/**
	 * 获取担保平台list
	 */
	@RequestMapping(value="dbplatformList")
	public String MytaskList(TDbPlatform tDbPlatform,HttpServletRequest request,HttpServletResponse response,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		//此处获取担保平台的倒序10条数据
        List<TDbPlatform> list = tDbPlatformService.findPageLimit(tDbPlatform); 
        model.addAttribute("list", list);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontdbplatformList";
	}
	
	/**
	 * 担保申请提交
	 */
	@RequestMapping(value="dbsubmit")
	public String dbsubmit(TDbPlatform tDbPlatform,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		//保存提交的内容
		tDbPlatformService.save(tDbPlatform);
		return "redirect:"+Global.getFrontPath()+"/dbplatformList";
	}
	
	/**
	 * 查看产品信息的详情
	 */
	@RequestMapping(value="getproductdetail")
	public String getproductdetail(TProduct tProduct,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		//保存提交的内容
		tProduct=tProductService.get(tProduct);
		model.addAttribute("tProduct", tProduct);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontProductdetailByself";
	}
	
	/**
	 * 修改用户发布的产品信息
	 */
	@RequestMapping(value = "updateProduct")
	public String updateProduct(TProduct tProduct, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		String pro_userId=principal.getLoginName();
		tProduct.setProUserid(pro_userId);
		tProductService.save(tProduct);
        return "redirect:"+Global.getFrontPath()+"/MyproductList/?repage";
	}
	
	/**
	 * 查看任务信息的详情
	 */
	@RequestMapping(value="gettaskdetail")
	public String gettaskdetail(TTask tTask,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		//保存提交的内容
		tTask=tTaskService.get(tTask);
		model.addAttribute("tTask", tTask);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontTaskdetailByself";
	}
	
	/**
	 * 修改用户发布的任务信息
	 */
	@RequestMapping(value = "updateTask")
	public String updateTask(TTask tTask, Model model, RedirectAttributes redirectAttributes) {
		//获取当前发布用户
		Principal principal = UserUtils.getPrincipal();
		String pro_userId=principal.getLoginName();
		tTask.setTaskUserid(pro_userId);
		tTaskService.save(tTask);
        return "redirect:"+Global.getFrontPath()+"/MytaskList/?repage";
	}
	
	/**
	 * 通过或失败别人的申请
	 */
	@RequestMapping(value = "checktaskorder")
	public String checktaskorder(TTaskOrder tTaskOrder, Model model, RedirectAttributes redirectAttributes) {
		tTaskOrderService.checktaskorder(tTaskOrder);
        return "redirect:"+Global.getFrontPath()+"/MytaskBypostedList/?repage";
	}
	
	/**
	 * 我的个人资料
	 */
	@RequestMapping(value="Mydatasource")
	public String mydatasource(TUser tUser,Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		Principal principal = UserUtils.getPrincipal();
		String id=principal.getId();
		tUser=tUserService.get(id);
		model.addAttribute("tUser", tUser);
		model.addAttribute("site", site);
		return "modules/cms/front/themes/"+site.getTheme()+"/mt/frontMydatasource";
	}
	
}

