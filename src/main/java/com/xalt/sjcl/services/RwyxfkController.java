package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RwyxfkVo;
import com.xalt.sjjh.model.RwssfkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by CuiHeng on 2018/1/31.
 * 任务运行反馈
 */

@Controller
public class RwyxfkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initRwyxfk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"任务实施反馈",this.getUserPrincipal().getUserCode(),"sjcl/rwyxfk/initRwyxfk");
        }catch (Exception e){

        }
    }

    //默认基本分页信息查询

    public void list(RwyxfkVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new RwyxfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RwyxfkMapper.selectlist",param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //下载管理

    public Download dowload(String savepath) throws FileNotFoundException {
        //原始文件目录
        String fullName = "D:\\uploadfiles/"+savepath;
        File file = new File(fullName);
        String contentType = ".*"; //所有文件类型
        return new FileDownload(file,contentType);
    }

}
