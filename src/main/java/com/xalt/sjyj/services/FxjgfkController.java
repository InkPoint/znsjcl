package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.FxjgdcVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by win7 on 2017/12/8.
 * 分析结果反馈
 * User:CuiHeng
 */
@Controller
public class FxjgfkController extends WebServiceSupport {

    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initFxjgfk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"分析结果反馈",this.getUserPrincipal().getUserCode(),"sjyj/fxjgfk/initFxjgfk");
        }catch (Exception e){

        }
    }

    //基本分页查询

    public void selectList(FxjgdcVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new FxjgdcVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxjgdcMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //基本分页查询

    public void selectDetails(FxjgdcVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new FxjgdcVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //先查询出查询路径
        String sjcxlj = (String) delegateMapper.selectOne("com.xalt.sjyj.dao.FxjgfkMapper.selectSjcxlj", param);
        log.debug("数据查询路径："+sjcxlj);
        //查询数据
        PaginatedVO vo = delegateMapper.selectPaginated(sjcxlj, param, offset, limit);
        includeJson(vo);
    }

    //征收分局（下拉列表）

    public void selectzsfj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectfj");
        includeJson(vo);
    }

    //税务管理科所查询(下拉列表)

    public void selectKs(FxjgdcVo svo){
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectKs",param);
        includeJson(vo);
    }

    //下发批次（下拉列表）

    public void selectXfpc() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectXfpc");
        includeJson(vo);
    }

    //分析大类（下拉列表）

    public void selectFxdl() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectFxdl");
        includeJson(vo);
    }

    //分析小类（下拉列表）

    public void selectFxxl() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectFxxl");
        includeJson(vo);
    }

    //税务管理科所（下拉列表）

    public void selectSwglks(){
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectSwglks");
        includeJson(vo);
    }

    //模态框反馈意见

    public void updatefxjg(FxjgdcVo svo){
        if(svo == null){
            svo = new FxjgdcVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.FxjgfkMapper.updatefxjg", param);
        includeJson("修改成功!");
    }


}
