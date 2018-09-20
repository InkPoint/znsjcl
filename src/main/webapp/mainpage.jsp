<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>菜单选项</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/style.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/plugin.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/landing.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/select.css">
    <!-- echrts 3.0-->
    <script src="${ctx}/v20/new1/js/echarts.min.js"></script>
    <script src="${ctx}/v20/new1/js/jquery-3.0.0.js"></script>
    <!-- echrts 水球球-->
    <script src="${ctx}/v20/new1/js/echarts-liquidfill.min.js"></script>
</head>
<body style="width: 100%;">
<section id="content">
    <section class="main padder" style="margin-top: 10px;">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-6">
                        <section class="panel">
                            <header class="panel-heading bg-white">
                                <div class="text-center h5">总数据量</div>
                            </header>
                            <div id="main3" style="width:100%;height:200px;"></div>
                        </section>
                    </div>
                    <div class="col-6">
                        <section class="panel">
                            <header class="panel-heading bg-white">
                                <div class="text-center h5">总成功数</div>
                            </header>
                            <div id="main4" style="width:100%;height:200px;"></div>
                        </section>
                    </div>
                </div>
                <section class="panel">
                    <div class="text-muted" style="height:40px;">
                        <ul class="sjlist">
                            <li>
                                <span id="theIrs" class="badge btn-danger"></span>
                                <span class="m-r-small">原市国税</span>
                            </li>
                            <li>
                                <span id="municipalFinance" class="badge btn-danger"></span>
                                <span class="m-r-small">市财政</span>
                            </li>
                            <li>
                                <span id="countriesSoilBureauOf" class="badge btn-danger"></span>
                                <span class="m-r-small">国土局</span>
                            </li>
                            <li>
                                <span id="suningBank" class="badge"></span>
                                <span class="m-r-small">苏宁银行</span>
                            </li>
                            <li>
                                <span id="municipalCivilAffairs" class="badge "></span>
                                <span class="m-r-small">市民政</span>
                            </li>
                            <li>
                                <span id="waterAuthority" class="badge"></span>
                                <span class="m-r-small">水务局</span>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="panel">
                    <header class="panel-heading bg-white">
                        <span>库表资源状况</span>
                    </header>
                    <div id="main2" style="width:100%;height:310px;"></div>
                </section>
            </div>
            <div class="col-lg-6">
                <!-- sparkline stats -->
                <section class="panel">
                    <header class="panel-heading">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="#"><i class="icon-retweet"></i></a></li>
                        </ul>
                        <span>系统流程示意图</span>
                    </header>

                    <ul class="list-group list-group-flush m-t-n">
                        <li class="list-group-item">
                            <div class="media" style="height:700px;">
                                <div id="main" style="width:100%;height:700px;margin-top:10px"></div>
                            </div>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </section>
</section>
<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
<script src="${ctx}/v20/new1/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ctx}/v20/new1/js/bootstrap.js"></script>
<!-- app -->
<script src="${ctx}/v20/new1/js/app.js"></script>
<script src="${ctx}/v20/new1/js/app.plugin.js"></script>
<script src="${ctx}/v20/new1/js/app.data.js"></script>
<!--  select css3菜单选项-->
<script type="text/javascript" src="${ctx}/v20/new1/js/jquery.min.js"></script>

