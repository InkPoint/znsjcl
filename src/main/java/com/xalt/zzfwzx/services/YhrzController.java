package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.utils.FileUtils;
import com.xalt.zzfwzx.model.YhrzVO;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * author：PengWen Wang
 * Created by win7 on 2018/6/19.
 * 用户日志
 */
@Controller
public class YhrzController extends WebServiceSupport {

    @Inject
    private Logger log;

    //用户日志
    @NoLoginValidate
    public void initYhrz() {
    }

    /**
     * 查看日志
     */
    @NoLoginValidate
    public void initCkrz() {
    }


    /**
     * 新增日志
     *
     * @param svo
     */
    @NoLoginValidate
    public void saveData(YhrzVO svo, String filenameall) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        svo.setLogid(getUUID());
        svo.setUsercode(this.getUserPrincipal().getUserCode());
        svo.setUsername(this.getUserPrincipal().getUserName());
        param.put("thetext", svo.getThetext());
        param.put("svo", svo);
        mapper.selectList("com.xalt.zzfwzx.dao.YhrzMapper.saveData", param);
        svo.setUuid(getUUID());
        mapper.selectList("com.xalt.zzfwzx.dao.YhrzMapper.saveAttachData", param);
        includeJson("新增成功");
    }

    /**
     * 文件上传
     * 大小限制(sizeLImit)不超过100MB  （fileSizeLimit）文件大小不超过50MB
     *
     * @param fileinput
     * @throws Exception
     */
    @UploadSizeLimit(sizeLimit = 100 * 1024 * 1024, fileSizeLimit = 50 * 1024 * 1024)
    @NoLoginValidate
    public void fileUpload(UploadedFile fileinput) throws Exception {
        String usercode = this.getUserPrincipal().getUserCode();
        // (原)文件上传路径
        // File file = new File("D:\\JobLog" + "\\" + getDate() + "\\" + usercode);
        File file = new File(this.getClass().getResource("/").getPath()+"\\DeveloperLog" + "\\" + getDate() + "\\" + usercode);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
        FileOutputStream fos = null;
        try {
            //读取流
            InputStream inputStream = fileinput.getFile();
            //字节输入流
            FileInputStream fis = (FileInputStream) inputStream;
            //字节输出流
            fos = FileUtils.instreamTooutputstream(fis, file + File.separator + fileinput.getFileName());
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        fos.close();
        includeJson(file);
    }

    /**
     * 工作日志(表数据)
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    @NoLoginValidate
    public void querysAll(YhrzVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.YhrzMapper.querysAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 删除日志
     *
     * @param svo
     */
    @NoLoginValidate
    public void deleteTheLog(YhrzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.zzfwzx.dao.YhrzMapper.deleteTheLog", param);
        includeJson("删除成功");
    }

    /**
     * 获取文本
     *
     * @param svo
     */
    public void modifyTheText(YhrzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.zzfwzx.dao.YhrzMapper.modifyTheText", map);
        includeJson(list);
    }

    /**
     * 保存编辑后的文本
     *
     * @param svo
     */
    public void saveModifyTheText(YhrzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("thetext", svo.getThetext());
        map.put("svo", svo);
        delegateMapper.update("com.xalt.zzfwzx.dao.YhrzMapper.saveModifyTheText", map);
        includeJson("编辑完成");
    }

    /**
     * 根据logID上传文件
     * 大小限制(sizeLImit)不超过100MB  （fileSizeLimit）文件大小不超过50MB
     *
     * @param fileinput
     * @throws Exception
     */
    @UploadSizeLimit(sizeLimit = 100 * 1024 * 1024, fileSizeLimit = 50 * 1024 * 1024)
    @NoLoginValidate
    public void baseUuidUpload(UploadedFile fileinput, String logid) throws Exception {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        String usercode = this.getUserPrincipal().getUserCode();
        map.put("uuid", getUUID());
        map.put("logid", logid);
        map.put("filename", fileinput.getFileName());
        List<YhrzVO> list = delegateMapper.selectList("com.xalt.zzfwzx.dao.YhrzMapper.specifyTheQuery", map);
        Vector<Object> nullVector = new Vector<>();
        nullVector.add(null);
        list.removeAll(nullVector);//删除null元素
        if (list.isEmpty()) {
            File file = new File("D:\\JobLog" + "\\" + getDate() + "\\" + usercode);
            if (!file.exists() && !file.isDirectory()) {
                file.mkdirs();
            }
            map.put("filepath", file);
            FileOutputStream fos = null;
            //读取流
            InputStream inputStream = fileinput.getFile();
            //字节输入流
            FileInputStream fis = (FileInputStream) inputStream;
            //字节输出流
            fos = FileUtils.instreamTooutputstream(fis, file + File.separator + fileinput.getFileName());
            fos.close();
            delegateMapper.insert("com.xalt.zzfwzx.dao.YhrzMapper.uploadAgain", map);
            delegateMapper.update("com.xalt.zzfwzx.dao.YhrzMapper.modifyFileName", map);
            includeJson(file);
        } else {
            map.put("filepath", (list.get(0)).getFilepath());
            File file = new File(map.get("filepath").toString());
            if (!file.exists() && !file.isDirectory()) {
                file.mkdirs();
            }
            FileOutputStream fos = null;
            //读取流
            InputStream inputStream = fileinput.getFile();
            //字节输入流
            FileInputStream fis = (FileInputStream) inputStream;
            //字节输出流
            fos = FileUtils.instreamTooutputstream(fis, file + File.separator + fileinput.getFileName());
            fos.close();
            delegateMapper.insert("com.xalt.zzfwzx.dao.YhrzMapper.uploadAgain", map);
            delegateMapper.update("com.xalt.zzfwzx.dao.YhrzMapper.modifyFileName", map);
            includeJson(file);
        }
    }

    /**
     * 删除附件
     *
     * @param svo
     */
    @NoLoginValidate
    public void deleteTheAttachment(YhrzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.delete("com.xalt.zzfwzx.dao.YhrzMapper.deleteTheAttachment", param);
        includeJson("删除成功");
    }

    /**
     * 获取已上传文件
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    @NoLoginValidate
    public void getUploadedFile(YhrzVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.YhrzMapper.getUploadedFile", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 文件下载
     *
     * @param
     * @return
     * @throws FileNotFoundException
     * @throws UnsupportedEncodingException
     */
    @NoLoginValidate
    public Download downloadFiles(HttpServletResponse response, String filepath, String filename) throws Exception {
        File file = new File(filepath + File.separator + filename);
        String contentType = ".*"; //所有文件类型
        response.setContentType("application/octet-stream");
        String newFileName = URLEncoder.encode(filename, "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + newFileName);
        return new FileDownload(file, contentType, newFileName, true);
    }

    /**
     * 下载
     *
     * @param
     * @param response
     */
    public void download(HttpServletResponse response, String filepath, String filename) {
        try {
            File file = new File(filepath + File.separator + filename);
            //把文件名按UTF-8取出并按ISO8859-1编码，保证弹出框的文件名不是中文乱码
            filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");
            //告诉浏览器输出内容为流
            response.setContentType("application/octet-stream");
            //Content-Disposition中指定的类型是文件的扩展名，
            response.setHeader("Content-Disposition", "attachment;filename=" + filename);
            String len = String.valueOf(file.length());
            //设置内容长度
            response.setHeader("Content-Disposition", len);
            OutputStream out = response.getOutputStream();
            FileInputStream in = new FileInputStream(file);
            byte[] b = new byte[1024];
            int n;
            while ((n = in.read(b)) != -1) {
                out.write(b, 0, n);
            }
            in.close();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取文件路径
     *
     * @param svo
     */
    public void queryFilePath(YhrzVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.zzfwzx.dao.YhrzMapper.queryFilePath", map);
        includeJson(list);
    }

    /**
     * 文件路径
     */
    public void theFilePath() {
        String usercode = this.getUserPrincipal().getUserCode();
        String filePath = "D:" + File.separator + "JobLog" + File.separator + getDate() + File.separator + usercode;
        includeJson(filePath);
    }

    /**
     * 获得一个UUID
     *
     * @return
     */
    public static String getUUID() {
        String uuid = UUID.randomUUID().toString();
        //去掉"-"符号
        return uuid.replaceAll("-", "");
    }

    /**
     * 获得当前年月日
     *
     * @return
     */
    public static String getDate() {
        String year = "";
        String month = "";
        String day = "";
        Calendar now = Calendar.getInstance();
        year = String.valueOf(now.get(Calendar.YEAR));
        month = String.valueOf(now.get(Calendar.MONTH) + 1);
        day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
        return year + "年" + month + "月" + day + "日";
    }
}
