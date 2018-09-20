package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjcpcxtjVO;
import com.xalt.sjyj.model.SjcpztVO;
import com.xalt.sjyj.model.SjyjVO;
import com.xalt.sjzd.model.DymicVO;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.*;

/**
 * Created by liduo on 2018/1/8.
 */
@Controller
public class SjcpztController extends WebServiceSupport {
    @Inject
    private Logger logger;

    //初始化参数
    //初始化页面数据产品主题

    public void initsjcpzt() {
    }

    //具体的数据产品

    public void initsjcpztxz() {
    }

    //产品主题的基本查询

    public void cpztlist(SjcpztVO svo) {
        if (svo == null) {
            svo = new SjcpztVO();
        }
        logger.debug("svo---->" + svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.cpztlist", param);
        includeJson(vo);
    }

    //对于数据产品所具有数据元件的查询

    public void sjyjlist(SjcpztVO svo) {
        if (svo == null) {
            svo = new SjcpztVO();
        }
        logger.debug("svo---->" + svo);
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.sjyjlist", param);
        includeJson(vo);
    }

    //添加数据元件的弹出条件

    public void addsjyj(SjyjVO svo) {
        if (svo == null) {
            svo = new SjyjVO();
        }
        logger.debug("svo---->" + svo);
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        //获取对应的添加的列表
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.addsjyj", param);
        logger.debug("vo----->" + vo);
        Map<String, Object> alldata = new HashMap<>();
        alldata.put("vo", vo);
        List<List> sellist = new ArrayList<List>();
        //判断数据类型
        SjyjVO result = new SjyjVO();
        for (int i = 0; i < vo.size(); i++) {
            result = (SjyjVO) vo.get(i);
            //参数类型
            String cslx = result.getCslx();
            //下拉框
            if ("DM".equals(cslx)) {
                Map<String, Object> selmap = new HashMap<>();
                String dmb = result.getDmb();//代码表
                String dmbmczd = result.getDmbmczd();//代码表字段id
                String sjcsdmzdm = result.getSjcsdmzdm();//字段名称
                selmap.put("dmb", dmb);
                selmap.put("dmbmczd", dmbmczd);
                selmap.put("sjcsdmzdm", sjcsdmzdm);
                List cslist = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.cslist", selmap);
                sellist.add(cslist);
            }
        }
        alldata.put("sellist", sellist);
        includeJson(alldata);
    }

    //主题元件中isdefault是Y的数据元件的表头

    public void yjbtlist(SjcpztVO svo) {
        logger.debug("svo---->" + svo);
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.yjbtlist", param);
        includeJson(vo);
    }

    //查询条件 所属机关中分局的下拉框

    public void ssfjlist() {
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.ssfjlist");
        includeJson(vo);
    }

    //查询条件 所属机关中科所的下拉框

    public void sskslist(SjcpcxtjVO svo) {
        logger.debug("svo---->" + svo);
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.sskslist", param);
        includeJson(vo);
    }

    //纳税人状态下拉框

    public void nsrztlist() {
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.nsrztlist");
        includeJson(vo);
    }

    //调用存储过程

    public void callpro(SjcpcxtjVO svo) {
        logger.debug("svo---->" + svo);
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.callpro", param);
        includeJson("yes");
    }

    /**
     * 根据元件ID 查询元件信息
     *
     * @param svo
     */

    public void queryByID(SjcpcxtjVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.queryByID", param);
        includeJson(vo);
    }

    /**
     * 元件列名
     *
     * @param svo
     */

    public void getHeader(SjcpcxtjVO svo) {
        DelegateMapper mapper = getMapper();
        List<String> result = Arrays.asList(svo.getProducetheproduct().split(","));
        List columns = new ArrayList();
        List<String> colums = new ArrayList<String>();
        if (result != null && result.size() > 0) {
            for (int k = 0; k < result.size(); k++) {
                //查询列
                List header = mapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.getHeader", result.get(k));
                for (int i = 0; i < header.size(); i++) {
                    Map m = (Map) header.get(i);
                    //获取表头中文
                    String zw = m.get("TITLE") == null ? "" : m.get("TITLE").toString();
                    //获取表头英文
                    String yw = m.get("FIELD") == null ? "" : m.get("FIELD").toString();
                    //jsp需要的数据
                    DymicVO vo = new DymicVO();
                    vo.setTitle(zw);
                    //判断列信息中有没有数据
                    if (colums != null && colums.size() > 0) {
                        //查看有没有重复数据
                        int flags = 0;
                        for (int r = 0; r < colums.size(); r++) {
                            String ma = colums.get(r).toString();
                            String macopy = "";
                            if (ma.indexOf(".") == -1) {
                                macopy = ma;
                            } else {
                                macopy = ma.split("\\.")[1];
                            }
                            if (macopy.equals(yw)) {
                                flags = 1;
                                vo.setField((yw + k + "").toUpperCase());
                                continue;
                            }
                        }
                        //如果没有找到重复的列
                        if (flags == 0) {
                            vo.setField((yw).toUpperCase());
                        }
                    } else {
                        vo.setField((yw).toUpperCase());
                    }
                    columns.add(vo);//前台列信息
                }

            }
        }
        includeJson(columns);
    }

    /**
     * 元件信息
     *
     * @param svo
     */

    public void produceTheProduct(SjcpcxtjVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        List<String> result = Arrays.asList(svo.getProducetheproduct().split(","));
        String columnstr = "";
        String tabstr = "(select t.nsrsbh,t.nsrmc,to_char(t.djxh) djxh,t.ZGSWJ_DM fj,t.ZGSWSKFJ_DM ks,t.NSRZT_DM nsrzt  from zh_dj_nsrxx   t  ) a  ";
        String conditions = "";
        List columns = new ArrayList();
        List<String> colums = new ArrayList<String>();
        if (result != null && result.size() > 0) {
            for (int k = 0; k < result.size(); k++) {
                //添加表参数信息
                tabstr = tabstr + "," + result.get(k).toString() + " a" + k;
                //添加条件信息
                conditions = conditions + " and  a.djxh=a" + k + ".djxh";
                //查询列
                List header = mapper.selectList("com.xalt.sjyj.dao.SjcpztMapper.getHeader", result.get(k));
                for (int i = 0; i < header.size(); i++) {
                    Map m = (Map) header.get(i);
                    //获取表头中文
                    String zw = m.get("TITLE") == null ? "" : m.get("TITLE").toString();
                    //获取表头英文
                    String yw = m.get("FIELD") == null ? "" : m.get("FIELD").toString();
                    //jsp需要的数据
                    DymicVO vo = new DymicVO();
                    vo.setTitle(zw);

                    String mycolumns = "";

                    //判断列信息中有没有数据
                    if (colums != null && colums.size() > 0) {
                        //查看有没有重复数据
                        int flags = 0;
                        for (int r = 0; r < colums.size(); r++) {
                            String ma = colums.get(r).toString();
                            String macopy = "";
                            if (ma.indexOf(".") == -1) {
                                macopy = ma;
                            } else {
                                macopy = ma.split("\\.")[1];
                            }
                            if (macopy.equals(yw)) {
                                flags = 1;
                                //如果总的列集合信息中包含相同列key值 那么重命名列名
                                mycolumns = "a" + k + "." + yw + " " + yw + k;
                                vo.setField((yw + k + "").toUpperCase());
                                continue;
                            }
                        }
                        //如果没有找到重复的列
                        if (flags == 0) {
                            mycolumns = "a" + k + "." + yw;
                            vo.setField(("a" + k + "." + yw).toUpperCase());
                        }
                    } else {
                        mycolumns = "a" + k + "." + yw;
                        vo.setField(("a" + k + "." + yw).toUpperCase());
                    }
                    columns.add(vo);//前台列信息
                    colums.add(mycolumns);
                }

            }
        }

        //将列集合数据拼接成sql语句的展示列信息
        for (String aa : colums) {
            if (columnstr == null || "".equals(columnstr)) {
                columnstr = aa;
            } else {
                columnstr = columnstr + "," + aa;
            }
        }
        //分局条件
        String fj="";
        if(svo.getDjjgdm()!=null&&!"".equals(svo.getDjjgdm())){
            fj=" and a.fj='"+svo.getDjjgdm()+"'";
        }
        //科所条件
        String ks="";
        if(svo.getZgswskfjdm()!=null&&!"".equals(svo.getZgswskfjdm())){
            ks=" and a.ks='"+svo.getZgswskfjdm()+"'";
        }

        //纳税人状态
        String nsrzt="";
        if(svo.getNsrztdm()!=null&&!"".equals(svo.getNsrztdm())){
            nsrzt=" and a.nsrzt=trim('"+svo.getNsrztdm()+"')";
        }
        //组合最终sql
        String lastsql = "select " + columnstr + " from " + tabstr + " where 1=1 " +conditions+ fj+ ks + nsrzt;
        logger.debug("lastsql:"+lastsql);
        Map<String, Object> param = Maps.newHashMap();
        param.put("lastsql", lastsql);//产品SQL
//        param.put("djjgdm", svo.getDjjgdm());//所属机关代码
//        param.put("zgswskfjdm", svo.getZgswskfjdm());//所属科所代码
//        param.put("nsrztdm", svo.getNsrztdm());//纳税人状态代码
        PaginatedVO header = mapper.selectPaginated("com.xalt.sjyj.dao.SjcpztMapper.queryinfos", param, offset, limit);
        includeJson(header);
    }
}
