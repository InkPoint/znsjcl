package com.ts.acl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.acl.model.*;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-10-19
 *
 * user controller
 */
@Controller
public class BasicinfoController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initBasicinfo(){
    }


    // 分页查询纳税人基本信息
    @NoLoginValidate
    public void list(Basicinfo svo, int page, int rows, String sort, String order){

        log.debug("page---->"+page);
        log.debug("rows---->"+rows);
        log.debug("sort---->"+sort);
        log.debug("order---->"+order);
        if(svo == null){
            svo = new Basicinfo();
        }else{
            log.debug("taxpayerbasicinfo-------->"+svo.getTaxpayername());
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        PaginatedVO vo = delegateMapper.selectPaginated("com.ts.acl.dao.BasicinfoMapper.selectAll", param, page, rows);
        log.debug("PaginatedVO {}: {}", page, vo);
        includeJson(vo);

    }

}
