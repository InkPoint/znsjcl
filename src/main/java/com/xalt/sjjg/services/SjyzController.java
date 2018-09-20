package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.SjyzVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.FileUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2018/1/17.
 */
@Controller
public class SjyzController extends WebServiceSupport {
    @Inject
    private Logger logger;

    @Inject
    private CharCloudyUtil utils;


    public void initSjyz() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据加工—数据验证",this.getUserPrincipal().getUserCode(),"sjjg/sjyz/initSjyz");
        }catch (Exception e){

        }
    }

    //基本的分页查询

    public void list(SjyzVO svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjyzVO();
        }
        logger.debug("svo---->" + svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SjyzMapper.list", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //删除

    public void del(SjyzVO svo) {
        if (svo == null) {
            svo = new SjyzVO();
        }
        logger.debug("svo---->" + svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjjg.dao.SjyzMapper.del", param);
        includeJson("删除成功!");
    }

    //文件上传

    public void uploadfileinput(UploadedFile fileinput) throws Exception {
       /* //读取流
        InputStream inputStream = fileinput.getFile();*/
        logger.debug("fileinput:" + fileinput);
        InputStream inputStream = fileinput.getFile();
        String fileName = fileinput.getFileName();
        //创建文件临时目录
//        final String allowFileSuffix="xls";
        String basePath = "D:/uploadfiles";
        File tmpDir = new File(basePath);
        if (!tmpDir.exists()) {
            tmpDir.mkdirs();
        }
        FileUtils.instreamTooutputstream(inputStream, basePath + File.separator + fileName);
        includeJson("上传成功");
    }

    //插入

    public void insertsjjh(SjyzVO svo) {
        if (svo == null) {
            svo = new SjyzVO();
        }
        logger.debug("svo---->" + svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjjg.dao.SjyzMapper.insertsjjh", param);
        includeJson("添加成功！");
    }

    //先判断文件是否存在，存在返回y,不存在返回no

    public void filexists(String uploadpath) {
        String fileName = "D:\\uploadfiles" + File.separator + uploadpath;
        File file = new File(fileName);
        if (file.exists()) {
            includeJson("y");
        } else {
            includeJson("n");
        }
    }

    //下载

    public Download downdata(String uploadpath) throws FileNotFoundException, UnsupportedEncodingException {
        logger.debug("uploadpath----->" + uploadpath);
        String fileName = "D:\\uploadfiles" + File.separator + uploadpath;
        logger.debug("===>file is {}", fileName);
        File file = new File(fileName);
        logger.debug("===>file is {}", fileName);
        String contentType = ".*"; //所有文件类型
        String filename = uploadpath;

        filename = new String(filename.getBytes("GB2312"), "8859_1");
        if (file.exists()) {
            return new FileDownload(file, contentType, filename);
        } else {
            return null;
        }


    }
}
