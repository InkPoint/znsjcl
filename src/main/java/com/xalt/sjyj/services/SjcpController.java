package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjcpVO;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.*;

/**
 * Created by win7 on 2018/1/2.
 */
@Controller
public class SjcpController  extends WebServiceSupport{
    @Inject
    private Logger logger;
    //数据产品页面

    public void initsjcp(){}
    //数据产品表基本的分页查询

    public void list(SjcpVO svo,int limit, int offset, String sort, String order ){
        logger.debug("limit---->"+limit);
        logger.debug("offset---->"+offset);
        logger.debug("sort---->"+sort);
        logger.debug("order---->"+order);
        if(svo == null){
            svo = new SjcpVO();
        }
        logger.debug("svo---->"+svo);
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.SjcpMapper.selectList", param, limit, offset);
        Map<String,Object> results = new HashMap<String,Object>();
        results.put("total",vo.getPageCount());
        results.put("rows",vo.getRows());
        includeJson(vo);
    }
    //查看 分页

    public void viewList(SjcpVO svo,int limit, int offset, String sort, String order){
        logger.debug("limit---->"+limit);
        logger.debug("offset---->"+offset);
        logger.debug("sort---->"+sort);
        logger.debug("order---->"+order);
        if(svo == null){
            svo = new SjcpVO();
        }
        logger.debug("svo---->"+svo);
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.SjcpMapper.viewList", param, limit, offset);
        Map<String,Object> results = new HashMap<String,Object>();
        results.put("total",vo.getPageCount());
        results.put("rows",vo.getRows());
        includeJson(vo);
    }
    //对产品的列进行操作

    public void colmujson(SjcpVO svo){
        String cpbt = svo.getCpbt();//英文表头
        String cpbtzw = svo.getCpbtzw(); //中文表头
        List<String> cpbts = Arrays.asList(cpbt.toUpperCase().split(","));
        List<String> cpbtzws = Arrays.asList(cpbtzw.split("，"));
        List<Map> results =new ArrayList<Map>();

        if(cpbts.size()==cpbtzws.size()){
            for(int i=0;i<cpbts.size();i++){
                Map<String,Object> rows = Maps.newHashMap();
                rows.put("field",cpbts.get(i));
                rows.put("align","center");
                rows.put("title",cpbtzws.get(i));
                results.add(rows);
            }

        }
        else{
            includeJson("中文表头与英文表头不对应");
        }

        includeJson(results);
    }

}
