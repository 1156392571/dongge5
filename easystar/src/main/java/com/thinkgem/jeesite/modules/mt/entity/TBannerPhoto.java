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
 * 页面广告Entity
 * @author dongge
 * @version 2017-11-13
 */
public class TBannerPhoto extends DataEntity<TBannerPhoto> {
	
	private static final long serialVersionUID = 1L;
	private String bpName;		// 横幅标题名称
	private String bpUrl;		// 图片地址
	private String bpUrlinfo;		// 图片地址info
	private String bpType;		// 图片类型：1.头部2.两侧
	private String bpStatus;		// 图片状态：1.未使用2.使用中
	private Date createtime;		// 图片创建时间
	private String bpRemarks;		// 备注信息
	private String bpReserve1;		// 扩展字段1
	private String bpReserve2;		// 扩展字段2
	private String bpReserve3;		// 扩展字段3
	private String bpReserve4;		// 扩展字段4
	private String bpReserve5;		// 扩展字段5
	
	public TBannerPhoto() {
		super();
	}

	public TBannerPhoto(String id){
		super(id);
	}

	@Length(min=1, max=255, message="横幅标题名称长度必须介于 1 和 255 之间")
	public String getBpName() {
		return bpName;
	}

	public void setBpName(String bpName) {
		this.bpName = bpName;
	}
	
	@Length(min=1, max=255, message="图片地址长度必须介于 1 和 255 之间")
	public String getBpUrl() {
		return bpUrl;
	}

	public void setBpUrl(String bpUrl) {
		this.bpUrl = bpUrl;
	}
	
	@Length(min=1, max=255, message="图片地址info长度必须介于 1 和 255 之间")
	public String getBpUrlinfo() {
		return bpUrlinfo;
	}

	public void setBpUrlinfo(String bpUrlinfo) {
		this.bpUrlinfo = bpUrlinfo;
	}
	
	@Length(min=1, max=255, message="图片类型长度必须介于 0 和 1 之间")
	public String getBpType() {
		return bpType;
	}

	public void setBpType(String bpType) {
		this.bpType = bpType;
	}
	
	@Length(min=1, max=255, message="图片是否被引用长度必须介于 0 和 1 之间")
	public String getBpStatus() {
		return bpStatus;
	}

	public void setBpStatus(String bpStatus) {
		this.bpStatus = bpStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="图片创建时间不能为空")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getBpRemarks() {
		return bpRemarks;
	}

	public void setBpRemarks(String bpRemarks) {
		this.bpRemarks = bpRemarks;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getBpReserve1() {
		return bpReserve1;
	}

	public void setBpReserve1(String bpReserve1) {
		this.bpReserve1 = bpReserve1;
	}
	
	@Length(min=0, max=255, message="扩展字段2长度必须介于 0 和 255 之间")
	public String getBpReserve2() {
		return bpReserve2;
	}

	public void setBpReserve2(String bpReserve2) {
		this.bpReserve2 = bpReserve2;
	}
	
	@Length(min=0, max=255, message="扩展字段3长度必须介于 0 和 255 之间")
	public String getBpReserve3() {
		return bpReserve3;
	}

	public void setBpReserve3(String bpReserve3) {
		this.bpReserve3 = bpReserve3;
	}
	
	@Length(min=0, max=255, message="扩展字段4长度必须介于 0 和 255 之间")
	public String getBpReserve4() {
		return bpReserve4;
	}

	public void setBpReserve4(String bpReserve4) {
		this.bpReserve4 = bpReserve4;
	}
	
	@Length(min=0, max=255, message="扩展字段5长度必须介于 0 和 255 之间")
	public String getBpReserve5() {
		return bpReserve5;
	}

	public void setBpReserve5(String bpReserve5) {
		this.bpReserve5 = bpReserve5;
	}
	
}