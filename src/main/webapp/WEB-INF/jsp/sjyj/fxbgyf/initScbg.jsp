<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/6/7
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>生成报告</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
</head>
<style>
    /*修改表头换行*/
    .fixed-table-container tbody td .th-inner, .fixed-table-container thead th .th-inner,tbody a ,tbody td {
        white-space: pre-wrap;
        font-size: 12px;
    }
</style>
<body>
<button id="prindID" style="float: right;margin: 10px 10px 10px" type="button" onclick="printme()" class="btn btn-info">导出</button>
<button id="returnID" style="float: right;margin: 10px 0px 10px" type="button" class="btn btn-default" onclick="window.location.href='${ctx}/sjyj/fxbgyf/initfxbgyf'">返回
</button>
<div id="printRange" style="width:800px;margin: auto">
        <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
        <p class="MsoNormal" style="text-align:center; line-height:45.0000pt; mso-line-height-rule:exactly; "><span style=" font-family:方正姚体; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:36.0000pt; mso-font-kerning:0.0000pt; ">西安市税务局</span><span style=" font-family:方正姚体; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:36.0000pt; mso-font-kerning:0.0000pt; "><o:p></o:p></span></p>
        <p class="MsoNormal" style="text-align:center; line-height:45.0000pt; mso-line-height-rule:exactly; "><span style=" font-family:方正姚体; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:36.0000pt; mso-font-kerning:0.0000pt; ">数据分析报告</span><span style=" font-family:方正姚体; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:36.0000pt; mso-font-kerning:0.0000pt; "><o:p></o:p></span></p>
        <p class="MsoNormal" style="layout-grid-mode:char; text-align:center; "><span style=" font-family:华文中宋; mso-ascii-font-family:仿宋_GB2312; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:16.0000pt; mso-font-kerning:0.0000pt; ">--------------------<font face="华文中宋">第</font></span>
        <span id="num" style=" font-family:宋体; font-weight:bold; font-size:14.5000pt; mso-font-kerning:1.0000pt; "></span><span style=" font-family:华文中宋; mso-ascii-font-family:仿宋_GB2312; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:16.0000pt; mso-font-kerning:0.0000pt; ">号<font face="仿宋_GB2312">-----------------</font></span>
        <span style=" font-family:华文中宋; mso-ascii-font-family:仿宋_GB2312; mso-hansi-font-family:宋体; color:rgb(255,0,0); font-size:16.0000pt; mso-font-kerning:0.0000pt; "><o:p></o:p></span>
    </p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
    <p class="MsoNormal" style="text-indent:31.5000pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; ">一&nbsp;分析内容</span><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="MsoNormal" style="text-indent:27.4500pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><font>税款所属期为</font>
        <font face="宋体"><input style="width: 40px;border: none;direction: rtl;" onkeyup="value=value.replace(/[^\d]/g,'')">年</font>
        <font face="宋体"><input style="width: 25px;border: none;direction: rtl;" onkeyup="value=value.replace(/[^\d]/g,'')">月至
        <font face="宋体"><input style="width: 40px;border: none;direction: rtl;" onkeyup="value=value.replace(/[^\d]/g,'')">年</font>
        <font face="宋体"><input style="width: 25px;border: none;direction: rtl;" onkeyup="value=value.replace(/[^\d]/g,'')">月的西安市局金税三期系统正常状态纳税人的疑似漏征漏缴税额分析。</font><span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span>
    </p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
    <p class="MsoNormal" style="text-indent:31.5000pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; ">二&nbsp;分析方法</span><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="MsoNormal" style="text-indent:27.4500pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; ">
            <font>内外部数据比对。取外部涉税数据（存在多个数据源头的取最大值）作为计算应征额的计税依据，取内部金税三期征收额为已征额。</font></span>
        <span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span>
    </p>
    <p class="MsoNormal" style="text-indent:27.4500pt; mso-char-indent-count:1.9600; mso-outline-level:1; ">
        <span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><font>应征额计税依据</font><font face="Times New Roman">*</font><font face="宋体">测算税率</font>
            <font face="Times New Roman">=</font><font face="宋体">应征额。</font></span>
        <span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="MsoNormal" style="text-indent:27.4500pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><font face="宋体">应征额</font>
            <font face="Times New Roman">-</font><font face="宋体">已征额</font>
            <font face="Times New Roman">&gt;</font><font face="宋体">预警值的进行风险疑点应对。</font></span>
        <span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="MsoNormal" style="text-indent:27.4500pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; ">
           <font face="宋体">本次分析预警值为<input style="width: 40px;border: none;direction: rtl;">元。</font></span>
        <span style=" font-family:宋体; font-size:14.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
    <p class="MsoNormal" style="text-indent:31.5000pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; ">三&nbsp;分析结果</span><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span>
        <span style="font-family: 宋体; font-size: 14pt;"><font>基于已处理的外部涉税数据，通过“陕西数据管税平台”风险识别应对，于</font>
            <font id="year" face="Times New Roman"></font>
            <font face="宋体">年</font><font id="upIn" face="Times New Roman">X</font><font face="宋体">月至</font>
            <font id="checkIn" face="Times New Roman">&nbsp;</font><font face="宋体">月共落实税款：</font><font id="aCombined" face="Times New Roman">&nbsp;&nbsp;</font>
            <font face="宋体">万元（统计时间：</font><font id="statisticalDate" face="Times New Roman"></font>
            <font face="宋体">），详细信息如下表所示。</font></span>
        <span style="font-family: 宋体; font-size: 14pt;"><o:p></o:p></span></p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">表一：分析落实税款统计图(分数据来源)</span>
        <span style="font-family: 宋体; font-size: 14pt;"><o:p></o:p></span></p>
    <div id="main01" style="height:400px;"></div>
    <div class="widget-body" style="height: 672px;margin-top: 30px"><table id="tableA" class="table table-striped table-bordered table-hover"></table></div>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">表二：分析落实税款统计图(分征收单位)</span><span style="font-family: 宋体; font-size: 14pt;"><o:p></o:p></span></p>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>
    <div id="main02" style="height:390px;"></div>
    <div class="widget-body">
        <table id="mytab" class="table table-striped table-bordered table-hover" data-height="885" style="white-space: nowrap;"></table>
    </div>
    <p class="NewStyle17" style="text-indent:21.0000pt; "><span style="font-family: 宋体; font-size: 14pt;">&nbsp;</span></p>

    <br>
    <p class="MsoNormal" style="text-indent:31.5000pt; mso-char-indent-count:1.9600; mso-outline-level:1; "><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; ">四&nbsp;分析建议（需要后期加强业务管理的方向）</span><span style=" font-family:黑体; mso-hansi-font-family:宋体; font-weight:bold; font-size:16.0000pt; mso-font-kerning:1.0000pt; "><o:p></o:p></span></p>
