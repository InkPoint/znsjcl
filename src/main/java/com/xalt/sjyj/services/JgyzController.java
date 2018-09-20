package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.JgyzVo;
import com.xalt.utils.FileUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/15.
 * 结果验证
 * User: CuiHeng
 */
@Controller
public class JgyzController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initJgyz(){}

    //分析任务（下拉列表）

    public void selectzsfj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.JgyzMapper.selectFxrw");
        includeJson(vo);
    }

    //基本分页查询

    public void selectFxrw(JgyzVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new JgyzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.JgyzMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //添加分析任务

    public void insertFxrw(JgyzVo svo){
        if (svo == null) {
            svo = new JgyzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjyj.dao.JgyzMapper.insertFxrw", param);
        includeJson("添加成功！");
    }

    //编辑分析任务

    public void updateFxrw(JgyzVo svo){
        if (svo == null) {
            svo = new JgyzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.JgyzMapper.updateFxrw", param);
        includeJson("success!");
    }

    //删除分析任务

    public void deleteFxrw(JgyzVo svo){
        if (svo == null) {
            svo = new JgyzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.JgyzMapper.deleteFxrw", param);
        includeJson("success!");
    }

    //    //文件上传

    public void  uploadfileinput(UploadedFile fileinput) throws Exception {
        //读取流
        InputStream fis = fileinput.getFile();
        //字节输入流
       // FileInputStream fis = (FileInputStream) inputStream;
        //创建文件临时目录
        final String allowFileSuffix = "xls";
//        String basePath = "D:" + FilesConst.uploadfilepath + "" + fileinput.getFileName();
        long currentMillis = System.currentTimeMillis();
        String fileExt = fileinput.getFileName().substring( fileinput.getFileName().lastIndexOf(".") );
        String newFileName =  currentMillis+fileExt ;
        //fileinput.getFileName()+Long.toString(currentMillis)+fileinput.getFileName().substring(fileinput.getFileName().lastIndexOf("."));
        String fileName= fileinput.getFileName();
        String basePath = "D:/uploadfiles";
        File tmpDir = new File(basePath);
        if (!tmpDir.exists()) {
            //建立多级文件夹
            tmpDir.mkdirs();
        }
        //字节输出流
        //File.separator 用于不同系统下路径的问题
        FileOutputStream fos = FileUtils.instreamTooutputstream(fis, basePath + File.separator + fileName);
        fos.close();
        includeJson("上传成功!");

    }


    // 校验当前分析任务名称的唯一性

    public void nameValidation(String fxrw) {
        boolean result=true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        JgyzVo svo = new JgyzVo();
        svo.setYzmc(fxrw);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.JgyzMapper.nameValidation", param);
        if (vo != null&&vo.size()>0) {
            result=false;
        }
        Map<String,Boolean> map=new HashMap<>();
        map.put("valid",result);
        includeJson(map);
    }
}
