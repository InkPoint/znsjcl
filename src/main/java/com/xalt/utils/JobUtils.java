package com.xalt.utils;

/**
 * Created by win7 on 2017/11/23.
 * job执行任务相关静态数据
 */
public class JobUtils {

    //每天执行一次
    public static final String everyday = "sysdate+1";
    //每周一凌晨2点执行
    public static final String perweek = "TRUNC(next_day(sysdate,1))+2/24";
    //每月一日凌晨1点执行
    public static final String amonth = "TRUNC(LAST_DAY(sysdate)+1)";
    //季度的第一天凌晨0点执行
    public static final String everyquarter = "TRUNC(ADD_MONTHS(SYSDATE,3),''q'')";
}
