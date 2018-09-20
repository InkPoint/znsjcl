package com.xalt.sjsplc.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjsplc.model.LogVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.ExportExcel;
import com.xalt.utils.FileUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * author:PengWen Wang
 * Created by win7 on 2018/4/10.
 * (开发者)工作日志
 */
@Controller
public class LogController extends WebServiceSupport {

    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    /**
     * 写日志
     */

    public void initLog() {
    }

    /**
     * 看日志
     */

    public void initViewLog() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "日志记录", this.getUserPrincipal().getUserCode(), "sjsplc/log/initViewLog");
        } catch (Exception e) {

        }
    }


    /**
     * 新增日志
     *
     * @param svo
     */
    public void saveData(LogVO svo, String filenamearray) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        svo.setLogid(getUUID());
        svo.setUsercode(this.getUserPrincipal().getUserCode());
        svo.setUsername(this.getUserPrincipal().getUserName());
        param.put("thetext", svo.getThetext());
        param.put("svo", svo);
        mapper.selectList("com.xalt.sjsplc.dao.LogMapper.saveData", param);
        svo.setUuid(getUUID());
        if (filenamearray != null) {
            String filenames = filenamearray.substring(1, filenamearray.length() - 1);
            String[] myfilenames = filenames.split(",");
            for (int i = 0; i < myfilenames.length; i++) {
                svo.setFilename(myfilenames[i].substring(1, myfilenames[i].length() - 1));
                mapper.selectList("com.xalt.sjsplc.dao.LogMapper.saveAttachData", param);
            }
        }
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
    public void fileUpload(UploadedFile fileinput) throws Exception {
        String usercode = this.getUserPrincipal().getUserCode();
        File file = new File("D:\\JobLog" + "\\" + getDate() + "\\" + usercode);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
        FileOutputStream fos = null;
        try {
            InputStream inputStream = fileinput.getFile();
            fos = FileUtils.instreamTooutputstream(inputStream, file + File.separator + fileinput.getFileName());
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        fos.close();
        includeJson(file.toString());
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
    public void querysAll(LogVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjsplc.dao.LogMapper.querysAll", param, offset, limit);
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
    public void deleteTheLog(LogVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjsplc.dao.LogMapper.deleteTheLog", param);
        includeJson("删除成功");
    }

    /**
     * 获取文本
     *
     * @param svo
     */
    public void modifyTheText(LogVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjsplc.dao.LogMapper.modifyTheText", map);
        includeJson(list);
    }

    /**
     * 保存编辑后的文本
     *
     * @param svo
     */
    public void saveModifyTheText(LogVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("thetext", svo.getThetext());
        map.put("svo", svo);
        delegateMapper.update("com.xalt.sjsplc.dao.LogMapper.saveModifyTheText", map);
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
    public void baseUuidUpload(UploadedFile fileinput, String logid) throws Exception {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        String usercode = this.getUserPrincipal().getUserCode();
        map.put("uuid", getUUID());
        map.put("logid", logid);
        map.put("filename", fileinput.getFileName());
        List<LogVO> list = delegateMapper.selectList("com.xalt.sjsplc.dao.LogMapper.specifyTheQuery", map);
        Vector<Object> nullVector = new Vector<>();
        nullVector.add(null);
        list.removeAll(nullVector);// 删除null元素
        if (list.isEmpty()) {
            File file = new File("D:\\JobLog" + "\\" + getDate() + "\\" + usercode);
            if (!file.exists() && !file.isDirectory()) {
                file.mkdirs();
            }
            map.put("filepath", file);
            FileOutputStream fos = null;
            InputStream inputStream = fileinput.getFile();
            fos = FileUtils.instreamTooutputstream(inputStream, file + File.separator + fileinput.getFileName());
            fos.close();
            delegateMapper.insert("com.xalt.sjsplc.dao.LogMapper.uploadAgain", map);
            delegateMapper.update("com.xalt.sjsplc.dao.LogMapper.modifyFileName", map);
            includeJson(file);
        } else {
            map.put("filepath", (list.get(0)).getFilepath());
            File file = new File(map.get("filepath").toString());
            if (!file.exists() && !file.isDirectory()) {
                file.mkdirs();
            }
            FileOutputStream fos = null;
            InputStream inputStream = fileinput.getFile();
            fos = FileUtils.instreamTooutputstream(inputStream, file + File.separator + fileinput.getFileName());
            fos.close();
            delegateMapper.insert("com.xalt.sjsplc.dao.LogMapper.uploadAgain", map);
            delegateMapper.update("com.xalt.sjsplc.dao.LogMapper.modifyFileName", map);
            includeJson(URLEncoder.encode(file.toString(), "UTF-8"));
        }
    }

    /**
     * 删除附件
     *
     * @param svo
     */
    public void deleteTheAttachment(LogVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.delete("com.xalt.sjsplc.dao.LogMapper.deleteTheAttachment", param);
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
    public void getUploadedFile(LogVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjsplc.dao.LogMapper.getUploadedFile", param, offset, limit);
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
    public void queryFilePath(LogVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjsplc.dao.LogMapper.queryFilePath", map);
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

    /**
     * 当前登录用户
     */
    public void currentLoginUser() {
        String usercode = this.getUserPrincipal().getUserCode();
        includeJson(usercode);
    }

    /**
     * 使用POI生成导出Excel
     *
     * @param svo
     * @throws Exception
     */
    public Download exportExcel(LogVO svo, HttpServletResponse response) throws Exception {
        List<HashMap<String, Object>> listMap = new ArrayList<>();
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List listData = delegateMapper.selectList("com.xalt.sjsplc.dao.LogMapper.exportCountAll", param);
        if (listData.size() > 65000) {
            includeJson("所要导出的数据量不得大于65536，解释权归开发者所有！");
            return null;
        }

        for (Object obj : listData) {
            Map map = (Map) obj;
            HashMap<String, Object> dataMap = new HashMap<>();
            dataMap.put("USERNAME", map.get("USERNAME"));
            dataMap.put("THEME", map.get("THEME"));
            dataMap.put("OPERATINGTIME", map.get("OPERATINGTIME"));
            listMap.add(dataMap);
        }

        String title = "tableName";
        String[] rowsName = new String[]{"序号", "用户", "主题", "任务时间"};
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] objs = null;
        for (int i = 0; i < listMap.size(); i++) {
            HashMap<String, Object> data = listMap.get(i);
            objs = new Object[rowsName.length];
            objs[0] = i;
            objs[1] = data.get("USERNAME");
            objs[2] = data.get("THEME");
            objs[3] = data.get("OPERATINGTIME");

            dataList.add(objs);
        }
        ExportExcel ex = new ExportExcel(title, rowsName, dataList);
        return ex.export(response);
    }

    /**
     * 开发者日志工作类型 (类型菜单)
     */
    public void jobCategory() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjsplc.dao.LogMapper.jobCategory");
        includeJson(vo);
    }
}
