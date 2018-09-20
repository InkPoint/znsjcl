package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import org.slf4j.Logger;

import javax.inject.Inject;

/**
 * 自定义分析模型
 * Created by cuiheng on 2018/4/20.
 */
@Controller
public class ZdyfxmxController extends WebServiceSupport {

    @Inject
    private Logger log;

    @NoLoginValidate
    public void initZdyfxmx(){

    }
}
