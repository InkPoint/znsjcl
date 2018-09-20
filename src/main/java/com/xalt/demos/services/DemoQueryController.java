package com.xalt.demos.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.model.DemoQueryVo;

import java.util.Map;

/**
 * Created by Administrator on 2018/6/25.
 */
@Controller
public class DemoQueryController extends WebServiceSupport {


    @NoLoginValidate
    public void initinfo(){
    }
    // 基本分页查询
    @NoLoginValidate
    public void list(DemoQueryVo svo, int limit, int offset){
        if(svo == null){
            svo = new DemoQueryVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.demos.dao.DemoQueryMapper.selectAll", param,offset,limit);
        includeJson(vo);
    }

    //查询满足条件的纳税人个数
    @NoLoginValidate
    public  void selectNum(DemoQueryVo svo){
        if (svo == null){
            svo = new DemoQueryVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        int  num =(int)delegateMapper.selectOne("com.xalt.demos.dao.DemoQueryMapper.selectNum", param);
        includeJson(num);
    }

}
