package com.thinkgem.jeesite.modules.mt.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Controller
@RequestMapping(value = "${adminPath}/upload")
public class UpLoaderController
{
    
    /**
     * 
      * @Description: 上传图片
      * @param sortPicImg
      * @param request
      * @param response
      * @return
      * String 返回类型
      * @author：xujiale
      * @date：2017年9月30日上午9:41:43
     */
    @RequestMapping(params = "method=upload")
    @ResponseBody
    public String uploads(String id,String name,String size,String type,@RequestParam("file") MultipartFile sortPicImg,HttpServletRequest request, HttpServletResponse response)
    {
        //获取登录用户id
        Principal principal = UserUtils.getPrincipal();
        String loginUserId = principal.getId();
        
        //当前时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String dateStr = sdf.format(new Date());
        
        //图片类型 1 团队项目，2 banner
        String ImageType = request.getParameter("ImageType");
        String ImageClass = "";
        if(("1").equals(ImageType)){
            String token = request.getParameter("token");
            ImageClass="product";
            /*
            if(("0").equals(token)){
                ImageClass =  "project";
            }else{
                ImageClass =  "team";
            }
            */
        }else if(("2").equals(ImageType)){
            ImageClass =  "taskorder";
        }else if(("3").equals(ImageType)){
        	ImageClass="match";
        }else{
        	
        }
        
        //拼接地址
        String filePathGen = "/uploads/" + loginUserId + "/" + ImageClass + "/" + dateStr;
        
        String ensourPath =  getEnourPath(request,sortPicImg,filePathGen);
        
        JSONObject json = new JSONObject();
        
        if(!ensourPath.equals("")){
            //解析ensourPath
            String[] split = ensourPath.split("webapp");
            String string = split[1].substring(1, split[1].length());
            
//            //保存到数据库
//            TScImgInfo tScImgInfo = new TScImgInfo();
//            tScImgInfo.setSiiSize(size);
//            tScImgInfo.setSiiName(name);
//            tScImgInfo.setSiiUrl(string);
//            tScImgInfo.setSiiType(type);
//            tScImgInfo.setSiiId(id);
//            tScImgInfoService.save(tScImgInfo);
            
            String fileinfo = id+","+name+","+type+","+size+","+string;
            json.put("msg", "success");
            json.put("realPath", string);
            json.put("fileinfo", fileinfo);
        }else{
            json.put("msg", "error");
            
        }
//        System.out.println("json=" + json.toString());
        return json.toString();
    }
    
    
    //校验并保存图片
    private static final String[] IMAGE_TYPE = { ".jpg", ".jpge", ".bmp", ".png", ".gif",".zip" };
    private String getEnourPath(HttpServletRequest request, MultipartFile file,String filePathGen) {
            Boolean flag = false;
            System.out.println(file.getOriginalFilename());
            //校验图片格式
            for (String type : IMAGE_TYPE) {
                if (StringUtils.endsWithIgnoreCase(file.getOriginalFilename(), type)) {
                    flag = true;
                    break;
                }
            }
            //如果图片校验错误，直接返回。
            if (!flag) {
                return "";
            }
            //生成图片的绝对路径
            String filePath = getFilePath(request,file.getOriginalFilename(),filePathGen);

            //创建File对象
            File newfile = new File(filePath);

            //把图片写入到磁盘中
            try {
                file.transferTo(newfile);
            } catch (Exception e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        return filePath;
    }
    
    
    //拼接图片路径
    private String getFilePath(HttpServletRequest request,String originalFilename,String filePath) {
        //保存路径
        String fileFolder = request.getSession().getServletContext().getRealPath(filePath);
        File file = new File(fileFolder);
        //如果文件目录不存在，则进行创建
        if (!file.isDirectory()) {
            file.mkdirs();
        }
        //生成图片的文件名
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        //拼接图片的路径
        return fileFolder + File.separator + fileName;
    }
    
    
    
    
    

}
