package com.pub.dic.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 17-1-16.
 * 根据机构代码查询专管员
 */
@Controller
public class TaxofficeCodeController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initTaxofficeCode(){

    }

    @NoLoginValidate
     public void selectByOrgCode(String orgCode){
        DelegateMapper delegateMapper = getMapper();

        if( orgCode != null &&  !"00".equals(orgCode.substring(9, 11)) ){
            //所级
            orgCode = "";
        }

        log.debug("orgCode==" + orgCode);
        Map<String, Object> map = Maps.newHashMap();
        map.put("orgCode", orgCode);

        List lt = delegateMapper.selectList("com.pub.dic.dao.TaxofficeCodeMapper.selectByOrgCode", map);

        includeJson(lt);
    }
}
