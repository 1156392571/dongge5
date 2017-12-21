/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 手机任务表Entity
 * @author donggge
 * @version 2017-12-21
 */
public class TMobileTask extends DataEntity<TMobileTask> {
	
	private static final long serialVersionUID = 1L;
	private String tmtUserid;		// 发布任务者id
	private String tmtName;		// 任务名称
	private String tmtPrice;		// 任务价格
	private String tmtAsk;		// 任务要求
	private String tmtRebatea;		// A级返佣
	private String tmtRebateb;		// B级返佣
	private String tmtRebatec;		// C级返佣
	private String tmtPhotourl;		// 二维码图片url
	private String tmtPhotoinfo;		// 二维码图片info
	private Date tmtStartdate;		// 任务开始时间
	private Date tmtEnddate;		// 任务结束时间
	private String tmtViewtime;		// 浏览次数
	private Date createtime;		// 创建时间
	private String tmtRemarks;		// 备注信息
	private String tmtReserve1;		// 扩展字段1
	private String tmtReserve2;		// 扩展字段2
	
	public TMobileTask() {
		super();
	}

	public TMobileTask(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发布任务者id长度必须介于 1 和 64 之间")
	public String getTmtUserid() {
		return tmtUserid;
	}

	public void setTmtUserid(String tmtUserid) {
		this.tmtUserid = tmtUserid;
	}
	
	@Length(min=1, max=255, message="任务名称长度必须介于 1 和 255 之间")
	public String getTmtName() {
		return tmtName;
	}

	public void setTmtName(String tmtName) {
		this.tmtName = tmtName;
	}
	
	public String getTmtPrice() {
		return tmtPrice;
	}

	public void setTmtPrice(String tmtPrice) {
		this.tmtPrice = tmtPrice;
	}
	
	@Length(min=1, max=255, message="任务要求长度必须介于 1 和 255 之间")
	public String getTmtAsk() {
		return tmtAsk;
	}

	public void setTmtAsk(String tmtAsk) {
		this.tmtAsk = tmtAsk;
	}
	
	public String getTmtRebatea() {
		return tmtRebatea;
	}

	public void setTmtRebatea(String tmtRebatea) {
		this.tmtRebatea = tmtRebatea;
	}
	
	public String getTmtRebateb() {
		return tmtRebateb;
	}

	public void setTmtRebateb(String tmtRebateb) {
		this.tmtRebateb = tmtRebateb;
	}
	
	public String getTmtRebatec() {
		return tmtRebatec;
	}

	public void setTmtRebatec(String tmtRebatec) {
		this.tmtRebatec = tmtRebatec;
	}
	
	@Length(min=1, max=255, message="二维码图片url长度必须介于 1 和 255 之间")
	public String getTmtPhotourl() {
		return tmtPhotourl;
	}

	public void setTmtPhotourl(String tmtPhotourl) {
		this.tmtPhotourl = tmtPhotourl;
	}
	
	@Length(min=1, max=255, message="二维码图片info长度必须介于 1 和 255 之间")
	public String getTmtPhotoinfo() {
		return tmtPhotoinfo;
	}

	public void setTmtPhotoinfo(String tmtPhotoinfo) {
		this.tmtPhotoinfo = tmtPhotoinfo;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="任务开始时间不能为空")
	public Date getTmtStartdate() {
		return tmtStartdate;
	}

	public void setTmtStartdate(Date tmtStartdate) {
		this.tmtStartdate = tmtStartdate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="任务结束时间不能为空")
	public Date getTmtEnddate() {
		return tmtEnddate;
	}

	public void setTmtEnddate(Date tmtEnddate) {
		this.tmtEnddate = tmtEnddate;
	}
	
	@Length(min=1, max=11, message="浏览次数长度必须介于 1 和 11 之间")
	public String getTmtViewtime() {
		return tmtViewtime;
	}

	public void setTmtViewtime(String tmtViewtime) {
		this.tmtViewtime = tmtViewtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间不能为空")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getTmtRemarks() {
		return tmtRemarks;
	}

	public void setTmtRemarks(String tmtRemarks) {
		this.tmtRemarks = tmtRemarks;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getTmtReserve1() {
		return tmtReserve1;
	}

	public void setTmtReserve1(String tmtReserve1) {
		this.tmtReserve1 = tmtReserve1;
	}
	
	@Length(min=0, max=200, message="扩展字段2长度必须介于 0 和 200 之间")
	public String getTmtReserve2() {
		return tmtReserve2;
	}

	public void setTmtReserve2(String tmtReserve2) {
		this.tmtReserve2 = tmtReserve2;
	}
	
}