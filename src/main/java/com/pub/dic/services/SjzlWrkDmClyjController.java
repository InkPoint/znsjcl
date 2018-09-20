package com.pub.dic.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 17-1-11.
 * 处理意见字典表
 */
@Controller
public class SjzlWrkDmClyjController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initSjzlWrkDmClyj(){

    }

    @NoLoginValidate
    public void selectAll(){
        DelegateMapper delegateMapper = getMapper();

        List lt = delegateMapper.selectList("com.pub.dic.dao.SjzlWrkDmClyjMapper.selectAll");

        includeJson(lt);
    }
}
