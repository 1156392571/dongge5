/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 兼职表Entity
 * @author dongge
 * @version 2017-11-27
 */
public class TParttimejob extends DataEntity<TParttimejob> {
	
	private static final long serialVersionUID = 1L;
	private String ptjUserid;		// 发布兼职的用户id
	private String ptjName;		// 兼职名称
	private String ptjType;		// 兼职类型：1.技工2.艺术老师3.导游4.创意策划5.会计6.翻译7.律师/法务
	private String ptjPrice;		// 兼职价格：如100元/天
	private Integer ptjNumber;		// 招聘人数
	private String ptjJstype;		// 结算方式
	private String ptjYxqx;		// 有效时限
	private String ptjWorkarea;		// 工作区域
	private String ptjAddress;		// 工作地址
	private String ptjWorktime;		// 工作时间描述
	private String ptjJobask;		// 职位要求
	private String ptjJobcontent;		// 职位内容
	private String ptjJobinfo;		// 职位描述
	private String ptjCompanytype;		// 公司类型
	private String ptjCompanyinfo;		// 公司介绍
	private String ptjPhone;		// 联系方式：电话
	private String ptjQq;		// 联系方式：QQ
	private Date createtime;		// 创建时间
	private String ptjRemarks;		// 备注信息
	private String ptjReserve1;		// 扩展字段1
	private String ptjReserve2;		// 扩展字段2
	private String ptjReserve3;		// 扩展字段3
	private String ptjReserve4;		// 扩展字段4
	private String ptjReserve5;		// 扩展字段5
	
	public TParttimejob() {
		super();
	}

	public TParttimejob(String id){
		super(id);
	}

	@Length(min=1, max=64, message="发布兼职的用户id长度必须介于 1 和 64 之间")
	public String getPtjUserid() {
		return ptjUserid;
	}

	public void setPtjUserid(String ptjUserid) {
		this.ptjUserid = ptjUserid;
	}
	
	@Length(min=1, max=255, message="兼职名称长度必须介于 1 和 255 之间")
	public String getPtjName() {
		return ptjName;
	}

	public void setPtjName(String ptjName) {
		this.ptjName = ptjName;
	}
	
	@Length(min=1, max=64, message="兼职价格：如100元/天长度必须介于 1 和 64 之间")
	public String getPtjPrice() {
		return ptjPrice;
	}

	public void setPtjPrice(String ptjPrice) {
		this.ptjPrice = ptjPrice;
	}
	
	@NotNull(message="招聘人数不能为空")
	public Integer getPtjNumber() {
		return ptjNumber;
	}

	public void setPtjNumber(Integer ptjNumber) {
		this.ptjNumber = ptjNumber;
	}
	
	@Length(min=1, max=1, message="结算方式长度必须介于 1 和 1 之间")
	public String getPtjJstype() {
		return ptjJstype;
	}

	public void setPtjJstype(String ptjJstype) {
		this.ptjJstype = ptjJstype;
	}
	
	@Length(min=1, max=255, message="有效时限长度必须介于 1 和 255 之间")
	public String getPtjYxqx() {
		return ptjYxqx;
	}

	public void setPtjYxqx(String ptjYxqx) {
		this.ptjYxqx = ptjYxqx;
	}
	
	@Length(min=1, max=255, message="工作区域长度必须介于 1 和 255 之间")
	public String getPtjWorkarea() {
		return ptjWorkarea;
	}

	public void setPtjWorkarea(String ptjWorkarea) {
		this.ptjWorkarea = ptjWorkarea;
	}
	
	@Length(min=1, max=255, message="工作地址长度必须介于 1 和 255 之间")
	public String getPtjAddress() {
		return ptjAddress;
	}

	public void setPtjAddress(String ptjAddress) {
		this.ptjAddress = ptjAddress;
	}
	
	@Length(min=1, max=255, message="工作时间描述长度必须介于 1 和 255 之间")
	public String getPtjWorktime() {
		return ptjWorktime;
	}

	public void setPtjWorktime(String ptjWorktime) {
		this.ptjWorktime = ptjWorktime;
	}
	
	@Length(min=0, max=1000, message="职位要求长度必须介于 0 和 1000 之间")
	public String getPtjJobask() {
		return ptjJobask;
	}

	public void setPtjJobask(String ptjJobask) {
		this.ptjJobask = ptjJobask;
	}
	
	@Length(min=0, max=500, message="职位内容长度必须介于 0 和 500 之间")
	public String getPtjJobcontent() {
		return ptjJobcontent;
	}

	public void setPtjJobcontent(String ptjJobcontent) {
		this.ptjJobcontent = ptjJobcontent;
	}
	
	@Length(min=0, max=1000, message="职位描述长度必须介于 0 和 1000 之间")
	public String getPtjJobinfo() {
		return ptjJobinfo;
	}

	public void setPtjJobinfo(String ptjJobinfo) {
		this.ptjJobinfo = ptjJobinfo;
	}
	
	@Length(min=0, max=1000, message="公司介绍长度必须介于 0 和 1000 之间")
	public String getPtjCompanyinfo() {
		return ptjCompanyinfo;
	}

	public void setPtjCompanyinfo(String ptjCompanyinfo) {
		this.ptjCompanyinfo = ptjCompanyinfo;
	}
	
	@Length(min=1, max=255, message="联系方式：电话长度必须介于 1 和 255 之间")
	public String getPtjPhone() {
		return ptjPhone;
	}

	public void setPtjPhone(String ptjPhone) {
		this.ptjPhone = ptjPhone;
	}
	
	@Length(min=1, max=255, message="联系方式：QQ长度必须介于 1 和 255 之间")
	public String getPtjQq() {
		return ptjQq;
	}

	public void setPtjQq(String ptjQq) {
		this.ptjQq = ptjQq;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getPtjRemarks() {
		return ptjRemarks;
	}

	public void setPtjRemarks(String ptjRemarks) {
		this.ptjRemarks = ptjRemarks;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getPtjReserve1() {
		return ptjReserve1;
	}

	public void setPtjReserve1(String ptjReserve1) {
		this.ptjReserve1 = ptjReserve1;
	}
	
	@Length(min=0, max=200, message="扩展字段2长度必须介于 0 和 200 之间")
	public String getPtjReserve2() {
		return ptjReserve2;
	}

	public void setPtjReserve2(String ptjReserve2) {
		this.ptjReserve2 = ptjReserve2;
	}
	
	@Length(min=0, max=200, message="扩展字段3长度必须介于 0 和 200 之间")
	public String getPtjReserve3() {
		return ptjReserve3;
	}

	public void setPtjReserve3(String ptjReserve3) {
		this.ptjReserve3 = ptjReserve3;
	}
	
	@Length(min=0, max=200, message="扩展字段4长度必须介于 0 和 200 之间")
	public String getPtjReserve4() {
		return ptjReserve4;
	}

	public void setPtjReserve4(String ptjReserve4) {
		this.ptjReserve4 = ptjReserve4;
	}
	
	@Length(min=0, max=200, message="扩展字段5长度必须介于 0 和 200 之间")
	public String getPtjReserve5() {
		return ptjReserve5;
	}

	public void setPtjReserve5(String ptjReserve5) {
		this.ptjReserve5 = ptjReserve5;
	}

	public String getPtjType() {
		return ptjType;
	}

	public void setPtjType(String ptjType) {
		this.ptjType = ptjType;
	}

	public String getPtjCompanytype() {
		return ptjCompanytype;
	}

	public void setPtjCompanytype(String ptjCompanytype) {
		this.ptjCompanytype = ptjCompanytype;
	}
	
}