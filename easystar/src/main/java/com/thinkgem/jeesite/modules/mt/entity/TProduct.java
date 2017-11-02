/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 产品表Entity
 * @author dongge
 * @version 2017-11-01
 */
public class TProduct extends DataEntity<TProduct> {
	
	private static final long serialVersionUID = 1L;
	private String proUserid;		// 发布者id
	private String proName;		// 产品名称
	private String proPrice;		// 产品价格
	private String proUrl;		// 产品图片地址
	private String proUrlInfo;		// pro_url_info
	private String proType;		// 产品类型：
	private String proJstype;		// 结算方式：1.日结，2.周结，3.月结，4.季度结
	private String proRztype;		// 资料认证方式：1.企业认证2.网站认证3.个人认证
	private Date createtime;		// createdate
	private String proRemarks;		// pro_remarks
	private String proReserve1;		// 扩展字段1
	private String proReserve2;		// 扩展字段2
	private String proReserve3;		// 扩展字段3
	private String proReserve4;		// 扩展字段4
	private String proReserve5;		// 扩展字段5
	
	public TProduct() {
		super();
	}

	public TProduct(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发布者id长度必须介于 1 和 64 之间")
	public String getProUserid() {
		return proUserid;
	}

	public void setProUserid(String proUserid) {
		this.proUserid = proUserid;
	}
	
	@Length(min=1, max=255, message="产品名称长度必须介于 1 和 255 之间")
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}
	
	@Length(min=1, max=64, message="产品价格长度必须介于 1 和 64 之间")
	public String getProPrice() {
		return proPrice;
	}

	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}
	
	@Length(min=1, max=255, message="产品图片地址长度必须介于 1 和 255 之间")
	public String getProUrl() {
		return proUrl;
	}

	public void setProUrl(String proUrl) {
		this.proUrl = proUrl;
	}
	
	@Length(min=0, max=255, message="pro_url_info长度必须介于 0 和 255 之间")
	public String getProUrlInfo() {
		return proUrlInfo;
	}

	public void setProUrlInfo(String proUrlInfo) {
		this.proUrlInfo = proUrlInfo;
	}
	
	@Length(min=0, max=1, message="产品类型长度必须介于 0 和 1 之间")
	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}
	@Length(min=0, max=1, message="结算类型长度必须介于 0 和 1 之间")
	public String getProJstype() {
		return proJstype;
	}

	public void setProJstype(String proJstype) {
		this.proJstype = proJstype;
	}
	
	@Length(min=0, max=1, message="认证类型长度必须介于 0 和 1 之间")
	public String getProRztype() {
		return proRztype;
	}

	public void setProRztype(String proRztype) {
		this.proRztype = proRztype;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="pro_remarks长度必须介于 0 和 255 之间")
	public String getProRemarks() {
		return proRemarks;
	}

	public void setProRemarks(String proRemarks) {
		this.proRemarks = proRemarks;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getProReserve1() {
		return proReserve1;
	}

	public void setProReserve1(String proReserve1) {
		this.proReserve1 = proReserve1;
	}
	
	@Length(min=0, max=200, message="扩展字段2长度必须介于 0 和 200 之间")
	public String getProReserve2() {
		return proReserve2;
	}

	public void setProReserve2(String proReserve2) {
		this.proReserve2 = proReserve2;
	}
	
	@Length(min=0, max=200, message="扩展字段3长度必须介于 0 和 200 之间")
	public String getProReserve3() {
		return proReserve3;
	}

	public void setProReserve3(String proReserve3) {
		this.proReserve3 = proReserve3;
	}
	
	@Length(min=0, max=200, message="扩展字段4长度必须介于 0 和 200 之间")
	public String getProReserve4() {
		return proReserve4;
	}

	public void setProReserve4(String proReserve4) {
		this.proReserve4 = proReserve4;
	}
	
	@Length(min=0, max=200, message="扩展字段5长度必须介于 0 和 200 之间")
	public String getProReserve5() {
		return proReserve5;
	}

	public void setProReserve5(String proReserve5) {
		this.proReserve5 = proReserve5;
	}
	
}