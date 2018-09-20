package com.xalt.utils;

import com.ts.persistence.dao.DelegateMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 18-5-17
 * Time: 上午10:44
 */
public class CharCloudyUtil {
    //插入字符云数据
    public void addCloudydata(DelegateMapper mapper,String cloudyname,String usercode,String urls) throws  Exception{
          if(mapper!=null){
              Map<String,Object> map=new HashMap<>();
              map.put("cloudyname",cloudyname);
              map.put("usercode",usercode);
              map.put("urls",urls);
              mapper.insert("com.xalt.main.dao.MainsMapper.addcloudydata",map);
          }
    }

}
