/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 账户明细表Entity
 * @author dongge
 * @version 2017-11-23
 */
public class TAcountDtl extends DataEntity<TAcountDtl> {
	
	private static final long serialVersionUID = 1L;
	private String tadId;		// 编号
	private String tadUserid;		// t_user表的loginname
	private String tadType;		// 账户金额是收入还是支出
	private String tadSourcetype;		// 金额来源类型:0无,1.产品交易,2.做任务3.发布任务
	private String tadSourceid;		// 来源类型对应的id
	private Double tadMoney;		// 金额大小
	private Date createtime;		// 账户创建时间
	private String reserve1;		// 扩展字段1
	private String reserve2;		// 扩展字段1
	private String reserve3;		// 扩展字段1
	private String reserve4;		// 扩展字段1
	private String reserve5;		// 扩展字段1
	
	public TAcountDtl() {
		super();
	}

	public TAcountDtl(String id){
		super(id);
	}

	@Length(min=1, max=64, message="编号长度必须介于 1 和 64 之间")
	public String getTadId() {
		return tadId;
	}

	public void setTadId(String tadId) {
		this.tadId = tadId;
	}
	
	@Length(min=1, max=64, message="t_user表的loginname长度必须介于 1 和 64 之间")
	public String getTadUserid() {
		return tadUserid;
	}

	public void setTadUserid(String tadUserid) {
		this.tadUserid = tadUserid;
	}
	
	@Length(min=1, max=1, message="账户金额是收入还是支出长度必须介于 1 和 1 之间")
	public String getTadType() {
		return tadType;
	}

	public void setTadType(String tadType) {
		this.tadType = tadType;
	}
	
	@Length(min=1, max=1, message="账户金额来源是支出长度必须介于 1 和 1 之间")
	public String getTadSourcetype() {
		return tadSourcetype;
	}

	public void setTadSourcetype(String tadSourcetype) {
		this.tadSourcetype = tadSourcetype;
	}
	
	@Length(min=0, max=64, message="来源类型对应的id长度必须介于 0 和 64 之间")
	public String getTadSourceid() {
		return tadSourceid;
	}

	public void setTadSourceid(String tadSourceid) {
		this.tadSourceid = tadSourceid;
	}
	
	public Double getTadMoney() {
		return tadMoney;
	}

	public void setTadMoney(Double tadMoney) {
		this.tadMoney = tadMoney;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getReserve1() {
		return reserve1;
	}

	public void setReserve1(String reserve1) {
		this.reserve1 = reserve1;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getReserve2() {
		return reserve2;
	}

	public void setReserve2(String reserve2) {
		this.reserve2 = reserve2;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getReserve3() {
		return reserve3;
	}

	public void setReserve3(String reserve3) {
		this.reserve3 = reserve3;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getReserve4() {
		return reserve4;
	}

	public void setReserve4(String reserve4) {
		this.reserve4 = reserve4;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getReserve5() {
		return reserve5;
	}

	public void setReserve5(String reserve5) {
		this.reserve5 = reserve5;
	}
	
}