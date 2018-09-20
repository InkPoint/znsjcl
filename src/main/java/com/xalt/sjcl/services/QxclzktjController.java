package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.QxclzktjVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;
import javax.inject.Inject;
import java.util.Map;

/**
 * Created by win7 on 2017/11/29.
 * 清洗处理状况统计
 */
@Controller
public class QxclzktjController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initQxclzktj() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"清洗处理状况统计",this.getUserPrincipal().getUserCode(),"sjcl/qxclzktj/initQxclzktj");
        }catch (Exception e){

        }
    }


    // (清洗处理状况统计)表信息查询

    public void selectAll(QxclzktjVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new QxclzktjVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxclzktjMapper.selectAll", param,offset,limit);
        includeJson(vo);
    }
    //实时数据更新

    public void ssgxsj(){
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.selectList("com.xalt.sjcl.dao.QxclzktjMapper.ssgxsj");
        includeJson("执行成功");
    }

}
