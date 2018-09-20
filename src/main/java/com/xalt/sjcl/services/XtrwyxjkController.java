package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.XtrwyxjkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.Map;

/**
 * Created by win7 on 2017/11/22.
 * User:WangPengWen
 * 系统任务运行监控
 */
@Controller
public class XtrwyxjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    //系统任务运行监控

    public void initXtrwyxjk() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"系统运行任务监控",this.getUserPrincipal().getUserCode(),"sjcl/xtrwyxjk/initXtrwyxjk");
        }catch (Exception e){

        }
    }

    // (系统任务运行监控)表信息查询

    public void selectAll(XtrwyxjkVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.XtrwyxjkMapper.selectAll", param);
        includeJson(vo);
    }
}
