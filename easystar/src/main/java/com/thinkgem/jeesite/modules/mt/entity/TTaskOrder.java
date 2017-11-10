/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 任务订单表Entity
 * @author dongge
 * @version 2017-11-10
 */
public class TTaskOrder extends DataEntity<TTaskOrder> {
	
	private static final long serialVersionUID = 1L;
	private String toTaskid;		// 任务id
	private String toPosterid;		// 申请任务用户id
	private String toType;		// 任务订单状态：1.正在完成中2.成功3.失败
	private String toName;		// 提交订单时的真实姓名
	private String toCardid;		// 提交订单时的身份证号
	private String toPhone;		// 提交订单时的手机号码
	private Date createtime;		// 创建时间
	private Date completetime;		// 交单时间
	private String toPaytype;		// 任务订单是否已经打款：1.已打款2.未打款
	private String toPhotourl;		// 任务订单截图
	private String toPhotoinfo;		// 任务订单截图info
	private String toRemarks;		// 备注信息
	private String toReserve1;		// 扩展字段1
	private String toReserve2;		// 扩展字段2
	private String toReserve3;		// 扩展字段3
	private String toReserve4;		// 扩展字段4
	private String toReserve5;		// 扩展字段5
	
	public TTaskOrder() {
		super();
	}

	public TTaskOrder(String id){
		super(id);
	}

	@Length(min=1, max=64, message="任务id长度必须介于 1 和 64 之间")
	public String getToTaskid() {
		return toTaskid;
	}

	public void setToTaskid(String toTaskid) {
		this.toTaskid = toTaskid;
	}
	
	@Length(min=1, max=64, message="申请任务用户id长度必须介于 1 和 64 之间")
	public String getToPosterid() {
		return toPosterid;
	}

	public void setToPosterid(String toPosterid) {
		this.toPosterid = toPosterid;
	}
	
	@Length(min=0, max=1, message="任务订单状态长度必须介于 0 和 1 之间")
	public String getToType() {
		return toType;
	}

	public void setToType(String toType) {
		this.toType = toType;
	}
	
	@Length(min=0, max=64, message="提交订单时的真实姓名长度必须介于 0 和 64 之间")
	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}
	
	@Length(min=0, max=64, message="提交订单时的身份证号长度必须介于 0 和 64 之间")
	public String getToCardid() {
		return toCardid;
	}

	public void setToCardid(String toCardid) {
		this.toCardid = toCardid;
	}
	
	@Length(min=0, max=64, message="提交订单时的手机号码长度必须介于 0 和 64 之间")
	public String getToPhone() {
		return toPhone;
	}

	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCompletetime() {
		return completetime;
	}

	public void setCompletetime(Date completetime) {
		this.completetime = completetime;
	}
	
	@Length(min=0, max=1, message="任务订单打款状态长度必须介于 0 和 1 之间")
	public String getToPaytype() {
		return toPaytype;
	}

	public void setToPaytype(String toPaytype) {
		this.toPaytype = toPaytype;
	}
	
	@Length(min=0, max=255, message="任务订单截图长度必须介于 0 和 255 之间")
	public String getToPhotourl() {
		return toPhotourl;
	}

	public void setToPhotourl(String toPhotourl) {
		this.toPhotourl = toPhotourl;
	}
	
	@Length(min=0, max=255, message="任务订单截图info长度必须介于 0 和 255 之间")
	public String getToPhotoinfo() {
		return toPhotoinfo;
	}

	public void setToPhotoinfo(String toPhotoinfo) {
		this.toPhotoinfo = toPhotoinfo;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getToRemarks() {
		return toRemarks;
	}

	public void setToRemarks(String toRemarks) {
		this.toRemarks = toRemarks;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getToReserve1() {
		return toReserve1;
	}

	public void setToReserve1(String toReserve1) {
		this.toReserve1 = toReserve1;
	}
	
	@Length(min=0, max=200, message="扩展字段2长度必须介于 0 和 200 之间")
	public String getToReserve2() {
		return toReserve2;
	}

	public void setToReserve2(String toReserve2) {
		this.toReserve2 = toReserve2;
	}
	
	@Length(min=0, max=200, message="扩展字段3长度必须介于 0 和 200 之间")
	public String getToReserve3() {
		return toReserve3;
	}

	public void setToReserve3(String toReserve3) {
		this.toReserve3 = toReserve3;
	}
	
	@Length(min=0, max=200, message="扩展字段4长度必须介于 0 和 200 之间")
	public String getToReserve4() {
		return toReserve4;
	}

	public void setToReserve4(String toReserve4) {
		this.toReserve4 = toReserve4;
	}
	
	@Length(min=0, max=200, message="扩展字段5长度必须介于 0 和 200 之间")
	public String getToReserve5() {
		return toReserve5;
	}

	public void setToReserve5(String toReserve5) {
		this.toReserve5 = toReserve5;
	}
	
}