</div>
</body>
</html>
<!-- echrts 3.0-->
<script src="${ctx}/v20/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/assets/js/echarts.min.js"></script>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script>
    var ssnf = "${param.ssnf}";//所属年份
    var kjsq = "${param.kjsq}";//快捷属期
    var sqq = "${param.sqq}";//属期起
    var sqz = "${param.sqz}";//属期止
    var scsj = "${param.scsj}";//生成报告时间
    var selectid = "${param.selectid}";//快捷查询(下拉框ID)
    var myChart01 = echarts.init(document.getElementById('main01'));
    var myChart02 = echarts.init(document.getElementById('main02'));

    //图一(堆积面积图)
    $(function () {
        if (selectid == "kjcx") {
            //快捷
            $.post("${ctx}/sjyj/fxbgyf/tableA", {
                'svo.ssnf': ssnf,//所属年份
                'svo.kjsq': kjsq//根据快捷ID去查
            }, function (results) {
                tableA(results);
                var externaltaxinfname = [];//获取的外部涉税信息名称
                var taxrelated = [];//应用涉税信息增加的税收收入
                var businesstax = [];//营业税
                var companytax = [];//企业所得税
                var persontax = [];//个人所得税
                var resourcetax = [];//资源税
                var townlandtax = [];//城镇土地使用税
                var citymaintenancetax = [];//城市维护建设税
                var stampstax = [];//印花税
                var landappreciationtax = [];//土地增值税
                var housetax = [];//房产税
                var shiptax = [];//车船税
                var farmlandtax = [];//耕地占用税
                var deedtax = [];//契税
                var othertax = [];//其他税种收入
                for (var i in results) {
                    if (externaltaxinfname.length<=3){
                    externaltaxinfname.push(results[i].externaltaxinfname);						//获取的外部涉税信息名称
                    }
                    taxrelated.push(results[i].taxrelated);										//应用涉税信息增加的税收收入
                    businesstax.push(results[i].businesstax);									//营业税
                    companytax.push(results[i].companytax);										//企业所得税
                    persontax.push(results[i].persontax);										//个人所得税
                    resourcetax.push(results[i].resourcetax);									//资源税
                    townlandtax.push(results[i].townlandtax);									//城镇土地使用税
                    citymaintenancetax.push(results[i].citymaintenancetax); 	                //城市维护建设税
                    stampstax.push(results[i].stampstax);										//印花税
                    landappreciationtax.push(results[i].landappreciationtax);                   //土地增值税
                    housetax.push(results[i].housetax);											//房产税
                    shiptax.push(results[i].shiptax);											//车船税
                    farmlandtax.push(results[i].farmlandtax);									//耕地占用税
                    deedtax.push(results[i].deedtax);											//契税
                    othertax.push(results[i].othertax);											//其他税种收入
                    num=num+parseInt(results[i].taxrelated);                                    //税收合计
                }
                var option01 = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['应用涉税信息增加的税收收入', '营业税', '企业所得税', '个人所得税', '资源税', '城镇土地使用税', '城市维护建设税', '印花税', '土地增值税', '房产税', '车船税', '耕地占用税', '契税', '其他税种收入']
                    },
                    calculable: true,
                    xAxis: [
                        {
                            axisLabel: {
                                textStyle: {
                                    fontSize: 12//设置字体大小
                                }
                            },
                            type: 'category',
                            boundaryGap: false,
                            data: externaltaxinfname
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            max:function(value){
                                return value.max / 2;
                            }
                        }
                    ],
                    series: [
                        {
                            name: '应用涉税信息增加的税收收入(万元)',
                            type: 'line',
                            stack: '总量',
                            data: taxrelated,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '营业税',
                            type: 'line',
                            stack: '总量',
                            data: businesstax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '企业所得税',
                            type: 'line',
                            stack: '总量',
                            data: companytax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '个人所得税',
                            type: 'line',
                            stack: '总量',
                            data: persontax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '资源税',
                            type: 'line',
                            stack: '总量',
                            data: resourcetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '城镇土地使用税',
                            type: 'line',
                            stack: '总量',
                            data: townlandtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '城市维护建设税',
                            type: 'line',
                            stack: '总量',
                            data: citymaintenancetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '印花税',
                            type: 'line',
                            stack: '总量',
                            data: stampstax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '土地增值税',
                            type: 'line',
                            stack: '总量',
                            data: landappreciationtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '房产税',
                            type: 'line',
                            stack: '总量',
                            data: housetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '车船税',
                            type: 'line',
                            stack: '总量',
                            data: shiptax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '耕地占用税',
                            type: 'line',
                            stack: '总量',
                            data: farmlandtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '契税',
                            type: 'line',
                            stack: '总量',
                            data: deedtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '其他税种收入',
                            type: 'line',
                            stack: '总量',
                            data: othertax,
                            areaStyle:{normal:{}}
                        }
                    ]
                };
                myChart01.setOption(option01);
            });
        } else {
            //具体属期查询
            $.post("${ctx}/sjyj/fxbgyf/tableB", {
                'svo.ssnf': ssnf,
                'svo.sqq': sqq,
                'svo.sqz': sqz
            }, function (results) {
                tableA(results);
                var externaltaxinfname = [];//获取的外部涉税信息名称
                var taxrelated = [];//应用涉税信息增加的税收收入
                var businesstax = [];//营业税
                var companytax = [];//企业所得税
                var persontax = [];//个人所得税
                var resourcetax = [];//资源税
                var townlandtax = [];//城镇土地使用税
                var citymaintenancetax = [];//城市维护建设税
                var stampstax = [];//印花税
                var landappreciationtax = [];//土地增值税
                var housetax = [];//房产税
                var shiptax = [];//车船税
                var farmlandtax = [];//耕地占用税
                var deedtax = [];//契税
                var othertax = [];//其他税种收入
                for (var i in results) {
                    if (externaltaxinfname.length<=3){
                        externaltaxinfname.push(results[i].externaltaxinfname);					//获取的外部涉税信息名称
                    }
                    taxrelated.push(results[i].taxrelated);										//应用涉税信息增加的税收收入
                    businesstax.push(results[i].businesstax);									//营业税
                    companytax.push(results[i].companytax);										//企业所得税
                    persontax.push(results[i].persontax);										//个人所得税
                    resourcetax.push(results[i].resourcetax);									//资源税
                    townlandtax.push(results[i].townlandtax);									//城镇土地使用税
                    citymaintenancetax.push(results[i].citymaintenancetax); 	                //城市维护建设税
                    stampstax.push(results[i].stampstax);										//印花税
                    landappreciationtax.push(results[i].landappreciationtax);                   //土地增值税
                    housetax.push(results[i].housetax);											//房产税
                    shiptax.push(results[i].shiptax);											//车船税
                    farmlandtax.push(results[i].farmlandtax);									//耕地占用税
                    deedtax.push(results[i].deedtax);											//契税
                    othertax.push(results[i].othertax);											//其他税种收入
                    num=num+parseInt(results[i].taxrelated);
                }
                var option01 = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['应用涉税信息增加的税收收入', '营业税', '企业所得税', '个人所得税', '资源税', '城镇土地使用税', '城市维护建设税', '印花税', '土地增值税', '房产税', '车船税', '耕地占用税', '契税', '其他税种收入']
                    },
                    calculable: true,
                    xAxis: [
                        {
                            axisLabel: {
                                textStyle: {
                                    fontSize: 12//设置字体大小
                                }
                            },
                            type: 'category',
                            boundaryGap: false,
                            data: externaltaxinfname
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            max:function(value){
                                return value.max / 2;
                            }
                        }
                    ],
                    series: [
                        {
                            name: '应用涉税信息增加的税收收入(万元)',
                            type: 'line',
                            stack: '总量',
                            data: taxrelated,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '营业税',
                            type: 'line',
                            stack: '总量',
                            data: businesstax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '企业所得税',
                            type: 'line',
                            stack: '总量',
                            data: companytax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '个人所得税',
                            type: 'line',
                            stack: '总量',
                            data: persontax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '资源税',
                            type: 'line',
                            stack: '总量',
                            data: resourcetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '城镇土地使用税',
                            type: 'line',
                            stack: '总量',
                            data: townlandtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '城市维护建设税',
                            type: 'line',
                            stack: '总量',
                            data: citymaintenancetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '印花税',
                            type: 'line',
                            stack: '总量',
                            data: stampstax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '土地增值税',
                            type: 'line',
                            stack: '总量',
                            data: landappreciationtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '房产税',
                            type: 'line',
                            stack: '总量',
                            data: housetax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '车船税',
                            type: 'line',
                            stack: '总量',
                            data: shiptax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '耕地占用税',
                            type: 'line',
                            stack: '总量',
                            data: farmlandtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '契税',
                            type: 'line',
                            stack: '总量',
                            data: deedtax,
                            areaStyle:{normal:{}}
                        },
                        {
                            name: '其他税种收入',
                            type: 'line',
                            stack: '总量',
                            data: othertax,
                            areaStyle:{normal:{}}
                        }
                    ]
                };
                myChart01.setOption(option01);
            });
        }
    });

    //图二(柱形图)
    $(function () {
        //文件编号
        $("#num").html(getAfterTheTime());
        //税款属期年份
        $("#years,#year").html(ssnf);
        //截止年份
        $("#asOfYear").html(ssnf);
        //属期起
        $("#beiongToPeriod,#upIn").html(sqq.substr(5, 7));
        //属期止
        $("#isAPeriod,#checkIn").html(sqz.substr(5, 7));
        //截止月份
        $("#asOfMonth").html(sqz.substr(5, 7));
        //统计时间
        $("#statisticalDate").html(statisticalTime());
        //查询属期
        if (selectid == "kjcx") {
            $.post("${ctx}/sjyj/fxbgyf/queryIsperiod", null, function (results) {
                var sqq = results[0].bgsqq;
                var sqz = results[0].bgsqz;
                //属期起
                $("#beiongToPeriod,#upIn").html(sqq.substr(5, 7));
                //属期止
                $("#isAPeriod,#checkIn").html(sqz.substr(5, 7));
                //截止月份
                $("#asOfMonth").html(sqz.substr(5, 7));
            });
        }else {
            $("#statisticalDate").html(scsj);
        }
        if (selectid == "kjcx") {
            //快捷查询
            $.post("${ctx}/sjyj/fxbgyf/theReport", {
                'svo.ssnf': ssnf,//所属年份
                'svo.kjsq': kjsq//根据快捷ID去查
            }, function (results) {
                initTables(results);
                //部门
                var arr = [];
                //企业所得税
                var qysds = [];
                //土地增值税
                var tdzzs = [];
                //房产税
                var fcs = [];
                //个人所得税
                var grsds = [];
                //印花税
                var yhs = [];
                //城市维护建设税
                var cswhjss = [];
                //城镇土地使用税
                var cztdsys = [];
                for (var i in results) {
                    if (arr.length<=21){
                        arr.push(results[i].swjgmc);//部门
                        qysds.push(results[i].qysds);//企业所得税
                        tdzzs.push(results[i].tdzzs);//土地增值税
                        fcs.push(results[i].fcs);//房产税
                        grsds.push(results[i].grsds);//个人所得税
                        yhs.push(results[i].yhs);//印花税
                        cswhjss.push(results[i].cswhjss);//城市维护建设税
                        cztdsys.push(results[i].cztdsys);//城镇土地使用税
                    }
                }
                var option02 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'line'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data: ['企业所得税', '土地增值税', '房产税', '个人所得税', '印花税', '城市维护建设税', '城镇土地使用税']
                    },
                    calculable: true,
                    xAxis: [
                        {
                            axisLabel: {
                                interval: 0,
                                rotate: 50,
                                textStyle: {
                                    fontSize: 10//设置字体大小
                                }
                            },
                            type: 'category',
                            data: arr
                        }
                    ],
                    grid: {
                        left: '10%',
                        bottom: '35%'
                    },
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '企业所得税',
                            type: 'bar',
                            data: qysds
                        },
                        {
                            name: '土地增值税',
                            type: 'bar',
                            stack: '税款',
                            data: tdzzs
                        },
                        {
                            name: '房产税',
                            type: 'bar',
                            stack: '税款',
                            data: fcs
                        },
                        {
                            name: '个人所得税',
                            type: 'bar',
                            stack: '税款',
                            data: grsds
                        },
                        {
                            name: '印花税',
                            type: 'bar',
                            data: yhs
                        },
                        {
                            name: '城市维护建设税',
                            type: 'bar',
                            barWidth: 5,
                            stack: '税款',
                            data: cswhjss
                        },
                        {
                            name: '城镇土地使用税',
                            type: 'bar',
                            stack: '税款',
                            data: cztdsys
                        }
                    ]
                };
                myChart02.setOption(option02);
            });
        } else {
            //具体属期查询
            $.post("${ctx}/sjyj/fxbgyf/isPeriod", {
                'svo.ssnf': ssnf,
                'svo.sqq': sqq,
                'svo.sqz': sqz
            }, function (results) {
                initTables(results);
                //部门
                var arr = [];
                //企业所得税
                var qysds = [];
                //土地增值税
                var tdzzs = [];
                //房产税
                var fcs = [];
                //个人所得税
                var grsds = [];
                //印花税
                var yhs = [];
                //城市维护建设税
                var cswhjss = [];
                //城镇土地使用税
                var cztdsys = [];
                for (var i in results) {
                    if (arr.length<=21){
                        arr.push(results[i].swjgmc);//部门
                        qysds.push(results[i].qysds);//企业所得税
                        tdzzs.push(results[i].tdzzs);//土地增值税
                        fcs.push(results[i].fcs);//房产税
                        grsds.push(results[i].grsds);//个人所得税
                        yhs.push(results[i].yhs);//印花税
                        cswhjss.push(results[i].cswhjss);//城市维护建设税
                        cztdsys.push(results[i].cztdsys);//城镇土地使用税
                    }
                }
                var option02 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    color:['#FF0000','#4D4D4D','#6CA6CD','#B4EEB4','#FFFF00','#BF3EFF','#CD853F'],
                    legend: {
                        data: ['企业所得税', '土地增值税', '房产税', '个人所得税', '印花税', '城市维护建设税', '城镇土地使用税']
                    },
                    calculable: true,
                    xAxis: [
                        {
                            axisLabel: {
                                interval: 0,
                                rotate: 50,
                                textStyle: {
                                    fontSize: 10//设置字体大小
                                }
                            },
                            type: 'category',
                            data: arr
                        }
                    ],
                    grid: {
                        left: '10%',
                        bottom: '35%'
                    },
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '企业所得税',
                            type: 'bar',
                            data: qysds
                        },
                        {
                            name: '土地增值税',
                            type: 'bar',
                            stack: '税款',
                            data: tdzzs
                        },
                        {
                            name: '房产税',
                            type: 'bar',
                            stack: '税款',
                            data: fcs
                        },
                        {
                            name: '个人所得税',
                            type: 'bar',
                            stack: '税款',
                            data: grsds
                        },
                        {
                            name: '印花税',
                            type: 'bar',
                            data: yhs
                            // color:'#FFFF00'
                        },
                        {
                            name: '城市维护建设税',
                            type: 'bar',
                            barWidth: 5,
                            stack: '税款',
                            data: cswhjss
                        },
                        {
                            name: '城镇土地使用税',
                            type: 'bar',
                            stack: '税款',
                            data: cztdsys
                        }
                    ]
                };
                myChart02.setOption(option02);
            });
        }
    });

    //表一
    function tableA(results) {
        $("#aCombined").html(results[4].taxrelated);
        $('#tableA').bootstrapTable('destroy');
        $('#tableA').bootstrapTable({
            data: results,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            onlyInfoPagination: false,
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            columns: [
                {
                    field: 'externaltaxinfname',
                    align: 'left',
                    halign: 'center',
                    title: '涉税信息名称'
                    // formatter: function (value, row, index) {
                    //     var nameString = "";
                    //     console.log(value.length);
                    //     if (value.length > 5) {
                    //         nameString = value.substring(0, 2) + '...';
                    //     } else {
                    //         nameString = value;
                    //     }
                    //     return [
                    //         '<a data-toggle="tooltip" data_placement="bottom" title=' + value + '>' + nameString + '</a>'
                    //     ].join('');
                    // }
                }, {
                    field: 'providinginfdept',
                    align: 'left',
                    halign: 'center',
                    title: '提供信息部门'
                }, {
                    field: 'infacquisitionbasis',
                    align: 'left',
                    halign: 'center',
                    title: '信息获取依据'
                }, {
                    field: 'taxrelated',
                    align: 'right',
                    halign: 'center',
                    title: '应用涉税信息增加的税收收入（万元）'
                }, {
                    field: 'businesstax',
                    align: 'right',
                    halign: 'center',
                    title: '营业税'
                }, {
                    field: 'companytax',
                    align: 'right',
                    halign: 'center',
                    title: '企业所得税'
                }, {
                    field: 'persontax',
                    align: 'right',
                    halign: 'center',
                    title: '个人所得税'
                }, {
                    field: 'resourcetax',
                    align: 'right',
                    halign: 'center',
                    title: '资源税'
                }, {
                    field: 'townlandtax',
                    align: 'right',
                    halign: 'center',
                    title: '城镇土地使用税'
                }, {
                    field: 'citymaintenancetax',
                    align: 'right',
                    halign: 'center',
                    title: '城市维护建设税'
                }, {
                    field: 'stampstax',
                    align: 'right',
                    halign: 'center',
                    title: '印花税'
                }, {
                    field: 'landappreciationtax',
                    align: 'right',
                    halign: 'center',
                    title: '土地增值税'
                }, {
                    field: 'housetax',
                    align: 'right',
                    halign: 'center',
                    title: '房产税',
                    width: '5%'
                }, {
                    field: 'shiptax',
                    align: 'right',
                    halign: 'center',
                    title: '车船税'
                }, {
                    field: 'farmlandtax',
                    align: 'right',
                    halign: 'center',
                    title: '耕地占用税'
                }, {
                    field: 'deedtax',
                    align: 'right',
                    halign: 'center',
                    title: '契税'
                }, {
                    field: 'othertax',
                    align: 'right',
                    halign: 'center',
                    title: '其他税收收入'
                }
            ]
        });
    }

    //表二
    function initTables(results) {
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            data: results,
            onlyInfoPagination: false,
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            columns: [
                {
                    field: 'swjgmc',
                    align: 'left',
                    halign: 'center',
                    title: '单位'
                }, {
                    field:'taxrelated',
                    align:'right',
                    halign:'center',
                    title:'应用涉税信息增加的税收收入',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'qysds',
                    align: 'right',
                    halign: 'center',
                    title: '企业所得税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'tdzzs',
                    align: 'right',
                    halign: 'center',
                    title: '土地增值税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'fcs',
                    align: 'right',
                    halign: 'center',
                    title: '房产税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'grsds',
                    align: 'right',
                    halign: 'center',
                    title: '个人所得税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'yhs',
                    align: 'right',
                    halign: 'center',
                    title: '印花税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'cswhjss',
                    align: 'right',
                    halign: 'center',
                    title: '城市维护建设税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }, {
                    field: 'cztdsys',
                    align: 'right',
                    halign: 'center',
                    title: '城镇土地使用税',
                    formatter: function (value, row, index) {
                        if(value.indexOf(".")==0){
                            return "0" + value;
                        }
                        return value;
                    }
                }
            ]
        });

    }

    //获取当前日期
    function getAfterTheTime() {
        var date = new Date();
        var tung = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate() + 1;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate
        }
        var currentTime = date.getFullYear() + month + strDate + date.getHours() + +date.getMinutes();
        // var currentTime = date.getFullYear() + tung + month + tung + strDate;
        return currentTime;
    }

    //统计时间
    function statisticalTime() {
        var date = new Date();
        var tung = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate() + 1;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate
        }
        var currentTime = date.getFullYear() + tung + month + tung + strDate;
        return currentTime;
    }

    //打印
    function printme(){
        // document.body.innerHTML=document.getElementById('printRange').innerHTML;
        $("#prindID").hide();
        $("#returnID").hide();
        window.print();
        window.location.href='${ctx}/sjyj/fxbgyf/initfxbgyf';
    }
</script>
