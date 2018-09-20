package com.xalt.main.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.alibaba.fastjson.JSON;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.main.model.BaseChartVo;
import com.xalt.utils.EchartsUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 首页数据获取
 * Modifier: PengWen Wang
 * Date: 2018-5-16
 */
@Controller
public class HomepageController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void homepage() {
        include("obj", JSON.toJSON(initlist()));
        forwardTo("../../homepage.jsp");
    }

    //数据字典
    @NoLoginValidate
    public void sjzdpage() {
        forwardTo("../../sjzdpage.jsp");
    }

    //申请审批
    @NoLoginValidate
    public void sqsppage() {
        forwardTo("../../sqsppage.jsp");
    }

    //数据交换
    @NoLoginValidate
    public void sjjhpage() {
        forwardTo("../../sjjhpage.jsp");
    }

    //数据处理
    @NoLoginValidate
    public void sjclpage() {
        forwardTo("../../sjclpage.jsp");
    }

    //数据研究
    @NoLoginValidate
    public void sjyjpage() {
        forwardTo("../../sjyjpage.jsp");
    }

    //数据加工
    @NoLoginValidate
    public void sjjgpage() {
        forwardTo("../../sjjgpage.jsp");
    }

    //自助服务中心
    @NoLoginValidate
    public void zzfwzxpage() {
        forwardTo("../../zzfwzxpage.jsp");
    }


    //首页所有数据查询
    @NoLoginValidate
    public void homelist() {
        DelegateMapper delegateMapper = getMapper();
//        查询交换数据
        List list = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.jhdata");
        List<String> xlist = EchartsUtils.getLegendList("JHSJ", list);
        BaseChartVo vo1 = EchartsUtils.getLineDatavo(xlist, "bar", list, "JHLX", "JHSJ", "SJL");
        //查询任务进度数据
        List list1 = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.rwjd");
        List rwlist = new ArrayList();
        List rwval = new ArrayList();
        for (Object obj : list1) {
            if (obj != null) {
                Map m = (Map) obj;
                rwlist.add(m.get("RWMC").toString());
                rwval.add(m.get("RWJD").toString());
            }
        }


        Map<String, Object> alldata = new HashMap<String, Object>();
        alldata.put("jhsj", vo1);
        alldata.put("rwlist", rwlist);
        alldata.put("rwval", rwval);
        includeJson(alldata);

    }

    @NoLoginValidate
    public Object initlist() {
        //查询类别数据
        DelegateMapper delegateMapper = getMapper();
        Object lbsjl = delegateMapper.selectOne("com.xalt.main.dao.HomepageMapper.lxsjl");
        return lbsjl;
    }


    @NoLoginValidate
    public void details1(int limit, int offset, String sort, String order) {
        //查询部门数据
        log.debug("limit:" + limit);
        log.debug("offset:" + offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details1", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void details2(int limit, int offset, String sort, String order) {
        //查询类别数据
        log.debug("limit:" + limit);
        log.debug("offset:" + offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details2", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void details3(int limit, int offset, String sort, String order) {
        //查询类别数据
        log.debug("limit:" + limit);
        log.debug("offset:" + offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details3", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void details4(int limit, int offset, String sort, String order) {
        //查询类别数据
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details4", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void details5(int limit, int offset, String sort, String order) {
        //查询类别数据
        log.debug("limit:" + limit);
        log.debug("offset:" + offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details5", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void details6(int limit, int offset, String sort, String order) {
        //查询类别数据
        log.debug("limit:" + limit);
        log.debug("offset:" + offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO details = delegateMapper.selectPaginated("com.xalt.main.dao.HomepageMapper.details6", "", offset, limit);
        includeJson(details);
    }

    @NoLoginValidate
    public void bmdetails() {
        //查询部门详细信息

        DelegateMapper delegateMapper = getMapper();
        List details = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.bmlinedetails");
        List<String> xlist = EchartsUtils.getLegendList("BM", details);
        BaseChartVo vo1 = EchartsUtils.getLineDatavo(xlist, "line", details, "WD", "BM", "SJL");
        includeJson(vo1);
    }

    @NoLoginValidate
    public void bmdetails1(String bmmc) {
        //查询部门下所有单位详细信息
        DelegateMapper delegateMapper = getMapper();
        Map m1 = new HashMap();
        m1.put("bmmc", bmmc);
        List details = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.bmlinedetails1", m1);
        includeJson(details);
    }

    /**
     * 外部门数据状况
     */
    @NoLoginValidate
    public void externalSectorData() {
        DelegateMapper delegateMapper = getMapper();
        List list = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.externalSectorData");
        includeJson(list);
    }

    /**
     * 当前登录的用户
     */
    @NoLoginValidate
    public void currentUserName() {
        String usercode=this.getUserPrincipal().getUserCode();;
        Map<String,Object> mm=new HashMap<String,Object>();
        mm.put("username",this.getUserPrincipal().getUserName());
        mm.put("orgname",this.getUserPrincipal().getOrgName());
        String[] aa= usercode.split("pt");
        if(aa.length==2){
            mm.put("upflages","Y");
        }else{
            mm.put("upflages","N");
        }
        mm.put("usercode",this.getUserPrincipal().getOrgName());
        includeJson(mm);
    }

    /**
     * 数据汇总（总数据量、总成功数、匹配率、部门数据量、数据类别、表数量）
     */
    @NoLoginValidate
    public void dataAggregation(){
    DelegateMapper delegateMapper=getMapper();
    List list=delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.dataAggregation");
    includeJson(list);
    }

    /**
     *数据获取（市国税、市财政、市民政、苏宁银行、国土局、水务局）
     */
    @NoLoginValidate
    public void dataAcquisition(){
        DelegateMapper delegateMapper=getMapper();
        List list=delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.dataAcquisition");
        includeJson(list);
    }

    /**
     * 热词展示
     */

    @NoLoginValidate
    public void selectRc(){
        DelegateMapper delegateMapper = getMapper();
        List list = delegateMapper.selectList("com.xalt.main.dao.HomepageMapper.selectRc");
        includeJson(list);
    }

}
