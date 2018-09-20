package com.xalt.main.model;

import com.google.common.collect.Lists;
import java.util.List;

/**
 *   echarts图基本实体类
 */

public class BaseChartVo {
    /**
      *   图形维度集合
     */
    private List datasources;

    /**
     *   图形维度集合 即x轴数据
     */
    private List xdatas;

    /**
     *    图形指标分类
     */
    private List<ChartSeriesVo> datas= Lists.newArrayList();


    public List getDatasources() {
        return datasources;
    }

    public void setDatasources(List datasources) {
        this.datasources = datasources;
    }

    public List getXdatas() {
        return xdatas;
    }

    public void setXdatas(List xdatas) {
        this.xdatas = xdatas;
    }

    public List<ChartSeriesVo> getDatas() {
        return datas;
    }

    public void setDatas(List<ChartSeriesVo> datas) {
        this.datas = datas;
    }


    public void addDatas(ChartSeriesVo datas) {

        this.datas.add(datas);
    }

}