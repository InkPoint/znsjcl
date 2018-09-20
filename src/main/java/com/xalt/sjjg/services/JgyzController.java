package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.JgyzVO;
import com.xalt.utils.FileUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;


/**
 * author:WangPengWen
 * Created by win7 on 2017/11/27.
 * 结果验证
 */
@Controller
public class JgyzController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initJgyz() {
    }


    // (结果验证)表信息查询

    public void selectAll(JgyzVO svo) {
        if (svo == null) {
            svo = new JgyzVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JgyzMapper.selectAll", param);
        includeJson(vo);
    }

    //业务类型（下拉菜单）

    public void getDownmenu() {
        DelegateMapper mapper = getMapper();
        //数据载入数据加载
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgyzMapper.downmenu");
        includeJson(vo);
    }

    //(结果验证)新增

    public void newaddition(JgyzVO svo) {
        if (svo == null) {
            svo = new JgyzVO();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjjg.dao.JgyzMapper.newaddition", param);
        includeJson("添加成功!");
    }

    //删除数据

    public void deletedata(JgyzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjjg.dao.JgyzMapper.deletesbyid", param);
        includeJson("删除成功!");
    }

    //（结果验证)编辑

    public void modifydata(JgyzVO svo) {
        if (svo == null) {
            svo = new JgyzVO();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjjg.dao.JgyzMapper.modifyData", param);
        includeJson("修改成功!");
    }

    //fileinput上传文件方法

    public void  uploadfileinput(UploadedFile fileinput) throws Exception {
        //读取流
        InputStream inputStream = fileinput.getFile();
        //字节输入流
        FileInputStream fis = (FileInputStream) inputStream;
//      获取项目的所在的根路径
//        String basepath = this.getClass().getResource("/").getPath();
        //创建文件临时目录
//        final String allowFileSuffix = "xls";
//        String basePath = "D:" + FilesConst.uploadfilepath + "" + fileinput.getFileName();
//        File tmpDir = new File(basePath);
//        if (!tmpDir.exists()) {
//            //建立多级文件夹
//            tmpDir.mkdirs();
//        }
        //字节输出流
        FileOutputStream fos = FileUtils.instreamTooutputstream(fis, "d:"+File.separator + fileinput.getFileName());
        fos.close();
        includeJson("上传成功!");
    }
}
