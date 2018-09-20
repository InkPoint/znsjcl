package com.xalt.demos.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.DefaultUploadedFile;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.google.common.io.Files;
import com.ts.acl.util.AclConstants;
import com.ts.acl.util.ByteInputStream;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.common.FilesConst;
import com.xalt.demos.model.NsrxxVO;
import com.xalt.demos.model.QueryVO;

import com.xalt.utils.FileUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.MultipartStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.DataFormat;
import org.slf4j.Logger;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.security.auth.Subject;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 文件上传
 * user controller
 */
@Controller
public class FileUploadController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void upload(){

    }

    // 基本分页查询
    @NoLoginValidate
    public void list(QueryVO svo, int limit, int offset, String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QueryVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.demos.dao.BasicQueryMapper.selectAll", param,offset,limit);
        Map<String,Object> results=new HashMap<String,Object>();
        results.put("total",vo.getPageCount());
        results.put("rows",vo.getRows());
        log.debug("vo", vo);
        includeJson(vo);

    }

    @NoLoginValidate
    public void  savedata(String  nsrxxlist,String nsrmc){
        log.debug("nsrxxlist:"+nsrxxlist);
        log.debug("nsrmc:"+nsrmc);
        List<NsrxxVO> list = JSONObject.parseObject(nsrxxlist,List.class);
        includeJson("执行成功!");
    }
    @UploadSizeLimit(sizeLimit=40*1024*1024, fileSizeLimit=0*1024*1024)
    @NoLoginValidate
    public void  uploadfile(UploadedFile uploadedFile, String userId){
          String savePath = "D:/user/allfiles/";
        File f = new File(savePath);
        if (!f.exists()) {
            f.mkdirs();
        }

        log.debug("====>uploadImage");
        log.debug("====>basePath={}", savePath);
        if(uploadedFile != null){
            log.debug("===>file is {}",uploadedFile.getFileName());
            String fileName = uploadedFile.getFileName();
            String extName = "";
            //扩展名格式：
            if (fileName.lastIndexOf(".") >= 0) {
                extName = fileName.substring(fileName.lastIndexOf("."));
            }
            String fullName = savePath + uploadedFile.getFileName();
            try {
                log.debug("==>文件{}保存成功!", fullName);
                  Files.write(ByteInputStream.input2byte(uploadedFile.getFile()), new File(fullName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//          include("").forwardTo("/");
          includeJson("ssss");

    }

    //fileinput上传文件方法      所有文件总计不超过100mb  单个文件大小不超过50M
    @UploadSizeLimit(sizeLimit=100*1024*1024, fileSizeLimit=50*1024*1024)
    @NoLoginValidate
    public void uploadfileinput(HttpServletRequest request,HttpServletResponse response,UploadedFile fileinput1) throws Exception{
        log.debug("fileinput1:"+fileinput1);
        InputStream inputStream=fileinput1.getFile();
        FileUtils.instreamTooutputstream(inputStream,"D:/uploadfiles/"+fileinput1.getFileName());
//      获取项目的所在的根路径
        String basepath=this.getClass().getResource("/").getPath();
        //创建文件临时目录
//        final String allowFileSuffix="xls";
//        String basePath="D:/uploadfiles/+"+fileinput1.getFileName();
//        File tmpDir=new File(basePath);
//        if(!tmpDir.exists()){
//            tmpDir.mkdirs();
//        }

//        OutputStreamWriter ow=new OutputStreamWriter(fs,"utf-8");
        includeJson("good");
    }

    //下载管理
    // 用户图片下载

    @NoLoginValidate
    public Download downloadImage(HttpServletResponse response, String userId) throws Exception{
        log.debug("===>downloadImage");
        response.setContentType("application/octet-stream");
        String newFileName = URLEncoder.encode("lsfjsl.rar", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename="+newFileName);
        //原始文件目录
        String fullName = "D:\\ptf3培训文档/api.rar";
        log.debug("===>file is {}",fullName);
        File file = new File(fullName);
        String contentType = ".*"; //所有文件类型
        //String filename = profile.getName() + ".jpg";
        //参数说明：file  原始文件目录  contentType 文件类型   最后一个参数：下载后文件名称
        return new FileDownload(file, contentType,newFileName,true);
    }



    // doc文案预览

    @NoLoginValidate
    public void dataViews(String userId,HttpServletResponse resp) throws FileNotFoundException{
        log.debug("===>downloadImage");
        //原始文件目录
        String fullName = "D:\\王鹏文项目计划.doc";
        log.debug("===>file is {}",fullName);
        File file = new File(fullName);
        String contentType = ".*"; //所有文件类型
        InputStream is=new FileInputStream(file);
        byte[] buffer=new byte[1024];
        int bytesread=0;
        try{
            do{
                bytesread=is.read(buffer,0,buffer.length);
                resp.getOutputStream().write(buffer, 0, bytesread);
            }while(bytesread==buffer.length);

        }catch(Exception e){
            e.printStackTrace();
        }finally {
            try{
                if(is!=null){
                    is.close();
                }
                resp.getOutputStream().flush();
            }catch (Exception ee){
                ee.printStackTrace();
            }
        }
    }

    public Download downloadfils11(HttpServletResponse response) throws Exception {
        File file = new File("D:\\王鹏文项目计划.doc");
        String contentType = ".*"; //所有文件类型
        response.setContentType("application/octet-stream");
        String newFileName = URLEncoder.encode("myattach.doc", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + newFileName);
        return new FileDownload(file, contentType,newFileName,true);
    }

}
