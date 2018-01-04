/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.entity;

import java.math.BigDecimal;
import java.util.Date;

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
	private BigDecimal tAcount;     // 账户余额（10,2）
	private BigDecimal tManageracount;     // 理财金账户余额（10,2）
	private String tInviter;        // 邀请人标识
	private String reserve1;		// 扩展字段1
	private String reserve2;		// 扩展字段1
	private int reserve3;		// 扩展字段1
	private String reserve4;		// 扩展字段1
	private String reserve5;		// 扩展字段1
	
	public TUser() {
		super();
	}

	public TUser(String id){
		super(id);
	}

    public String gettUserid()
    {
        return tUserid;
    }

    public void settUserid(String tUserid)
    {
        this.tUserid = tUserid;
    }

    public String gettLoginname()
    {
        return tLoginname;
    }

    public void settLoginname(String tLoginname)
    {
        this.tLoginname = tLoginname;
    }

    public String gettName()
    {
        return tName;
    }

    public void settName(String tName)
    {
        this.tName = tName;
    }

    public String gettEmail()
    {
        return tEmail;
    }

    public void settEmail(String tEmail)
    {
        this.tEmail = tEmail;
    }

    public String gettPhone()
    {
        return tPhone;
    }

    public void settPhone(String tPhone)
    {
        this.tPhone = tPhone;
    }

    public String getQq()
    {
        return qq;
    }

    public void setQq(String qq)
    {
        this.qq = qq;
    }

    public String getWx()
    {
        return wx;
    }

    public void setWx(String wx)
    {
        this.wx = wx;
    }

    public String gettPhotourl()
    {
        return tPhotourl;
    }

    public void settPhotourl(String tPhotourl)
    {
        this.tPhotourl = tPhotourl;
    }

    public String gettPhotoinfo()
    {
        return tPhotoinfo;
    }

    public void settPhotoinfo(String tPhotoinfo)
    {
        this.tPhotoinfo = tPhotoinfo;
    }

    public String gettCompany()
    {
        return tCompany;
    }

    public void settCompany(String tCompany)
    {
        this.tCompany = tCompany;
    }

    public String gettCompanyurl()
    {
        return tCompanyurl;
    }

    public void settCompanyurl(String tCompanyurl)
    {
        this.tCompanyurl = tCompanyurl;
    }

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    public BigDecimal gettAcount()
    {
        return tAcount;
    }

    public void settAcount(BigDecimal tAcount)
    {
        this.tAcount = tAcount;
    }

    public String getReserve1()
    {
        return reserve1;
    }

    public void setReserve1(String reserve1)
    {
        this.reserve1 = reserve1;
    }

    public String getReserve2()
    {
        return reserve2;
    }

    public void setReserve2(String reserve2)
    {
        this.reserve2 = reserve2;
    }

    public int getReserve3() {
		return reserve3;
	}

	public void setReserve3(int reserve3) {
		this.reserve3 = reserve3;
	}

	public String getReserve4()
    {
        return reserve4;
    }

    public void setReserve4(String reserve4)
    {
        this.reserve4 = reserve4;
    }

    public String getReserve5()
    {
        return reserve5;
    }

    public void setReserve5(String reserve5)
    {
        this.reserve5 = reserve5;
    }

    public String gettInviter()
    {
        return tInviter;
    }

    public void settInviter(String tInviter)
    {
        this.tInviter = tInviter;
    }

	public BigDecimal gettManageracount() {
		return tManageracount;
	}

	public void settManageracount(BigDecimal tManageracount) {
		this.tManageracount = tManageracount;
	}
	
}