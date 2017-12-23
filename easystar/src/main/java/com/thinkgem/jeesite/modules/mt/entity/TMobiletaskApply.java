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
 * 手机做任务Entity
 * @author dongg
 * @version 2017-12-23
 */
public class TMobiletaskApply extends DataEntity<TMobiletaskApply> {
	
	private static final long serialVersionUID = 1L;
	private String tmaUserid;		// 对应的用户id
	private String tmaTaskid;		// 对应的任务id
	private String tmaName;		// 姓名
	private String tmaCardid;		// 身份证号
	private String tmaPhone;		// 手机号码
	private String tmaStatus;		// 任务状态：1.待审核2.审核成功3.审核失败
	private Date createtime;		// 创建时间
	private String tetReserve1;		// 扩展字段1
	
	public TMobiletaskApply() {
		super();
	}

	public TMobiletaskApply(String id){
		super(id);
	}

	@Length(min=1, max=64, message="对应的用户id长度必须介于 1 和 64 之间")
	public String getTmaUserid() {
		return tmaUserid;
	}

	public void setTmaUserid(String tmaUserid) {
		this.tmaUserid = tmaUserid;
	}
	
	@Length(min=1, max=64, message="对应的任务id长度必须介于 1 和 64 之间")
	public String getTmaTaskid() {
		return tmaTaskid;
	}

	public void setTmaTaskid(String tmaTaskid) {
		this.tmaTaskid = tmaTaskid;
	}
	
	@Length(min=1, max=64, message="姓名长度必须介于 1 和 64 之间")
	public String getTmaName() {
		return tmaName;
	}

	public void setTmaName(String tmaName) {
		this.tmaName = tmaName;
	}
	
	@Length(min=0, max=64, message="身份证号长度必须介于 0 和 64 之间")
	public String getTmaCardid() {
		return tmaCardid;
	}

	public void setTmaCardid(String tmaCardid) {
		this.tmaCardid = tmaCardid;
	}
	
	@Length(min=1, max=64, message="手机号码长度必须介于 1 和 64 之间")
	public String getTmaPhone() {
		return tmaPhone;
	}

	public void setTmaPhone(String tmaPhone) {
		this.tmaPhone = tmaPhone;
	}
	
	public String getTmaStatus() {
		return tmaStatus;
	}

	public void setTmaStatus(String tmaStatus) {
		this.tmaStatus = tmaStatus;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间不能为空")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Length(min=0, max=200, message="扩展字段1长度必须介于 0 和 200 之间")
	public String getTetReserve1() {
		return tetReserve1;
	}

	public void setTetReserve1(String tetReserve1) {
		this.tetReserve1 = tetReserve1;
	}
	
}