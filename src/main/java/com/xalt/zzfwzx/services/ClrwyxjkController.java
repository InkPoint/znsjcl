package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.zzfwzx.model.ClrwyxjkVo;
import com.xalt.sjzd.model.SjdxglVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/4/12.
 * 自助服务中心-处理任务运行监控
 */
@Controller
public class ClrwyxjkController extends WebServiceSupport{
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initClrwyxjk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—处理任务运行监控",this.getUserPrincipal().getUserCode(),"zzfwzx/clrwyxjk/initClrwyxjk");
        }catch (Exception e){

        }
    }

    //查看数据
    @NoLoginValidate
    public void initViewthedata() {
    }

    // (处理任务运行监控)表信息查询
    @NoLoginValidate
    public void selectAll(ClrwyxjkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new ClrwyxjkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.ClrwyxjkMapper.selectAll", param, offset, limit);
        includeJson(vo);
    }

    //获取Model中的bootstrap-table表列名
    @NoLoginValidate
    public void getheader(SjdxglVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询列名
        List header = mapper.selectList("com.xalt.zzfwzx.dao.ClrwyxjkMapper.viewdata", param);
        includeJson(header);
    }

    // 动态获取Model中的bootstrap-table表数据
    @NoLoginValidate
    public void viewthedata(SjdxglVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //获取表数据信息
        PaginatedVO alldatas = mapper.selectPaginated("com.xalt.sjzd.dao.SjdxglMapper.querytab", param, offset, limit);
        includeJson(alldatas);
    }

    // 已匹配数据查看
    @NoLoginValidate
    public void thematched(SjdxglVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查看该表中是否存在该列
        List checkcolumn = mapper.selectList("com.xalt.zzfwzx.dao.ClrwyxjkMapper.checkcolumn", param);
        if (checkcolumn != null && checkcolumn.size() > 0) {
            //获取表数据信息
            PaginatedVO alldatasa = mapper.selectPaginated("com.xalt.zzfwzx.dao.ClrwyxjkMapper.thematcheda", param, offset, limit);
            includeJson(alldatasa);
        } else {
            PaginatedVO alldatasb = mapper.selectPaginated("com.xalt.zzfwzx.dao.ClrwyxjkMapper.thematchedb", param, offset, limit);
            includeJson(alldatasb);
        }
    }

    // 未匹配数据查看
    @NoLoginValidate
    public void didNotMatch(SjdxglVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查看该表中是否存在该列
        List checkcolumn = mapper.selectList("com.xalt.zzfwzx.dao.ClrwyxjkMapper.checkcolumn", param);
        if (checkcolumn != null && checkcolumn.size() > 0) {
            //获取表数据信息
            PaginatedVO alldatasa = mapper.selectPaginated("com.xalt.zzfwzx.dao.ClrwyxjkMapper.didnotmatcha", param, offset, limit);
            includeJson(alldatasa);
        } else {
            PaginatedVO alldatasbb = mapper.selectPaginated("com.xalt.zzfwzx.dao.ClrwyxjkMapper.didnotmatchb", param, offset, limit);
            includeJson(alldatasbb);
        }
    }
}