</body>
</html>
<script type="text/javascript">
    $(function () {
        $.post("${ctx}/main/homepage/dataAcquisition", null, function (result) {
            //国税局
            $("#theIrs").text(result[5].SJL+"万");
            //市财政
            $("#municipalFinance").text(result[4].SJL+"万");
            //国土局
            $("#countriesSoilBureauOf").text(result[1].SJL+"万");
            //苏宁银行
            $("#suningBank").text(result[2].SJL+"万");
            //市民政
            $("#municipalCivilAffairs").text(result[3].SJL+"万");
            //水务局
            $("#waterAuthority").text(result[0].SJL+"万");
        });
    });
    var myChart = echarts.init(document.getElementById('main'));
    var uploadedDataURL = "${ctx}/v20/new1/json/data01.json";
    var sjclpt = "${ctx}/v20/new1/svg/sjclpt.svg";
    var ysclqy = "${ctx}/v20/new1/svg/ysclqy.svg";
    var sjcjg = "${ctx}/v20/new1/svg/sjcjg.svg";
    var sjxjg = "${ctx}/v20/new1/svg/sjxjg.svg";
    var sjyj = "${ctx}/v20/new1/svg/sjyj.svg";
    var sjdr = "${ctx}/v20/new1/svg/sjdr.svg";
    var sjqxpp = "${ctx}/v20/new1/svg/sjqxpp.svg";
    var sjyjjg = "${ctx}/v20/new1/svg/sjyjjg.svg";
    var sjcpfx = "${ctx}/v20/new1/svg/sjcpfx.svg";
    var yjlyhf = "${ctx}/v20/new1/svg/yjlyhf.svg";
    var yjbqhf = "${ctx}/v20/new1/svg/yjbqhf.svg";
    var sjyj2 = "${ctx}/v20/new1/svg/sjyj2.svg";
    var fxjg = "${ctx}/v20/new1/svg/fxjg.svg";
    var sjcpjg = "${ctx}/v20/new1/svg/sjcpjg.svg";

    $.get(uploadedDataURL, function (geoJson) {
        myChart.hideLoading();
        echarts.registerMap('wuhan', geoJson);

        var allData = {
            "citys": [
                {
                    "name": "数据处理平台",
                    "value": [70.46607, 275.093863, 4],
                    symbol: 'image://' + sjclpt,
                    "symbolSize": 80,
                    "itemStyle": {"normal": {"color": "#F58158"}}
                },
                {
                    "name": "原始处理区域",
                    "value": [212.46607, 140.093863, 4],
                    symbol: 'image://' + ysclqy,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据粗加工",
                    "value": [212.46607, 240.093863, 4],
                    symbol: 'image://' + sjcjg,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据细加工",
                    "value": [212.46607, 340.093863, 4],
                    symbol: 'image://' + sjxjg,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据研究",
                    "value": [212.46607, 440.093863, 9],
                    symbol: 'image://' + sjyj,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据导入",
                    "value": [402.46607, 90.093863, 4],
                    symbol: 'image://' + sjdr,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据清洗/匹配",
                    "value": [402.46607, 240.093863, 4],
                    symbol: 'image://' + sjqxpp,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据原件加工",
                    "value": [402.46607, 380.093863, 4],
                    symbol: 'image://' + sjyjjg,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据产品/分析",
                    "value": [402.46607, 520.093863, 4],
                    symbol: 'image://' + sjcpfx,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },

                {
                    "name": "依据来源划分",
                    "value": [582.46607, 40.093863, 4],
                    symbol: 'image://' + yjlyhf,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "依据业务标签划分",
                    "value": [582.46607, 120.093863, 4],
                    symbol: 'image://' + yjbqhf,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "依据来源划分",
                    "value": [582.46607, 200.093863, 4],
                    symbol: 'image://' + yjlyhf,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "依据业务标签划分匹配情况",
                    "value": [582.46607, 290.093863, 4],
                    symbol: 'image://' + yjbqhf,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据元件",
                    "value": [582.46607, 380.093863, 4],
                    symbol: 'image://' + sjyj2,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据分析结果",
                    "value": [582.46607, 470.093863, 4],
                    symbol: 'image://' + fxjg,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                },
                {
                    "name": "数据产品结果",
                    "value": [582.46607, 560.093863, 4],
                    symbol: 'image://' + sjcpjg,
                    "symbolSize": 60,
                    "itemStyle": {"normal": {"color": "#4c4b4b"}}
                }
            ],


            "moveLines": [
                {
                    "fromName": "数据处理平台",
                    "toName": "原始处理区域",
                    "coords": [[70.46607, 275.093863, 4], [212.46607, 140.093863, 4]]
                },
                {
                    "fromName": "数据处理平台",
                    "toName": "数据粗加工",
                    "coords": [[70.46607, 275.093863, 4], [212.46607, 240.093863, 4]]
                },
                {
                    "fromName": "数据处理平台",
                    "toName": "数据细加工",
                    "coords": [[70.46607, 275.093863, 4], [212.46607, 340.093863, 4]]
                },
                {
                    "fromName": "数据处理平台",
                    "toName": "数据研究",
                    "coords": [[70.46607, 275.093863, 4], [212.46607, 440.093863, 9]]
                },

                {
                    "fromName": "原始处理区域",
                    "toName": "数据导入",
                    "coords": [[212.46607, 140.093863, 4], [402.46607, 90.093863, 4]]
                },
                {
                    "fromName": "原始处理区域",
                    "toName": "数据粗加工",
                    "coords": [[212.46607, 140.093863, 4], [212.46607, 240.093863, 4]]
                },

                {
                    "fromName": "数据粗加工",
                    "toName": "数据细加工",
                    "coords": [[212.46607, 240.093863, 4], [212.46607, 340.093863, 4]]
                },
                {
                    "fromName": "数据细加工",
                    "toName": "数据研究",
                    "coords": [[212.46607, 340.093863, 4], [212.46607, 440.093863, 9]]
                },

                {
                    "fromName": "数据粗加工",
                    "toName": "数据清洗/匹配",
                    "coords": [[212.46607, 240.093863, 4], [402.46607, 240.093863, 41]]
                },
                {
                    "fromName": "数据细加工",
                    "toName": "数据原件加工",
                    "coords": [[212.46607, 340.093863, 4], [402.46607, 380.093863, 4]]
                },
                {
                    "fromName": "数据研究",
                    "toName": "数据产品/分析",
                    "coords": [[212.46607, 440.093863, 9], [402.46607, 520.093863, 4]]
                },

                {
                    "fromName": "数据导入",
                    "toName": "依据来源划分",
                    "coords": [[402.46607, 90.093863, 4], [582.46607, 40.093863, 4]]
                },
                {
                    "fromName": "数据导入",
                    "toName": "依据业务标签划分",
                    "coords": [[402.46607, 90.093863, 4], [582.46607, 120.093863, 4]]
                },
                {
                    "fromName": "数据清洗/匹配",
                    "toName": "依据来源划分",
                    "coords": [[402.46607, 240.093863, 4], [582.46607, 200.093863, 4]]
                },
                {
                    "fromName": "数据清洗/匹配",
                    "toName": "依据业务标签划分匹配情况",
                    "coords": [[402.46607, 240.093863, 4], [582.46607, 290.093863, 4]]
                },
                {
                    "fromName": "数据原件加工",
                    "toName": "数据元件",
                    "coords": [[402.46607, 380.093863, 4], [582.46607, 380.093863, 4]]
                },
                {
                    "fromName": "数据产品/分析",
                    "toName": "数据分析结果",
                    "coords": [[402.46607, 520.093863, 4], [582.46607, 470.093863, 4]]
                },
                {
                    "fromName": "数据产品/分析",
                    "toName": "数据产品结果",
                    "coords": [[402.46607, 520.093863, 4], [582.46607, 560.093863, 4]]
                }
            ]
        };

        options = {
            legend: {
                show: true,
                //orient: 'vertical',
                top: 'top',
                left: 'right',
                data: ['业务点', '流程图'],
                textStyle: {
                    color: '#000'
                }
            },
            tooltip: {
                formatter: '{b}'
            },
            geo: {
                map: '北京市',
                label: {
                    emphasis: {
                        show: false
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        areaColor: '#323c48',
                        borderColor: '#404a59'
                    },
                    emphasis: {
                        areaColor: '#2a333d'
                    }
                }
            },
            series: [{
                name: '业务点',
                // type: 'effectScatter',
                type: 'scatter',
                coordinateSystem: 'geo',
                zlevel: 2,
                rippleEffect: {
                    brushType: 'stroke',
                    period: 7,
                    scale: 10
                },
                label: {
                    normal: {
                        show: true,
                        position: 'bottom',
                        formatter: '{b}'
                        //color:'white',
                    },
                    emphasis: {
                        show: true,
                        //position: 'right',
                        formatter: '{b}'
                    }
                },
                showEffectOn: 'render',
                itemStyle: {
                    normal: {
                        color: '#46bee9'
                    }
                },


                data: allData.citys
            }, {
                name: '流程图',
                type: 'lines',
                coordinateSystem: 'geo',
                zlevel: 2,
                large: true,
                effect: {
                    show: true,
                    constantSpeed: 30,
                    symbol: 'arrow',//ECharts 提供的标记类型包括 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
                    symbolSize: 6,
                    trailLength: 0
                },
                lineStyle: {
                    normal: {
                        color: '#0fff17',
                        width: 1,
                        opacity: 0.6,
                        curveness: 0.1
                    }
                },
                data: allData.moveLines
            }]
        };
        myChart.setOption(options);
    });
    var myChart2 = echarts.init(document.getElementById('main2'));
    data = [{
        "value": 17.6,
        "name": "保险"
    }, {
        "value": 16.5,
        "name": "知识产权"
    }, {
        "value": 16.5,
        "name": "出版"
    }, {
        "value": 15.5,
        "name": "轻工业"
    }, {
        "value": 14.8,
        "name": "金融"
    }, {
        "value": 13.7,
        "name": "化工"
    }, {
        "value": 13.6,
        "name": "科技"
    }, {
        "value": 13.4,
        "name": "教育"
    }, {
        "value": 13.1,
        "name": "对外经贸合作"
    }, {
        "value": 12.6,
        "name": "节能"
    }, {
        "value": 12.6,
        "name": "电力"
    }, {
        "value": 12.6,
        "name": "资源综合利用"
    }, {
        "value": 12.4,
        "name": "能源"
    }, {
        "value": 12.2,
        "name": "矿产"
    }, {
        "value": 12,
        "name": "信息产业"
    }, {
        "value": 12,
        "name": "基础设施"
    }, {
        "value": 11.7,
        "name": "物流"
    }, {
        "value": 11.6,
        "name": "环境保护"
    }, {
        "value": 11.6,
        "name": "国家安全"
    }, {
        "value": 11.6,
        "name": "水运"
    }]

    for (var n in data) {
        data[n]['name'] = data[n]['name'] + ' ' + data[n]['value'] + '%'
    }

    options2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{b}"
        },
        series: [{
            type: 'treemap',
            width: '100%',
            height: '100%',
            top: '0%',
            roam: false, //是否开启拖拽漫游（移动和缩放）
            nodeClick: false, //点击节点后的行为,false无反应
            breadcrumb: {
                show: false
            },
            label: { //描述了每个矩形中，文本标签的样式。
                normal: {
                    show: true,
                    position: ['10%', '10%']
                }
            },
            itemStyle: {
                normal: {
                    show: true,
                    textStyle: {
                        color: '#fff',
                        fontSize: 16
                    },
                    borderWidth: 1,
                    borderColor: '#fff'
                },

                emphasis: {
                    label: {
                        show: true
                    }
                }
            },
            data: data
        }]
    };
    myChart2.setOption(options2);

    //总数据量
    $.post("${ctx}/main/homepage/dataAggregation", null, function (data) {
        var thetotal = parseInt(data[0].ZSJL);
        var myChart3 = echarts.init(document.getElementById('main3'));
        options3 = {
            series: [{
                type: 'liquidFill',
                data: [
                    0.7
                ],
                center: ['50%', '50%'],
                color: ['#19B1EC'],
                radius: '90%',
                shape: 'path://M0,19.589C0,19.59,12.542,0.133,86.237,0.092c73.639-0.039,86.236,19.497,86.236,19.497v224.215H0V19.589L0,19.589z',
                // waveAnimation: true,
                outline: {
                    show: false
                },
                amplitude: 30,//动画速度
                direction: 'right',//动画方向
                animationDuration: 2000,
                label: {
                    normal: {
                        formatter: function () {
                            return '总数据量\n\n' + thetotal + '万条';
                        }
                    },
                    fontSize: 14,
                    //fontFamily: 'Lobster Two',
                    baseline: 'bottom',
                    position: ['50%', '70%']
                }
            }]
        };
        myChart3.setOption(options3);
    });

    //总成功数
    $.post("${ctx}/main/homepage/dataAggregation", null, function (data) {
        var numberOfSuccessful = parseInt(data[0].ZCGS);
        var myChart4 = echarts.init(document.getElementById('main4'));
        options4 = {
            series: [{
                type: 'liquidFill',
                shape: 'circle',
                data: [
                    0.6
                ],
                color: ['#fea414'],
                radius: '90%',
                waveAnimation: true,
                outline: {
                    show: true,
                    borderDistance: 4,
                    itemStyle: {
                        color: 'none',
                        borderColor: '#fea414',
                        borderWidth: 2,
                        shadowBlur: 20
                    }
                },
                amplitude: 30,//动画速度
                direction: 'right',//动画方向
                animationDuration: 2000,
                label: {
                    normal: {
                        formatter: function () {
                            return '总成功数\n\n' + numberOfSuccessful + '万条';
                        }
                    },
                    fontSize: 14,
                    baseline: 'bottom',
                    position: ['50%', '70%']
                }
            }]
        };
        myChart4.setOption(options4);
    });
</script>
