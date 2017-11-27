/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 兼职申请表Entity
 * @author dongge
 * @version 2017-11-27
 */
public class TJobApply extends DataEntity<TJobApply> {
	
	private static final long serialVersionUID = 1L;
	private String tjaJobid;		// 发布兼职的用户id
	private String tjaUserid;		// 申请兼职的用户id
	private String tjaStatus;		// 申请的状态：1.审核中2.成功3.失败
	private Date createtime;		// 申请时间
	
	public TJobApply() {
		super();
	}

	public TJobApply(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发布兼职的用户id长度必须介于 1 和 64 之间")
	public String getTjaJobid() {
		return tjaJobid;
	}

	public void setTjaJobid(String tjaJobid) {
		this.tjaJobid = tjaJobid;
	}
	
	@Length(min=1, max=64, message="申请兼职的用户id长度必须介于 1 和 64 之间")
	public String getTjaUserid() {
		return tjaUserid;
	}

	public void setTjaUserid(String tjaUserid) {
		this.tjaUserid = tjaUserid;
	}
	
	public String getTjaStatus() {
		return tjaStatus;
	}

	public void setTjaStatus(String tjaStatus) {
		this.tjaStatus = tjaStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}