package com.xalt.main.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.main.model.PermissionVO;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/6/25.
 */
@Controller
public class PermissionconfigController extends WebServiceSupport {
    @Inject
    private Logger logger;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initqxkz(){

    }
    @NoLoginValidate
    public void selectry(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.main.dao.permissionconfig.selectry");
        includeJson(vo);
    }

    @NoLoginValidate
    public void selectmk(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.main.dao.permissionconfig.selectmk");
        includeJson(vo);
    }

    @NoLoginValidate
    public void selectgn(PermissionVO svo){
        if(svo == null){
            svo = new PermissionVO();
        }
        Map<String,Object> param = new HashMap<>();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.main.dao.permissionconfig.selectgn",param);
        includeJson(vo);
    }
    @NoLoginValidate
    public void selectlist(PermissionVO svo,int limit, int offset, String sort, String order){
        if(svo == null){
            svo = new PermissionVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = new HashMap<>();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.main.dao.permissionconfig.selectlist",param,offset, limit);
        includeJson(vo);
    }
    @NoLoginValidate
    public void updatetab(String qxids){
        DelegateMapper delegateMapper = getMapper();
        String qxid = qxids.substring(1,qxids.length()-1);
        String [] myqxid = qxid.split(",");
        for(int i = 0;i<myqxid.length;i++){
            Map<String,Object> param = new HashMap<>();
            param.put("qxids",myqxid[i].substring(1,myqxid[i].length()-1));
            delegateMapper.update("com.xalt.main.dao.permissionconfig.updatetab",param);
        }

        includeJson("yes");
    }
    @NoLoginValidate
    public void selectwfplist(PermissionVO svo,int limit, int offset, String sort, String order){
        if(svo == null){
            svo = new PermissionVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = new HashMap<>();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.main.dao.permissionconfig.selectwfplist",param,offset, limit);
        includeJson(vo);
    }
    @NoLoginValidate
    public void inserttab(String menuids,String usercode){
        String addusercode = this.getUserPrincipal().getUserCode();
        DelegateMapper delegateMapper = getMapper();
        String menuid = menuids.substring(1,menuids.length()-1);
        String [] mymenuid = menuid.split(",");
        for(int i = 0;i<mymenuid.length;i++){
            Map<String,Object> param = new HashMap<>();
            String mnuid=mymenuid[i].substring(1,mymenuid[i].length()-1);
            String models=mnuid.split("_")[1];
            param.put("menuid",mnuid);
            param.put("usercode",usercode);
            param.put("mainmenuid",models);
            param.put("addusercode",addusercode);
            delegateMapper.insert("com.xalt.main.dao.permissionconfig.inserttab",param);
        }

        includeJson("yes");
    }

}
