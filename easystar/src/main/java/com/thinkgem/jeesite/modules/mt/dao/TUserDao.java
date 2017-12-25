/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mt.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.mt.entity.TErweimaTask;
import com.thinkgem.jeesite.modules.mt.entity.TMobiletaskApply;
import com.thinkgem.jeesite.modules.mt.entity.TUser;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户信息附加表DAO接口
 * @author dongge
 * @version 2017-11-02
 */
@MyBatisDao
public interface TUserDao extends CrudDao<TUser> {

    TUser getUserByLoginName(String loginName);

    int updUser(TUser tUser);

    int updSysUser(TUser tUser);

    void updsysuserPassword(User user);

    String getPassword(String loginName);

    int getcountbyinviter(String tPhone);

	void addpicturecode(Map map);

    int checkusername(String username);

    int checkphone(String phone);

	TUser getTUserByPhone(String tPhone);

	int getcountExtendA(String id);

	int getcountExtendB(String id);

	int getcountExtendC(String id);

	String getphotourl(String id);

	List<TUser> getListExtendA(String id);

	List<TUser> getListExtendB(String id);

	List<TUser> getListExtendC(String id);

	void updAcount(TErweimaTask tErweimaTask);

	void updAcountA(String id);

	void updAcountB(String id);

	void updAcountC(String id);

    void updAllsignBytimer();

    void register(String loginName);

	void updateSelfAcount(Map<String,String> map);

	void updateAcountA(Map<String,String> map);

	void updateAcountB(Map<String,String> map);

	void updateAcountC(Map<String,String> map);

	void addtomobileacountdtl(Map<String, Object> map);

	Map<Object, Object> getAllmessageByApplyid(String id);

	List<Map<Object,Object>> getmessageList(String loginName);

	int getLCdaysByLoginName(String loginName);

	void setnameandpid(TUser tUser);

	List<Map<Object,Object>> getAfanxianAll(String id);

	List<Map<Object,Object>> getBfanxianAll(String id);

	List<Map<Object,Object>> getCfanxianAll(String id);
	
}