package com.xalt.demos.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;

import com.xalt.demos.model.QueryDczktjVo;
import com.xalt.sjzd.model.ExpertDataUtil;


import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/2.
 */
@Controller
public class DemoDczktjController extends WebServiceSupport {


    @NoLoginValidate
    public void initinfo(){
    }
    @NoLoginValidate
    public void demos(){
    }
    // 基本分页查询
    @NoLoginValidate
    public void list(QueryDczktjVo svo, int limit, int offset){
        if(svo == null){
            svo = new QueryDczktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.demos.dao.DemoDczktjMapper.selectAll", param,offset,limit);
        includeJson(vo);
    }

    //查询满足条件的纳税人个数
    @NoLoginValidate
    public  void selectNum(QueryDczktjVo svo){
        if (svo == null){
            svo = new QueryDczktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        int  num =(int)delegateMapper.selectOne("com.xalt.demos.dao.DemoDczktjMapper.selectNum", param);
        includeJson(num);
    }
    //导出
    @NoLoginValidate
    public void exportData(QueryDczktjVo svo,String filename){
        DelegateMapper delegateMapper = getMapper();
        if (svo == null) {
            svo = new QueryDczktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List lists=delegateMapper.selectList("com.xalt.demos.dao.DemoDczktjMapper.selectAll",param);
        String[] title={"jhid","sjl","jhsj"};
        String[] columns={"交换id","数据量","交换时间"};
            try{
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns, filename);
            }catch(Exception e){
                e.printStackTrace();
            }

//        includeJson("执行成功！");
    }

}
