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
 * 担保平台Entity
 * @author dongge
 * @version 2017-11-13
 */
public class TDbPlatform extends DataEntity<TDbPlatform> {
	
	private static final long serialVersionUID = 1L;
	private String dbJfuserid;		// 甲方用户id
	private String dbJfphone;		// 甲方用户电话
	private String dbYfuserid;		// 乙方用户id
	private String dbYfphone;		// 乙方用户电话
	private String dbType;		// 担保内容类型
	private String dbIfhasht;		// 是否拥有合同:1.没有合同 2.已有合同
	private String dbIfhasyh;		// 是否已经约好:1.未约好 2.已约好
	private String dbStatus;		// 担保状态：1.正在进行中2.成功 3.失败
	private Date createtime;		// 担保提交时间
	private Date completetime;		// 审核结果时间
	private String dbRemarks;		// 备注信息
	private String dbReserve1;		// 扩展字段1
	private String dbReserve2;		// 扩展字段2
	private String dbReserve3;		// 扩展字段3
	private String dbReserve4;		// 扩展字段4
	private String dbReserve5;		// 扩展字段5
	
	public TDbPlatform() {
		super();
	}

	public TDbPlatform(String id){
		super(id);
	}

	@Length(min=1, max=64, message="甲方用户id长度必须介于 1 和 64 之间")
	public String getDbJfuserid() {
		return dbJfuserid;
	}

	public void setDbJfuserid(String dbJfuserid) {
		this.dbJfuserid = dbJfuserid;
	}
	
	@Length(min=1, max=64, message="甲方用户电话长度必须介于 1 和 64 之间")
	public String getDbJfphone() {
		return dbJfphone;
	}

	public void setDbJfphone(String dbJfphone) {
		this.dbJfphone = dbJfphone;
	}
	
	@Length(min=1, max=64, message="乙方用户id长度必须介于 1 和 64 之间")
	public String getDbYfuserid() {
		return dbYfuserid;
	}

	public void setDbYfuserid(String dbYfuserid) {
		this.dbYfuserid = dbYfuserid;
	}
	
	@Length(min=1, max=64, message="乙方用户电话长度必须介于 1 和 64 之间")
	public String getDbYfphone() {
		return dbYfphone;
	}

	public void setDbYfphone(String dbYfphone) {
		this.dbYfphone = dbYfphone;
	}
	
	@Length(min=1, max=1, message="担保内容类型长度必须介于 1 和 1 之间")
	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
	
	@Length(min=1, max=1, message="是否已有合同长度必须介于 0 和 1 之间")
	public String getDbIfhasht() {
		return dbIfhasht;
	}

	public void setDbIfhasht(String dbIfhasht) {
		this.dbIfhasht = dbIfhasht;
	}
	
	@Length(min=1, max=1, message="是否已经约定长度必须介于 0 和 1 之间")
	public String getDbIfhasyh() {
		return dbIfhasyh;
	}

	public void setDbIfhasyh(String dbIfhasyh) {
		this.dbIfhasyh = dbIfhasyh;
	}
	
	@Length(min=1, max=1, message="担保状态必须介于 0 和 1 之间")
	public String getDbStatus() {
		return dbStatus;
	}

	public void setDbStatus(String dbStatus) {
		this.dbStatus = dbStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="担保提交时间不能为空")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="审核结果时间不能为空")
	public Date getCompletetime() {
		return completetime;
	}

	public void setCompletetime(Date completetime) {
		this.completetime = completetime;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getDbRemarks() {
		return dbRemarks;
	}

	public void setDbRemarks(String dbRemarks) {
		this.dbRemarks = dbRemarks;
	}
	
	@Length(min=0, max=255, message="扩展字段1长度必须介于 0 和 255 之间")
	public String getDbReserve1() {
		return dbReserve1;
	}

	public void setDbReserve1(String dbReserve1) {
		this.dbReserve1 = dbReserve1;
	}
	
	@Length(min=0, max=255, message="扩展字段2长度必须介于 0 和 255 之间")
	public String getDbReserve2() {
		return dbReserve2;
	}

	public void setDbReserve2(String dbReserve2) {
		this.dbReserve2 = dbReserve2;
	}
	
	@Length(min=0, max=255, message="扩展字段3长度必须介于 0 和 255 之间")
	public String getDbReserve3() {
		return dbReserve3;
	}

	public void setDbReserve3(String dbReserve3) {
		this.dbReserve3 = dbReserve3;
	}
	
	@Length(min=0, max=255, message="扩展字段4长度必须介于 0 和 255 之间")
	public String getDbReserve4() {
		return dbReserve4;
	}

	public void setDbReserve4(String dbReserve4) {
		this.dbReserve4 = dbReserve4;
	}
	
	@Length(min=0, max=255, message="扩展字段5长度必须介于 0 和 255 之间")
	public String getDbReserve5() {
		return dbReserve5;
	}

	public void setDbReserve5(String dbReserve5) {
		this.dbReserve5 = dbReserve5;
	}
	
}