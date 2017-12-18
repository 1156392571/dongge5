/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 提现记录表Entity
 * @author dongge
 * @version 2017-12-17
 */
public class TTixian extends DataEntity<TTixian> {
	
	private static final long serialVersionUID = 1L;
	private String ttUserid;		// 对应的用户id
	private BigDecimal ttGetcashcount;		// 提现金额
	private String ttGetcashstatus;		// 提现状态：1.待打款2.已打款
	private String ttAlipay;		// 支付宝账号
	private Date createtime;		// 创建时间
	private String ttReserve1;		// 扩展字段1
	
	public TTixian() {
		super();
	}

	public TTixian(String id){
		super(id);
	}

	@Length(min=1, max=64, message="对应的用户id长度必须介于 1 和 64 之间")
	public String getTtUserid() {
		return ttUserid;
	}

	public void setTtUserid(String ttUserid) {
		this.ttUserid = ttUserid;
	}
	
	public BigDecimal getTtGetcashcount()
    {
        return ttGetcashcount;
    }

    public void setTtGetcashcount(BigDecimal ttGetcashcount)
    {
        this.ttGetcashcount = ttGetcashcount;
    }

    public String getTtGetcashstatus() {
		return ttGetcashstatus;
	}

	public void setTtGetcashstatus(String ttGetcashstatus) {
		this.ttGetcashstatus = ttGetcashstatus;
	}
	
	
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getTtReserve1() {
		return ttReserve1;
	}

	public void setTtReserve1(String ttReserve1) {
		this.ttReserve1 = ttReserve1;
	}

	public String getTtAlipay() {
		return ttAlipay;
	}

	public void setTtAlipay(String ttAlipay) {
		this.ttAlipay = ttAlipay;
	}
	
}