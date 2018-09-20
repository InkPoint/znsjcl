package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjzyzkbgVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.FileUtils;
import com.xalt.utils.RandomUUID;
/*import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;*/
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Map;

/**
 * Created by win7 on 2018/3/12.
 */
@Controller
public class SjzyzkbgController extends WebServiceSupport {
    @Inject
    private Logger logger;
    @Inject
    private CharCloudyUtil utils;


    public void initSjzyzkbg() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据资源状况报告",this.getUserPrincipal().getUserCode(),"sjyj/sjzyzkbg/initSjzyzkbg");
        }catch (Exception e){

        }
    }


    //基本查询
    public void selectall(SjzyzkbgVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.SjzyzkbgMapper.selectall", param, offset, limit);
        includeJson(vo);
    }

    //上传文件

    public void uploadfile(UploadedFile fileinput) throws Exception {
        logger.debug("fileinput:" + fileinput);
        InputStream inputStream = fileinput.getFile();
        String fileName = fileinput.getFileName();
        String basePath = "D:/uploadfiles/sjzyzkbg";
        File tmpDir = new File(basePath);
        if (!tmpDir.exists()) {
            tmpDir.mkdirs();
        }
        FileUtils.instreamTooutputstream(inputStream, basePath + File.separator + fileName);
        includeJson("上传成功");
    }

    //新增

    public void addzybgdata(SjzyzkbgVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //上传人代码
        String usercode = this.getUserPrincipal().getUserCode();
        String zyid = RandomUUID.getUUIDRandoms();
        param.put("usercode", usercode);
        param.put("zyid", zyid);
        param.put("zylj", "D:/uploadfiles/sjzyzkbg");
        delegateMapper.insert("com.xalt.sjyj.dao.SjzyzkbgMapper.addzybgdata", param);
        includeJson("新增成功！");
    }

    //编辑

    public void updatezybgdata(SjzyzkbgVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.SjzyzkbgMapper.updatezybgdata", param);
        includeJson("修改成功！");
    }

    //删除

    public void delzybgdata(SjzyzkbgVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.SjzyzkbgMapper.delzybgdata", param);
        includeJson("删除成功！");
    }

    //判断文件是否存在

    public void filexit(String filename) {

        String fileName = "D:\\uploadfiles\\sjzyzkbg" + File.separator + filename;
        File file = new File(fileName);
        if (file.exists()) {
            includeJson("y");
        } else {
            includeJson("n");
        }
    }

    //文件下载

    public Download downloadfile(String filename) throws FileNotFoundException, UnsupportedEncodingException {

//        int i = filename.lastIndexOf(".");
//        String newfilename = filename.substring(0,i);
        String fileName = "D:\\uploadfiles\\sjzyzkbg" + File.separator + filename;
        File file = new File(fileName);
        String contentType = ".*"; //所有文件类型
        String newfilename = filename;
        newfilename = new String(newfilename.getBytes("GB2312"), "8859_1");
        if (file.exists()) {
            return new FileDownload(file, contentType, newfilename);
        } else {
            return null;
        }
    }
//    //在线预览文件的方法
//        public void wjyl(SjzyzkbgVO svo) throws Exception{
//        //使用流处理把文件得到然后给前台返回一个输出流
//        //得到文件名
//            String filename = svo.getFilename();
//            String fileName = "D:\\uploadfiles\\sjzyzkbg" + File.separator + filename;
//            File file = new File(fileName);
//            if(file.exists()){
//                //文件存在
//                FileInputStream fin = new FileInputStream(file);
//                FileOutputStream fout = FileUtils.instreamTooutputstream(fin, fileName);
//                includeJson(fout);
//            }else{
//                includeJson("n");
//            }
//
//        /*PageOfficeCtrl poCtrl1 = new PageOfficeCtrl();
//        poCtrl1.setServerPage("poserver.do"); //此行必须
//        poCtrl1.setSaveFilePage("initsjcpztxz.jsp");
//        poCtrl1.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张三");
//        poCtrl1.setTagId(zyid); //此行必须
//        Map<String,Object> result = Maps.newHashMap();
//        result.put("page",poCtrl1);
//        includeJson(result);*/
//
//
//    }

}
