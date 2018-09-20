package com.xalt.demos.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-1
 * Time: 下午3:11
 */
public class JsonObjectToJava {

    /*
    *
    *  根据JSONArrayString 获取到List
    *
    *
    * */
    public static <T>List<T> getListByArray(Class<T> class1,String jarraystr){
        List<T> list=new ArrayList<>();
        JSONArray jsonArray=JSONArray.parseArray(jarraystr);
        if(jsonArray==null||jsonArray.isEmpty()){
            return list;
        }
        for(Object obj:jsonArray){
            JSONObject jsonObject=(JSONObject)obj;
            T t=JSONObject.toJavaObject(jsonObject,class1);
            list.add(t);
        }
        return list;
    }

    /*
    * 根据List获取到对应的JSONArray
    *
    * */
    public static JSONArray getJSONArrayByList(List<?> list){
        JSONArray jsonArray=new JSONArray();
        if(list==null||list.isEmpty()){
            return jsonArray;
        }
        for(Object obj:list){
            jsonArray.add(obj);
        }
        return jsonArray;
    }
}
