/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发布任务Entity
 * @author dongge
 * @version 2017-11-09
 */
public class TTask extends DataEntity<TTask> {
	
	private static final long serialVersionUID = 1L;
	private String taskUserid;		// 发布任务者id
	private String taskName;		// 任务名称
	private String taskPrice;		// 任务价格
	private String taskAmount;		// 发布任务数量
	private String taskYxsj;		// 有效时间
	private String taskAsk;		// 做单要求
	private String taskSkill;		// 做单技巧
	private String taskPhone;		// 任务联系电话
	private String taskQq;		// 任务联系QQ
	private String taskType;		// 任务类型
	private String taskRztype;		// 任务认证方式：1.企业认证2.网站认证3.个人认证
	private Date createtime;		// 创建时间
	private String taskRemarks;		// 备注信息
	private String taskReserve1;		// 扩展字段1
	private String taskReserve2;		// 扩展字段2
	private String taskReserve3;		// 扩展字段3
	private String taskReserve4;		// 扩展字段4
	private String taskReserve5;		// 扩展字段5
	
	public TTask() {
		super();
	}

	public TTask(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发布任务者id长度必须介于 1 和 64 之间")
	public String getTaskUserid() {
		return taskUserid;
	}

	public void setTaskUserid(String taskUserid) {
		this.taskUserid = taskUserid;
	}
	
	@Length(min=1, max=255, message="任务名称长度必须介于 1 和 255 之间")
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	@Length(min=1, max=64, message="任务价格长度必须介于 1 和 64 之间")
	public String getTaskPrice() {
		return taskPrice;
	}

	public void setTaskPrice(String taskPrice) {
		this.taskPrice = taskPrice;
	}
	
	@Length(min=1, max=64, message="发布任务数量长度必须介于 1 和 64 之间")
	public String getTaskAmount() {
		return taskAmount;
	}

	public void setTaskAmount(String taskAmount) {
		this.taskAmount = taskAmount;
	}
	
	@Length(min=1, max=10, message="有效时间长度必须介于 1 和 10 之间")
	public String getTaskYxsj() {
		return taskYxsj;
	}

	public void setTaskYxsj(String taskYxsj) {
		this.taskYxsj = taskYxsj;
	}
	
	@Length(min=1, max=255, message="做单要求长度必须介于 1 和 255 之间")
	public String getTaskAsk() {
		return taskAsk;
	}

	public void setTaskAsk(String taskAsk) {
		this.taskAsk = taskAsk;
	}
	
	@Length(min=1, max=255, message="做单技巧长度必须介于 1 和 255 之间")
	public String getTaskSkill() {
		return taskSkill;
	}

	public void setTaskSkill(String taskSkill) {
		this.taskSkill = taskSkill;
	}
	
	@Length(min=1, max=255, message="任务联系电话长度必须介于 1 和 255 之间")
	public String getTaskPhone() {
		return taskPhone;
	}

	public void setTaskPhone(String taskPhone) {
		this.taskPhone = taskPhone;
	}
	
	@Length(min=1, max=255, message="任务联系QQ长度必须介于 1 和 255 之间")
	public String getTaskQq() {
		return taskQq;
	}

	public void setTaskQq(String taskQq) {
		this.taskQq = taskQq;
	}
	
	@Length(min=0, max=1, message="任务类型长度必须介于 0 和 1 之间")
	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
	
	@Length(min=0, max=1, message="任务认证类型长度必须介于 0 和 1 之间")
	public String getTaskRztype() {
		return taskRztype;
	}

	public void setTaskRztype(String taskRztype) {
		this.taskRztype = taskRztype;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getTaskRemarks() {
		return taskRemarks;
	}

	public void setTaskRemarks(String taskRemarks) {
		this.taskRemarks = taskRemarks;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getTaskReserve1() {
		return taskReserve1;
	}

	public void setTaskReserve1(String taskReserve1) {
		this.taskReserve1 = taskReserve1;
	}
	
	@Length(min=0, max=200, message="扩展字段2长度必须介于 0 和 200 之间")
	public String getTaskReserve2() {
		return taskReserve2;
	}

	public void setTaskReserve2(String taskReserve2) {
		this.taskReserve2 = taskReserve2;
	}
	
	@Length(min=0, max=200, message="扩展字段3长度必须介于 0 和 200 之间")
	public String getTaskReserve3() {
		return taskReserve3;
	}

	public void setTaskReserve3(String taskReserve3) {
		this.taskReserve3 = taskReserve3;
	}
	
	@Length(min=0, max=200, message="扩展字段4长度必须介于 0 和 200 之间")
	public String getTaskReserve4() {
		return taskReserve4;
	}

	public void setTaskReserve4(String taskReserve4) {
		this.taskReserve4 = taskReserve4;
	}
	
	@Length(min=0, max=200, message="扩展字段5长度必须介于 0 和 200 之间")
	public String getTaskReserve5() {
		return taskReserve5;
	}

	public void setTaskReserve5(String taskReserve5) {
		this.taskReserve5 = taskReserve5;
	}
	
}