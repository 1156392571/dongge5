/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户信息附加表Entity
 * @author dongge
 * @version 2017-11-02
 */
public class TUser extends DataEntity<TUser> {
	
	private static final long serialVersionUID = 1L;
	private String tUserid;		// sys_user表的id
	private String tLoginname;		// 登录名
	private String tName;		// 姓名
	private String tEmail;		// 邮箱
	private String tPhone;		// 电话
	private String qq;		// QQ
	private String wx;		// WX
	private String tPhotourl;		// 用户头像
	private String tPhotoinfo;		// 用户头像
	private String tCompany;		// 公司名称
	private String tCompanyurl;		// 公司网址
	private Date createtime;		// createtime
	private String reserve1;		// 扩展字段1
	private String reserve2;		// 扩展字段1
	private String reserve3;		// 扩展字段1
	private String reserve4;		// 扩展字段1
	private String reserve5;		// 扩展字段1
	
	public TUser() {
		super();
	}

	public TUser(String id){
		super(id);
	}

	@Length(min=1, max=64, message="sys_user表的id长度必须介于 1 和 64 之间")
	public String getTUserid() {
		return tUserid;
	}

	public void setTUserid(String tUserid) {
		this.tUserid = tUserid;
	}
	
	@Length(min=1, max=64, message="登录名长度必须介于 1 和 64 之间")
	public String getTLoginname() {
		return tLoginname;
	}

	public void setTLoginname(String tLoginname) {
		this.tLoginname = tLoginname;
	}
	
	@Length(min=1, max=100, message="姓名长度必须介于 1 和 100 之间")
	public String getTName() {
		return tName;
	}

	public void setTName(String tName) {
		this.tName = tName;
	}
	
	@Length(min=0, max=200, message="邮箱长度必须介于 0 和 200 之间")
	public String getTEmail() {
		return tEmail;
	}

	public void setTEmail(String tEmail) {
		this.tEmail = tEmail;
	}
	
	@Length(min=0, max=200, message="电话长度必须介于 0 和 200 之间")
	public String getTPhone() {
		return tPhone;
	}

	public void setTPhone(String tPhone) {
		this.tPhone = tPhone;
	}
	
	@Length(min=0, max=200, message="QQ长度必须介于 0 和 200 之间")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@Length(min=0, max=200, message="WX长度必须介于 0 和 200 之间")
	public String getWx() {
		return wx;
	}

	public void setWx(String wx) {
		this.wx = wx;
	}
	
	@Length(min=0, max=255, message="用户头像长度必须介于 0 和 255 之间")
	public String getTPhotourl() {
		return tPhotourl;
	}

	public void setTPhotourl(String tPhotourl) {
		this.tPhotourl = tPhotourl;
	}
	
	@Length(min=0, max=255, message="用户头像长度必须介于 0 和 255 之间")
	public String getTPhotoinfo() {
		return tPhotoinfo;
	}

	public void setTPhotoinfo(String tPhotoinfo) {
		this.tPhotoinfo = tPhotoinfo;
	}
	
	@Length(min=0, max=255, message="公司名称长度必须介于 0 和 255 之间")
	public String getTCompany() {
		return tCompany;
	}

	public void setTCompany(String tCompany) {
		this.tCompany = tCompany;
	}
	
	@Length(min=0, max=255, message="公司网址长度必须介于 0 和 255 之间")
	public String getTCompanyurl() {
		return tCompanyurl;
	}

	public void setTCompanyurl(String tCompanyurl) {
		this.tCompanyurl = tCompanyurl;
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