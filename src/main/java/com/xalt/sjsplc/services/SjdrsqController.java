package com.xalt.sjsplc.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjsplc.model.SjdrsqVo;
import com.xalt.sjsplc.model.SqlogVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjdxglVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.FileUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/10/23.
 * 申请审批
 * User:cuiheng
 */

@Controller
public class SjdrsqController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;



    public void initSjdrsq() {
    }

    //申请

    public void initSjsq() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"业务申请",this.getUserPrincipal().getUserCode(),"sjsplc/sjdrsq/initSjsq");
        }catch (Exception e){

        }
    }

    //审核

    public void initSjsh() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"业务审批",this.getUserPrincipal().getUserCode(),"sjsplc/sjdrsq/initSjsh");
        }catch (Exception e){

        }
    }

    //下拉框需求分类查询

    public void selecTittle() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("clgw", this.getUserPrincipal().getOrgCode());
        List vo = mapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.selecTittle", mp);
        includeJson(vo);
    }

    //默认信息查询(申请)

    public void list(SjdrsqVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdrsqVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjsplc.dao.SjdrsqMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //默认信息查询（审核）

    public void listsh(SjdrsqVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdrsqVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("clgw", this.getUserPrincipal().getOrgCode());
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjsplc.dao.SjdrsqMapper.selectshmodel", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //申请添加及修改

    public void insertlable(SjdrsqVo svo) {
        if (svo == null) {
            svo = new SjdrsqVo();
        }
        svo.setCjr(this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        svo.setLcid(svo.getLcmc());
        param.put("svo", svo);
        if (svo.getRwid() == null || svo.getRwid().isEmpty()) {
            Map<String, Object> hjid1 = Maps.newHashMap();
            List<SjdrsqVo> list11 = delegateMapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.selectLc", param);
            SjdrsqVo minhjid1 = (SjdrsqVo) list11.get(0);
            svo.setMinhjid(minhjid1.getMinhjid());
            if (svo.getSfsh().equals("1")) {
                svo.setXyhjid("999999");
                svo.setShzt("1");
            } else if (svo.getSfsh().equals("0")) {
                int i = Integer.parseInt(svo.getMinhjid()) + 1;
                String xyhjid = Integer.toString(i);
                svo.setXyhjid(xyhjid);
                svo.setShzt("0");
            }
            hjid1.put("svo", svo);
            delegateMapper.insert("com.xalt.sjsplc.dao.SjdrsqMapper.insertlable", hjid1);
        } else {
            delegateMapper.update("com.xalt.sjsplc.dao.SjdrsqMapper.updateInformation", param);
        }
        includeJson("添加成功！");

    }

    //删除申请

    public void deleteInformation(SjdrsqVo svo) {
        if (svo == null) {
            svo = new SjdrsqVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjsplc.dao.SjdrsqMapper.deleteInformation", param);
        includeJson(svo);
    }

    //判断页面是否是审核页面

    public void judgeAudit() {
        Map<String, Object> param = Maps.newHashMap();
        SjdrsqVo svo = new SjdrsqVo();
        svo.setUserId(this.getUserPrincipal().getUserCode());
        svo.setGwid(this.getUserPrincipal().getOrgCode());
        param.put("svo", svo);
        param.put("clgw", this.getUserPrincipal().getOrgCode());
        int msg = 0;
        DelegateMapper delegateMapper = getMapper();
        List<SjdrsqVo> list = delegateMapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.selectHjidmin", param);
        //从集合中拿到最下环节id
        String ss = "";
        if (list != null && list.size() > 0) {
            msg = 0;
        } else {
            msg = 1;
        }
        includeJson(msg);
    }

    //文件审核判断标志（文件上传标志是否显示）

    public void pdscbz(String lcid) {
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.selectscbz", lcid);
        includeJson(vo);
    }

    //申请审核（环节处理）

    public void dqhjid(SjdrsqVo svo) {
        if (svo == null) {
            includeJson("审核失败，无效参数。");
        } else {
            DelegateMapper delegateMapper = getMapper();
            //判断审核标志
            Map<String, Object> cs = new HashMap<String, Object>();
            cs.put("svo", svo);
            if ("0".equals(svo.getShbz())) {
                delegateMapper.update("com.xalt.sjsplc.dao.SjdrsqMapper.updateshbz", cs);
            } else {
                //根据当前环节id查询环节表的上一环节id
                Map map = new HashMap();
                map.put("xyhjid", svo.getXyhjid());
                map.put("rwid", svo.getRwid());
                //获取上一个环节ID
                List hjlist = delegateMapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.getSyhjid", map);
                String syhjid = "";
                if (hjlist != null && hjlist.size() > 0) {
                    Map m = (Map) hjlist.get(0);
                    //下一个环节ID
                    String str = hjlist.get(0).toString();
                    syhjid = str.substring(8, str.length() - 1);
                }
                svo.setXyhjid(syhjid);
                delegateMapper.update("com.xalt.sjsplc.dao.SjdrsqMapper.updateShbtg", cs);
            }
            Map<String, Object> parm = new HashMap<String, Object>();
            parm.put("svo", svo);
            //添加日志信息
            SqlogVo sv = new SqlogVo();
            sv.setClrid(this.getUserPrincipal().getUserCode());
            sv.setClyj(svo.getShyj());
            sv.setLcid(svo.getLcid());
            sv.setHjid(svo.getHjid());
            sv.setRwid(svo.getRwid());
            parm.put("svo1", sv);
            delegateMapper.insert("com.xalt.sjsplc.dao.SjdrsqMapper.addlogs", parm);
            includeJson("审核成功");
        }
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String rwmc1) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjdrsqVo svo = new SjdrsqVo();
        svo.setRwmc(rwmc1);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjsplc.dao.SjdrsqMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

    //文件上传

    public void uploadfileinput(UploadedFile fileinput) throws Exception {
        //读取流
        InputStream inputStream = fileinput.getFile();
        //创建文件临时目录
        final String allowFileSuffix = "xls";
        long currentMillis = System.currentTimeMillis();
        String fileExt = fileinput.getFileName().substring(fileinput.getFileName().lastIndexOf("."));
        String newFileName = currentMillis + fileExt;
        String fileName = fileinput.getFileName();
        String basePath = "D:/uploadfiles";
        File tmpDir = new File(basePath);
        if (!tmpDir.exists()) {
            //建立多级文件夹
            tmpDir.mkdirs();
        }
        //字节输出流
        //File.separator 用于不同系统下路径的问题
        FileOutputStream fos = FileUtils.instreamTooutputstream(inputStream, basePath + File.separator + fileName);
        fos.close();
        includeJson("上传成功!");

    }

    //下载管理

    public Download dowload(HttpServletResponse response, String wjmc) throws Exception {
        response.setContentType("application/octet-stream");
        String newFileName = URLEncoder.encode(wjmc,"UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename="+newFileName);
        //原始文件目录
        String fullName = "D:\\uploadfiles\\" + wjmc;
        File file = new File(fullName);
        String contentType = ".*"; //所有文件类型
        return new FileDownload(file, contentType, newFileName);

    }



    // 导出

    public void exportData(SjdxglVo svo,String filename){
        DelegateMapper delegateMapper = getMapper();
        if (svo == null) {
            svo = new SjdxglVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List lists=delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.exportData",param);
        List sjxxx=delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjxinfo",param);
        if(sjxxx!=null&&sjxxx.size()>0){
            String[] title=new String[sjxxx.size()];
            String[] columns=new String[sjxxx.size()];
            for(int i=0;i<sjxxx.size();i++){
                SjxVo vo=(SjxVo)sjxxx.get(i);
                title[i]=vo.getSjxmczw();
                columns[i]=vo.getSjxmcyw();
            }
            try{
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns, filename);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

}