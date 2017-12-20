package com.thinkgem.jeesite.modules.sys.utils.timer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.thinkgem.jeesite.modules.mt.service.TUserService;

@Component
public class TaskCool{
    @Autowired
    TUserService tUserService;
    public void testJob(){
        System.out.println("执行了操作语句，到了凌晨12点就开始更新所有的签到");
        tUserService.updAllsignBytimer();
    }
    
}
