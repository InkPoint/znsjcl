package com.xalt.utils;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.xalt.main.model.BaseChartVo;
import com.xalt.main.model.ChartSeriesVo;
import org.slf4j.Logger;

import java.util.List;
import java.util.Map;

/**
 * echarts 所需要的数据结构规整
 */
public class EchartsUtils {
    private static Logger log;


    /*
     *   功能：折线图数据整合
     *   参数： querylist:查询结果  xlist:维度数据   typename:图形类型   groupcolumn  分组列 维度列  xcolumn   valuecolumn  结果列
     */

    public static String getLineData(List<String> xlist,String typename,List<Map<String,Object>> querylist,String groupcolumn,String xcolumn,String valuecolumn){
        //最终返回多个数据统计项结果(多条折线)
        BaseChartVo vo=new BaseChartVo();

        //多数据源
        List<String> datasources  = Lists.newArrayList();

        for(Map obj:querylist){
            if(groupcolumn!=null&&!datasources.contains(obj.get(groupcolumn).toString())){
                datasources.add(obj.get(groupcolumn).toString());
            }
        }

        //利用维度数据封装
        for(String datasource:datasources){
            if(datasource!=null){
                    ChartSeriesVo seriess=new ChartSeriesVo(datasource,typename);
                    for(String times:xlist){
                        float r=0f;
                        String laststr="";
                        for(Map obj:querylist){
                            String xcolumnval=obj.get(xcolumn)==null?"":obj.get(xcolumn).toString();
                            if(times!=null&&datasource.equals(obj.get(groupcolumn))&&times.equals(xcolumnval)){
                                r=r+Float.parseFloat(obj.get(valuecolumn).toString().replaceAll("G","").replaceAll("%",""));
                               // log.debug("rrrr------->"+obj.get(valuecolumn).toString());
                            }
                        }
                          seriess.addData(r);


                    }
                    vo.addDatas(seriess);
            }
        }
        //封装成对象
        vo.setDatasources(datasources);
        vo.setXdatas(xlist);

        //转化为json对象
        String jobj=JSONObject.toJSONString(vo);
        return jobj;
    }


    /*
     *   功能：折线图数据整合
     *   参数： querylist:查询结果  xlist:维度数据   typename:图形类型   groupcolumn  分组列 维度列  xcolumn   valuecolumn  结果列
     */

    public static BaseChartVo getLineDatavo(List<String> xlist,String typename,List<Map<String,Object>> querylist,String groupcolumn,String xcolumn,String valuecolumn){
        //最终返回多个数据统计项结果(多条折线)
        BaseChartVo vo=new BaseChartVo();

        //多数据源
        List<String> datasources  = Lists.newArrayList();

        for(Map obj:querylist){
            if(groupcolumn!=null&&!datasources.contains(obj.get(groupcolumn).toString())){
                datasources.add(obj.get(groupcolumn).toString());
            }
        }

        //利用维度数据封装
        for(String datasource:datasources){
            if(datasource!=null){
                ChartSeriesVo seriess=new ChartSeriesVo(datasource,typename);
                for(String times:xlist){
                    float r=0f;
                    String laststr="";
                    for(Map obj:querylist){
                        String xcolumnval=obj.get(xcolumn)==null?"":obj.get(xcolumn).toString();
                        if(times!=null&&datasource.equals(obj.get(groupcolumn))&&times.equals(xcolumnval)){
                            r=r+Float.parseFloat(obj.get(valuecolumn).toString().replaceAll("G","").replaceAll("%",""));
                            // log.debug("rrrr------->"+obj.get(valuecolumn).toString());
                        }
                    }
                    seriess.addData(r);


                }
                vo.addDatas(seriess);
            }
        }
        //封装成对象
        vo.setDatasources(datasources);
        vo.setXdatas(xlist);
        return vo;
    }


        /*
     *   功能：折线图数据整合
     *   参数： querylist:查询结果  xlist:维度数据   typename:图形类型   groupcolumn  分组列 维度列  xcolumn   valuecolumn  结果列
     */

    public static BaseChartVo getLineData1(String typename,List<Map<String,Object>> querylist,String groupcolumn,String xcolumn,String valuecolumn){
        //最终返回多个数据统计项结果(多条折线)
        BaseChartVo vo=new BaseChartVo();

        //多数据源
        List<String> datasources  = Lists.newArrayList();
        List<String> xlist  = Lists.newArrayList();

        for(Map obj:querylist){
            if(groupcolumn!=null&&!datasources.contains(obj.get(groupcolumn).toString())){
                datasources.add(obj.get(groupcolumn).toString());
                xlist.add(obj.get(xcolumn).toString());
            }
            if(xcolumn!=null&&!xlist.contains(obj.get(xcolumn).toString())){
                xlist.add(obj.get(xcolumn).toString());
            }
        }

        //利用维度数据封装
        for(String datasource:datasources){
            if(datasource!=null){
                ChartSeriesVo seriess=new ChartSeriesVo(datasource,typename);
                for(String times:xlist){
                    float r=0f;
                    String laststr="";
                    for(Map obj:querylist){
                        String xcolumnval=obj.get(xcolumn)==null?"":obj.get(xcolumn).toString();
                        if(times!=null&&datasource.equals(obj.get(groupcolumn))&&times.equals(xcolumnval)){
                            r=r+Float.parseFloat(obj.get(valuecolumn).toString().replaceAll("G","").replaceAll("%",""));
                            // log.debug("rrrr------->"+obj.get(valuecolumn).toString());
                        }
                    }
                    seriess.addData(r);


                }
                vo.addDatas(seriess);
            }
        }
        //封装成对象
        vo.setDatasources(datasources);
        vo.setXdatas(xlist);

        return vo;
    }

    //时间封装为时间段
    public static  List<String>  getTimesList(){
        List<String> timelist=Lists.newArrayList();
        for(int i=0;i<24;i++){
            if(i<10){
                timelist.add("0"+i);
            }else{
                timelist.add(""+i);
            }

        }
        return timelist;
    }

    /*
     *   功能：获取给定列集合数据
     *   参数： queryList:查询结果  columns  lengend列
     */

    public static List<String> getLegendList(String columns,List queryList){
        List<String> clumnlist=Lists.newArrayList();
        for(Object obj:queryList){
            if(obj!=null){
                Map mm=(Map)obj;
                if(!clumnlist.contains(mm.get(columns).toString())){
                    clumnlist.add(mm.get(columns).toString());
                }
            }
        }
        return clumnlist;
    }

    public static  void main(String[] args){


    }
}
