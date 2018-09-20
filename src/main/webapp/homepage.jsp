<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	<title>智能数据管理平台</title>

    <link rel="stylesheet" href="${ctx}/assets/assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/xenon-core.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/xenon-forms.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/xenon-components.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/xenon-skins.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/custom.css">
    <link rel="stylesheet" href="${ctx}/assets/assets/css/menustyle.css">
    <!-- 弹出窗口样式-->
    <link rel="stylesheet" href="${ctx}/assets/assets/css/component.css">
    <!-- 滑动样式-->
    <link rel="stylesheet"   href="${ctx}/assets/assets/css/owl.carousel.css">
    <%--boostraptable 样式--%>
	<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>

    <style>
        body{ font-family: "微软雅黑","microsoft yahei"; background-color:transparent; }
        ::-webkit-scrollbar { width: 7px; height: 7px; cursor: pointer }
        ::-webkit-scrollbar-track { background-color: #ddd; border-radius: 10px }
        ::-webkit-scrollbar-thumb { border-radius: 10px;background-color: #C4290D}
        .bkspan { position:absolute; padding:5px;border-style: solid;border-color: #11dbec;}
        .row1 {border-width: 5px 0 0 5px; top:-5px;left:10px;}
        .row2 {border-width: 5px 5px 0 0; top:-5px;right:10px;}
        .col1 {border-width: 0 0 5px 5px; bottom:-5px; left:-5px;}
        .col2 {border-width: 0 5px 5px 0; bottom:-5px;right:-5px;}
        .blue{ background: #06284d; margin-left: 10px;}
        .bsico{ font-size:40px; color:#fff;}
        .szfont{ font-size:24px; color:#00e8ff; font-weight:bold;}
        .bsfont{ font-size:16px; color:#fff;}
        .banner{ width:200px; height:35px; background:#081327; border:2px solid #11dbec; position:absolute;  top:-18px; text-align:center; font-size:18px; color:#fff; line-height:28px;}
        .left40{left:40%;}
        .left43{left:44%;}
        #box{display:none; background-color:#081327;width: 280px;height:200px;   position:fixed; top:20%;left:35%; border:1px solid #00e8ff; padding:10px; }
        #box-title{ display:block; color:red; font-size:22px; font-weight:bold;text-align:center; height:35px; line-height:35px; }
        #close{position:absolute; right:10px; top:-10px;font-size:35px;color:#fff; cursor:pointer; }
    </style>
</head>
<body>
<div class="container-fluid"  style="margin-top:10px;">
    <div style=" border:1px solid #11dbec; position:relative;">
        <span class="bkspan row row1"></span>
        <span class="bkspan row row2"></span>
        <span class="bkspan col col2"></span>
        <span class="bkspan col col1"></span>
        <div class="row" style="padding:10px;">
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal1">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-suitcase bsico"></i></td>
                            <td class="bsfont">部门数量</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="bmsl">35</td>
                        </tr>
                    </table>
                </a>
            </div>
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal2">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-cog bsico"></i></td>
                            <td class="bsfont">数据类别</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="lbsl" >219</td>
                        </tr>
                    </table>
                </a>
            </div>
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal3">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-th bsico"></i></td>
                            <td class="bsfont" >表数量</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="bsl">30970</td>
                        </tr>
                    </table>
                </a>
            </div>
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal4">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-suitcase bsico"></i></td>
                            <td class="bsfont">数据总量</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="zsjl">30659</td>
                        </tr>
                    </table>
                </a>
            </div>
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal5">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-glass bsico"></i></td>
                            <td class="bsfont">完成匹配条数</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="ppsl">30659</td>
                        </tr>
                    </table>
                </a>
            </div>
            <div class="col-xs-2 col-md-2" data-toggle="modal" data-target="#myModal6">
                <a href="#" class="thumbnail">
                    <table width="100%">
                        <tr height="35">
                            <td rowspan="2" align="center"><i class="fa fa-dashboard bsico"></i></td>
                            <td class="bsfont">匹配率</td>
                        </tr>
                        <tr height="35">
                            <td class="szfont" id="ppl">99.99%</td>
                        </tr>
                    </table>
                </a>
            </div>

            <!--部门-->
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" >
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">部门汇总</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab1"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--类数据-->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content"  style="width:800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel2">类数据汇总</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab2"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--表数量-->
            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content"  style="width:800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel3">表数量</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab3"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--数据量-->
            <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content"  style="width:800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel4">总数据量</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab4"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--已完成匹配量-->
            <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content"  style="width:800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel5">完成匹配数据统计</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab5"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--匹配率-->
            <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="width:1440px;">
                    <div class="modal-content"  style="width:1440px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel6">匹配率</h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped table-bordered table-hover" id="mytab6"></table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="container-fluid"  style="margin-top:20px;margin-bottom:30px;">
    <div class="row">
        <div class="col-md-12">
            <div style="width:100%; height: 260px; border:1px solid #11dbec; position:relative">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>
                <div id="main"  style="width:100%;height:260px; margin-top: -20px;"></div>
                <div id="box" style="width:400px;height:240px;overflow: auto;">
                    <a id='close'>×</a>
                    <span id="box-title">111111111111</span>
                    <table class="table table-bordered " style="color:#fff;text-align: center;height:200px;width:380px;" id="mytabs">
                        <tr width="380" height="26">
                            <td>名称</td>
                            <td>数据量</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid" style="margin-top:30px; margin-bottom:50px;">
    <div class="row">
        <div class="col-md-6">
            <div style="width:100%;height:350px;border:1px solid #11dbec; position:relative;">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>
                <span class="banner left40">月数据交换统计</span>
                <div id="main1"style="width:100%; height:350px;"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div style="width:100%;height:350px;border:1px solid #11dbec; position:relative;">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>
                <span class="banner left40">数据清洗匹配规则示意图</span>
                <div id="main2" style="width:90%;height:350px; margin: 0 auto;"></div>
            </div>
        </div>
    </div>
</div>
<%--<div class="container-fluid">--%>
    <%--<div style="padding:10px; border:1px solid #11dbec; position:relative">--%>
        <%--<span class="bkspan row row1"></span>--%>
        <%--<span class="bkspan row row2"></span>--%>
        <%--<span class="bkspan col col2"></span>--%>
        <%--<span class="bkspan col col1"></span>--%>
        <%--<span class="banner left43">系统任务运行情况监控</span>--%>
        <%--<div id="main3" style="width:100%;height:270px;"></div>--%>
    <%--</div>--%>
<%--</div>--%>

</body>
</html>
<!-- 滚动条 -->
<script src="${ctx}/assets/assets/js/gundong.js"></script>
<!-- BOOSTRAP相关 -->
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/assets/js/joinable.js"></script>
<!-- 侧边弹出 -->
<script src="${ctx}/assets/assets/js/classie.js"></script>
<script src="${ctx}/assets/assets/js/modalEffects.js"></script>
<!-- Imported scripts on this page -->
<script src="${ctx}/assets/assets/js/xenon-widgets.js"></script>
<!-- 主框架JS -->
<script src="${ctx}/assets/assets/js/xenon-custom.js"></script>
<!-- 引入echarts 3.0 -->
<script src="${ctx}/assets/js/echarts.min.js"></script>
<!-- 焦点滚动 -->
<script src="${ctx}/assets/assets/js/owl.carousel.min.js"></script>
<!-- 引入echarts 3.0 主题-->
<%--<script src="${ctx}/assets/assets/js/vintage.js"></script>--%>
<%--<script src="${ctx}/assets/assets/js/dark.js"></script>--%>
<%--<script src="${ctx}/assets/assets/js/infographic.js"></script>--%>
<%--<script src="${ctx}/assets/assets/js/macarons.js"></script>--%>
<%--<script src="${ctx}/assets/assets/js/roma.js"></script>--%>
<%--<script src="${ctx}/assets/assets/js/shine.js"></script>--%>
<script>
    //初始化分类统计数字
    $("#bmsl").html("${obj.BMSL}");
    $("#lbsl").html("${obj.LSJL}");
    $("#bsl").html("${obj.BSL}");
    $("#zsjl").html("${obj.ZSJL}");
    $("#ppsl").html("${obj.PPSJL}");
    $("#ppl").html("${obj.PPL}%");

    //部门折线图
    $.ajax({
        url: '${ctx}/main/homepage/bmdetails' ,
        type: 'post',
        success: function(json){
            var myChart = echarts.init(document.getElementById('main'),'shine');
            options={
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    },
                    formatter: function (params) {
                        return params[0].name + ': ' + params[0].value+"万条";
                    }
                },
                grid:{
                    x1:10,
                    x2:20
                },
                xAxis: {
                    data: json.xdatas,
                    axisTick: {show: false},
                    axisLine: {show: false},
                    axisLabel: {
                        textStyle: {
                            color: '#ffffff'
                        },
                        rotate: 45,
                        margin: 18,
                        fontSize: 15
                    }
                },
                yAxis: {
                    splitLine:{show: false},
                    axisTick: {show: false},
                    axisLine: {show: true},
                    axisLabel: {show: true,
                        formatter: '{value} 万条',
                        textStyle: {
                            color: '#ffffff'
                        }
                    }
                },
                color: ['#0388fd'],
                series:json.datas
            };

            myChart.setOption(options);
            myChart.on('click', function (params) {//点击事件
                if (params.componentType === 'series') {
                    var provinceName =params.name;
                    var provincevalue=params.value;
                    $("#mytabs tr:gt(0)").remove();
                    $("#box").css('display','block');
                    $("#box-title").html(provinceName);

                    $.ajax({
                        url: '${ctx}/main/homepage/bmdetails1' ,
                        type: 'post',
                        data:{bmmc:provinceName},
                        success: function(json){
                            console.log("json:",json);
                            $.each(json,function(index,obj){
                                  $("#mytabs").append("<tr><td>"+obj.BM+"</td><td>"+obj.SJL+"</td></tr>")
                            });
                        }
                    });

                }
            });
        }
    });


    //关闭
    $('#close').click(function(){
        $('#box').css('display','none');
    });
    //数据交换柱图
    $.ajax({
        url: '${ctx}/main/homepage/homelist' ,
        type: 'post',
        success: function(json){

        //console.log(json);
        //交换数据展示
            var myChart1 = echarts.init(document.getElementById('main1'),'macarons');
            options1={
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        crossStyle: {
                            color: '#999'
                        }
                    },
                    formatter: function (params,value) {
                        return  '导入: ' + params[0].value+ '万条<br> 导出: ' + params[1].value+'万条';
                    }
                },
                xAxis: [
                    {
                        type: 'category',
                        data :json.jhsj.xdatas,
                        axisPointer: {
                            type: 'shadow'
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#fff'
                            }
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '数据量',
                        min: 0,
                        axisLabel: {
                            formatter: '{value} 万条',
                            textStyle: {
                                color: '#fff'
                            }
                        }
                    }
                ],
                series: json.jhsj.datas
            };
            myChart1.setOption(options1);
        }, error: function (msg) {
            $.messager.alert('查询失败','失败!','error');
        }
    });


    var myChart2 = echarts.init(document.getElementById('main2'),'macarons');
    myChart2.showLoading();
    var data2 = {
        "name": "数据清洗匹配规则",
        "children": [
            {
                "name": "清洗规则",
                "children": [
                    {"name": "自动清洗",
                        "children": [
                            {"name": "去掉空格"},
                            {"name": "去掉回车、换行"},
                            {"name": "转换为半角字符"},
                            {"name": "去掉特殊字符"},
                            {"name": "去掉区域、分公司、集团、股份、有限、责任等字符"}
                        ]
                    },
                    {"name": "人工手动清洗"},

                ]
            },
            {
                "name": "匹配规则",
                "children": [
                    {"name": "纳税人名称"},
                    {"name": "工商注册号"},
                    {"name": "税务档案编号"},
                    {"name": "纳税人识别号"},
                    {"name": "社会信用代码"},
//                    {"name": "法定代表人姓名"},
//                    {"name": "生产经营地址"},
                    {"name": "自然人姓名+身份证号"},
                    {"name": "楼盘信息关联匹配"},
                    {"name": "管理代码一一对应"}
                ]
            }
        ]
    };
    myChart2.hideLoading();

        options2={
            tooltip: {
                trigger: 'item',
                triggerOn: 'mousemove'
            },
            legend: {
                top: '2%',
                left: '3%',
                orient: 'vertical',
                data: [{
                    name: 'tree1',
                    icon: 'rectangle'
                } ,
                ],
                borderColor: '#c23531'
            },
            series:[
                {
                    type: 'tree',
                    name: 'tree2',
                    data: [data2],
                    top: '20%',
                    left: '18%',
                    bottom: '22%',
                    right: '18%',

                    symbolSize: 7,
                    label: {
                        normal: {
                            position: 'left',
                            verticalAlign: 'middle',
                            align: 'right',
                            textStyle: {
                                color: '#fff'
                            }
                        }
                    },
                    leaves: {
                        label: {
                            normal: {
                                position: 'right',
                                verticalAlign: 'middle',
                                align: 'left'
                            }
                        }
                    },

                    expandAndCollapse: true,

                    animationDuration: 550,
                    animationDurationUpdate: 750
                }
            ]
        };
    myChart2.setOption(options2);

//    var myChart3 = echarts.init(document.getElementById('main3'),'macarons');
//    options3={
//        color: ['#7e94a1'],
//        grid: {
//            left: '3%',
//            right: '4%',
//            bottom: '3%',
//            containLabel: true
//        },
//        xAxis: {
//            type: 'value',
//            boundaryGap: [0, 0.01],
//            axisLabel: {
//                textStyle: {
//                    color: '#fff'
//                }
//            }
//        },
//        yAxis: {
//            type: 'category',
//            data: ['股权变更数据-201705月数据清洗任务','股权变更201706月匹配数据任务','房产201710月数据清洗任务'],
//            axisLabel: {
//                textStyle: {
//                    color: '#fff'
//                }
//            }
//        },
//        series: [
//            {
//                name: '2011年',
//                type: 'bar',
//                data: [18203, 23489, 29034]
//            }
//        ]
//    };
//    myChart3.setOption(options3);

    //初始化模态框点击事件
    //    第一个模态框
    var  columnarr=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'BM',
            align: 'center',
            height:25,
            title: '部门名称'
        }
    ];
    var urlstr="${pageContext.request.contextPath}/main/homepage/details1";
    var paramsss=function(params){
        return {offset:(params.offset/params.limit)+1,limit:params.limit};
    };
    inittabs(urlstr,paramsss,columnarr,'BM',"mytab1");

    //    第二个模态框
    var  columnarr2=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'SJLX',
            align: 'center',
            height:25,
            title: '数据类型'
        }
    ];
    var urlstr2="${pageContext.request.contextPath}/main/homepage/details2";
    inittabs(urlstr2,paramsss,columnarr2,'SJLX',"mytab2");


    // 第三个模态框
    var  columnarr3=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'SJLX',
            align: 'center',
            height:25,
            title: '数据类型'
        },
        {
            field: 'SJYB',
            align: 'center',
            height:25,
            title: '数据源表'
        }
    ];
    var urlstr3="${pageContext.request.contextPath}/main/homepage/details3";
    inittabs(urlstr3,paramsss,columnarr3,'SJYB',"mytab3");

    // 第四个模态框
    var  columnarr4=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'SJLX',
            align: 'center',
            height:25,
            title: '数据类型'
        },
        {
            field: 'SJYB',
            align: 'center',
            height:25,
            title: '数据源表'
        },
        {
            field: 'YBSJL',
            align: 'center',
            height:25,
            title: '数据量'
        }
    ];
    var urlstr4="${pageContext.request.contextPath}/main/homepage/details4";
    inittabs(urlstr4,paramsss,columnarr4,'SJYB',"mytab4");

    // 第四个模态框
    var  columnarr5=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'SJLX',
            align: 'center',
            height:25,
            title: '数据类型'
        },
        {
            field: 'SJYB',
            align: 'center',
            height:25,
            title: '数据源表'
        },
        {
            field: 'YBSJL',
            align: 'center',
            height:25,
            title: '匹配数据量'
        }
    ];
    var urlstr5="${pageContext.request.contextPath}/main/homepage/details5";
    inittabs(urlstr5,paramsss,columnarr5,'SJYB',"mytab5");

    // 第四个模态框
    var  columnarr6=[
        {
            align: 'center',
            title: '序号',
            height:25,
            formatter:function(value,row,index){
                return index+1;
            }
        },
        {
            field: 'BM',
            align: 'center',
            height:25,
            title: '部门'
        },
        {
            field: 'DWMC',
            align: 'center',
            height:25,
            title: '单位名称'
        },
        {
            field: 'SJLX',
            align: 'center',
            height:25,
            title: '数据类型'
        } ,
        {
            field: 'SJYB',
            align: 'center',
            height:25,
            title: '数据源表'
        },
        {
            field: 'YBSJL',
            align: 'center',
            height:25,
            title: '源表数据量'
        },
        {
            field: 'YDYPPL',
            align: 'center',
            height:25,
            title: '一对一匹配量'
        },
        {
            field: 'RGPPL',
            align: 'center',
            height:25,
            title: '人工匹配量'
        } ,
        {
            field: 'QSIYDDPPL',
            align: 'center',
            height:25,
            title: '全市一对多匹配量'
        },
        {
            field: 'QSYDDPPL',
            align: 'center',
            height:25,
            title: '全省一对多匹配量'
        },
        {
            field: 'SJL',
            align: 'center',
            height:25,
            title: '数据量'
        },
        {
            field: 'PPLPPL',
            align: 'center',
            height:25,
            title: '匹配率'
        }
    ];
    var urlstr6="${pageContext.request.contextPath}/main/homepage/details6";
    inittabs(urlstr6,paramsss,columnarr6,'SJYB',"mytab6");


    function inittabs(urlstr,params,columnarr,keyid,tabid){
        $('#'+tabid).bootstrapTable({
            <%--url:'${pageContext.request.contextPath}/sjcl/glppmx/mxgzlist',--%>
            url:urlstr,
            search: false, //是否启用搜素
            showRefresh: false, //刷新按钮
            showPaginationSwitch: false,
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'center', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            paginationLoop: true,
            uniqueId:keyid,
            clickToSelect: false, //是否启用点击选中行
            uniqueIS: keyid, //每一行的唯一标识，一般为主键列
            showToggle: false, //切换视图
            showColumns: false, //是否显示内容列下拉框
            queryParamsType:'limit',
            sidePagination:'server',
//            onCheck:function(row,$element){
//                clickindexs=$element.data("index");
//            },
            queryParams:params,
            columns:columnarr,
            onLoadSuccess:function(){

            }
        });
    }
</script>