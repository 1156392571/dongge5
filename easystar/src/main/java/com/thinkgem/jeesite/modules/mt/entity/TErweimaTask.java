/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 扫码任务Entity
 * @author dongge
 * @version 2017-12-15
 */
public class TErweimaTask extends DataEntity<TErweimaTask> {
	
	private static final long serialVersionUID = 1L;
	private String tetUserid;		// 对应的用户id
	private String tetTasktype;		// 任务类型
	private BigDecimal tetTaskprice;		// 任务价格
	private String tetTaskstatus;		// 任务状态：1.待审核2.审核成功3.审核失败
	private Date createtime;		// 创建时间
	private String tetReserve1;		// 扩展字段5
	
	public TErweimaTask() {
		super();
	}

	public TErweimaTask(String id){
		super(id);
	}

	@Length(min=1, max=64, message="对应的用户id长度必须介于 1 和 64 之间")
	public String getTetUserid() {
		return tetUserid;
	}

	public void setTetUserid(String tetUserid) {
		this.tetUserid = tetUserid;
	}
	
	@Length(min=1, max=1, message="任务类型长度必须介于 1 和 1 之间")
	public String getTetTasktype() {
		return tetTasktype;
	}

	public void setTetTasktype(String tetTasktype) {
		this.tetTasktype = tetTasktype;
	}
	
	public BigDecimal getTetTaskprice() {
		return tetTaskprice;
	}

	public void setTetTaskprice(BigDecimal tetTaskprice) {
		this.tetTaskprice = tetTaskprice;
	}

	@Length(min=1, max=1, message="审核状态长度必须介于 1 和 1 之间")
	public String getTetTaskstatus() {
		return tetTaskstatus;
	}

	public void setTetTaskstatus(String tetTaskstatus) {
		this.tetTaskstatus = tetTaskstatus;
	}
	
	
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Length(min=0, max=200, message="扩展字段5长度必须介于 0 和 200 之间")
	public String getTetReserve1() {
		return tetReserve1;
	}

	public void setTetReserve1(String tetReserve1) {
		this.tetReserve1 = tetReserve1;
	}
	
}