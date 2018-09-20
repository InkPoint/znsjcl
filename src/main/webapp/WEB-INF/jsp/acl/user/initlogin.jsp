<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<html>
<head>
    <meta charset="utf-8"/>
    <title>西安智能数据处理【展示模式】</title>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="${ctx}/v20/new1/css/bootstrap.min.css" rel="stylesheet">
    <!-- 旅游产业样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/v20/new1/css/lycy.css">
    <!-- echrts 3.0-->
    <script src="${ctx}/v20/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/assets/js/echarts.min.js"></script>
    <style>
        .zktop {
            width: 98%;
            height: 180px;
            margin: 30px;
        }

        .zkbottom {
            width: 98%;
            height: 180px;
            margin: 15px auto;
            font-size: 16px;
            color: #fff;
        }

        .s01 {
            width:25%;
            padding: 5px;
            float: left;
        }

        .s02 {
            width:30%;
            float: left;
            padding-top: 5px;
            padding-left:10px;
            padding-bottom: 5px;
        }

        .s03 {
            width:30%;
            float: left;
        }

        .b01 {
            padding: 20px;
        }

        .wzlist {
            font-size: 16px;
            color: #fff;
        }

        .wzlist li {
            line-height: 30px;
        }

        .blist li {
            float: left;
            margin-left: 8px;
            width: 32%;
            height: 150px;
        }

        .font01 {
            font-size: 18px;
            color: #6ac7f0;
        }

        .font02 {
            font-size: 18px;
            color: #e81660;
        }

        .font03 {
            font-size: 18px;
            color: #6ac7f0;
        }
        .font05 {
            font-size:24px;
            color: #6ac7f0;
        }

        .font04 {
            font-size: 18px;
            color: #e81660;
        }

        .jc {
            font-weight: bold;
        }

        .linkbtn {
            width: 100px;
            height: 35px;
            background: url(${ctx}/v20/new1/images/linkbtn.png) no-repeat;
            position: absolute;
            right: 15px;
            top: 10px;
            text-align: center;
        }

        .linkbtn a {
            width: 100px;
            height: 35px;
            cursor: pointer;
            line-height: 32px;
            font-size: 16px;
            font-weight: bold;
            text-indent: 10px;
        }

        /* 字符云 */
        #tagscloud {
            width: 100%;
            height: 190px;
            position: relative;
            font-size: 12px;
            color: #333;
            margin: 0px auto 0;
            text-align: center;
        }

        #tagscloud a {
            position: absolute;
            font-weight: bold;
            top: 0px;
            left: 0px;
            color: #fff;
            font-family: "Microsoft YaHei";
            text-decoration: none;
            margin: 0 0px 15px 0;
            line-height: 15px;
            text-align: center;
            font-size: 16px;

            display: inline-block;
            border-radius: 3px;
        }

        #tagscloud a.tagc1 {
            color: #fff;
        }

        #tagscloud a.tagc2 {
            color: #fff;
        }

        #tagscloud a.tagc5 {
            color: #fff;
        }

        #tagscloud a:hover {
            color: #fff;
            background: #0099ff;
        }
    </style>
</head>
<body>
<div class="ghtop">
    <div class="linkbtn">
        <a href="main.jsp">工作模式</a>
    </div>
    <div class="ghbanner" align="center">
        西安智能数据处理系统
    </div>
</div>
<div class="ghbody">
    <div class="tx_01">
        <span class="row row1"></span>
        <span class="row row2"></span>
        <span class="col col2"></span>
        <span class="col col1"></span>

        <div class="gytitle">数据状况汇总</div>
        <div class="zktop">
            <div class="s01" style="margin-left: 10px;">
                <ul class="wzlist">
                    <li class="jc">总数据量</li>
                    <li><a id="thetotal" class="font01"></a>万条</li>
                    <li style="float: left;">本年<br><a id="a1" class="font03"></a>万条</li>
                    <li style="float: left; margin-left: 15px;">本月<br><a class="font03">217.33</a>万条</li>
                </ul>
            </div>
            <div class="s02" style="margin-left: 10px;">
                <ul class="wzlist">
                    <li class="jc">总成功数</li>
                    <li><a id="numberOfSuccessful" class="font02"></a>万条</li>
                    <li style="float: left;">本年<br><a class="font04">753.63</a>万条</li>
                    <li style="float: left; margin-left: 10px;">本月<br><a class="font04">217.33</a>万条</li>
                </ul>
            </div>
            <div class="s03" style="margin-left: 15px;">
                <div id="main" style="width:240px;height:150px;margin-left: 15px;"></div>
            </div>
        </div>
        <div class="zkbottom">
            <div class="b01">
                <ul class="blist">
                    <li>
                        <div style="float: left;"><img src="${ctx}/v20/images/s01.png"></div>
                        <div style="float: left; padding-top: 20px;">
                            <p class="jc">部门数量</p>

                            <p><a id="departmentNumber" class="font03"></a>个部门</p>
                        </div>
                    </li>
                    <li style="margin-left: 5px;">
                        <div style="float: left;"><img src="${ctx}/v20/images/s02.png"></div>
                        <div style="float: left; padding-top: 20px;">
                            <p class="jc">数据类别</p>

                            <p><a id="dataCategories" class="font03"></a>个</p>
                        </div>
                    </li>
                    <li>
                        <div style="float: left;"><img src="${ctx}/v20/images/s03.png"></div>
                        <div style="float: left; padding-top: 20px;">
                            <p class="jc">表数量</p>

                            <p><a id="tableNumber" class="font03"></a>个表</p>
                        </div>
                    </li>
                </ul>

            </div>

        </div>

    </div>
    <div class="tx_02">
        <span class="bkspan row row1"></span>
        <span class="bkspan row row2"></span>
        <span class="bkspan col col2"></span>
        <span class="bkspan col col1"></span>

        <div class="gytitle">数据共享交换情况</div>
        <div style="width: 98%; margin: 0 auto;">
            <div id="main02" style="width:55%;height:400px; float: left;"></div>
            <div id="main03" style="width:43%;height:400px; float: left;margin-left: 10px;margin-top: 30px;">
                <table style="color: #fff; font-size: 20px; margin-top: 40px; margin-left: 70px;">
                    <tbody>
                    <tr height="50">
                        <td width="100">单位：</td>
                        <td><a id="dwmc" class="font05"></a></td>
                    </tr>
                    <tr height="50">
                        <td>累计：</td>
                        <td><a id="lj" class="font05"></a>万条</td>
                    </tr>
                    <tr height="50">
                        <td>本年度：</td>
                        <td><a id="bnd" class="font05"></a>万条</td>
                    </tr>
                    <tr height="50">
                        <td>本季度：</td>
                        <td><a id="bjd" class="font05"></a>万条</td>
                    </tr>
                    <tr height="50">
                        <td>本月：</td>
                        <td><a id="byd" class="font05"></a>万条</td>
                    </tr>
                    </tbody>
                </table>
                 <%--<div style="width: 100%;text-align: left;color: white;font-size:20px;height: 30px; background: red;">&nbsp;&nbsp;单位：&nbsp;&nbsp;<a id="dwmc" class="font03"></a></div>--%>
                 <%--<div style="width: 100%;text-align: left;color: white;font-size:20px;height: 30px;">&nbsp;&nbsp;累计：&nbsp;&nbsp;<a id="lj" class="font03"></a>万条</div>--%>
                 <%--<div style="width: 100%;text-align: left;color: white;font-size:20px;height: 30px;">&nbsp;&nbsp;本年度：&nbsp;&nbsp;<a id="bnd" class="font03"></a>万条</div>--%>
                 <%--<div style="width: 100%;text-align: left;color: white;font-size:20px;height: 30px;">&nbsp;&nbsp;本季度：&nbsp;&nbsp;<a id="bjd" class="font03"></a>万条</div>--%>
                 <%--<div style="width: 100%;text-align: left;color: white;font-size:20px;height: 30px;">&nbsp;&nbsp;本月：&nbsp;&nbsp;<a id="byd" class="font03"></a>万条</div>--%>
                </ul>
            </div>
        </div>

    </div>

</div>
<div class="ghdown">
    <div style="width:49%;height:300px;float:left;">
            <div class="tx_03">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>

                <div class="gytitle2">清洗匹配逻辑思维导图</div>
                <div style="width: 98%; margin: 0 auto;">
                    <div id="main04" style="width:100%;height:240px;"></div>
                </div>
            </div>
            <div class="tx_04">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>

                <div class="gytitle2">外部门数据状况</div>
                <div id="main05" style="width:100%;height:240px;"></div>
            </div>
    </div>
    <div style="width:50%;height:300px;margin-left: 2px;float:left;">
            <div class="tx_05">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>

                <div class="gytitle2">数据热词</div>
                <div style="width:98%; height:240px; margin:0 auto;">
                    <div id="tagscloud">

                        <a href='#' class='tagc1'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc5'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc1'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc5'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc1'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc5'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc1'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc5'></a>
                        <a href='#' class='tagc2'></a>
                        <a href='#' class='tagc2'></a>
                    </div>

                    <!-- 字符云-->
                    <script src="${ctx}/v20/new1/js/tagscloud.js"></script>
                </div>
            </div>
            <div class="tx_06">
                <span class="bkspan row row1"></span>
                <span class="bkspan row row2"></span>
                <span class="bkspan col col2"></span>
                <span class="bkspan col col1"></span>

                <div class="gytitle2">第三方数据应用成效(本年度)</div>
                <div id="main06" style="width:100%;height:240px;"></div>
            </div>
    </div>
</div>
<div style="clear: both;"></div>
<div class="ghbootom">西安市税务局 版权所有</div>
</body>
</html>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var optionsdata1;
    var aa=0;
    $(function () {
        //数据热词
        $.post("${ctx}/main/homepage/selectRc", null, function (data) {
            for (var i = 0; i < data.length; i++) {
                var str1 = data[i].MODELNAME;
                $("#tagscloud a:eq(" + i + ")").text(str1);
            }

        });
        //数据汇总(总数据量、总成功数、匹配率、部门数据量、数据类别、表数量)
        $.post("${ctx}/main/homepage/dataAggregation", null, function (results) {
            //总数据量
            $("#thetotal").text(results[0].ZSJL);
            //总成功数
            $("#numberOfSuccessful").text(results[0].ZCGS);
            //部门数量
            $("#departmentNumber").text(results[0].BMSL);
            //数据类别
            $("#dataCategories").text(results[0].SJLB);
            //表数量
            $("#tableNumber").text(results[0].BSL);
            //匹配率
            var myChart = echarts.init(document.getElementById('main'));
            var options = {
                tooltip: {
                    formatter: "{a} <br/>{b} : {c}%"
                },
                title: {
                    x: "center",
                    bottom: 10,
                    text: '匹配率',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 18,
                        color: "#fff"
                    }
                },
                series: [
                    {
                        center: ['50%', '70%'], // 默认全局居中
                        type: 'gauge',
                        name: '业务指标',
                        radius: '120%',
                        startAngle: '195',
                        endAngle: '-15',
                        splitNumber: '20',
                        pointer: {
                            show: false
                        },
                        detail: {
                            offsetCenter: [0, -20],
                            formatter: '{value}%'
                        },
                        data: [{value: results[0].PPL, name: '完成率'}],
                        title: [{
                            show: true,
                            offsetCenter: [0, '20px'],
                            textStyle: {
                                color: '#fff',
                                fontStyle: 'normal',
                                fontWeight: 'normal',
                                fontFamily: '微软雅黑',
                                fontSize: 16
                            }
                        }, {
                            show: true,
                            offsetCenter: [0, '40px'],
                            textStyle: {
                                color: '#fff',
                                fontStyle: 'normal',
                                fontWeight: 'normal',
                                fontFamily: '微软雅黑',
                                fontSize: 16
                            }
                        }],
                        axisLine: {
                            show: true,
                            lineStyle: {
                                color: [[0, '#00ff00'], [0.95, '#00ff00'], [1, '#002c5d']],
                                width: 25,
                                shadowBlur: 15,
                                shadowColor: '#00ff00',
                                shadowOffsetX: 0,
                                shadowOffsetY: 0,
                                opacity: 1
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        splitLine: {
                            show: true,
                            length: 25,
                            lineStyle: {
                                color: '#00377a',
                                width: 2,
                                type: 'solid',
                                shadowColor: '#00377a',
                                shadowBlur: 25,
                                shadowOffsetX: 10,
                                shadowOffsetY: 10,
                                opacity: 0.5
                            }
                        },
                        axisLabel: {
                            show: false
                        }
                    }
                ]
            };
            myChart.setOption(options);
        });
    });

    //数据共享交换情况(数据获取)
    $.post("${ctx}/main/homepage/dataAcquisition", null, function (result) {
        //保存结果
        optionsdata1= result;
        setInterval("intervaldatas()",5000);

        var myChart02 = echarts.init(document.getElementById('main02'));
        var sgs = "${ctx}/v20/new1/svg/sgs.svg";
        var xxds = "${ctx}/v20/new1/svg/xxds.svg";
        var swj = "${ctx}/v20/new1/svg/swj.svg";
        var gtj = "${ctx}/v20/new1/svg/gtj.svg";
        var snyh = "${ctx}/v20/new1/svg/snyh.svg";
        var smz = "${ctx}/v20/new1/svg/smz.svg";
        var sxcz = "${ctx}/v20/new1/svg/sxcz.svg";
        var uploadedDataURL = "${ctx}/v20/json/show.json";

        $.get(uploadedDataURL, function (data) {
            echarts.registerMap('wuhan', data);
            var geoCoordMap = {
                '原市国税': [113.8432, 31.29000],
                '水务局': [115.00461, 31.29000],
                '苏宁银行': [115.00461, 30.18395],
                '市民政': [113.8432, 30.18395],
                '市财政': [113.6432, 30.75395],
                '国土局': [115.30461, 30.75395],
                '西安市税务局': [114.44717, 30.75063]
            };

            var data = {
                '原市国税': result[5].SJL,
                '水务局': result[0].SJL,
                '苏宁银行': result[2].SJL,
                '市民政': result[3].SJL,
                '市财政': result[4].SJL,
                '国土局': result[1].SJL
            };

            var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

            var option02 = {
                title: {
                    x: "center",
                    top: 10,
                    text: '数据获取',
                    textStyle: {
                        fontWeight: 'normal',
                        fontSize: 18,
                        color: "#fff"
                    }
                },
                tooltip: {
                    trigger: 'item',
                    formatter: function (o) {

                        return o.name + "：" + o.value[2] + "万条";
                    }
                },

                geo: {
                    map: 'wuhan',
                    label: {
                        emphasis: {
                            show: false
                        }
                    },
                    roam: true,
                    itemStyle: {
                        normal: {
                            color: 'rgba(22,22,2,0)',
                            areaColor: 'rgba(22,22,2,0)',
                            borderColor: 'rgba(22,22,2,0)'

                        },
                        emphasis: {
                            color: 'rgba(22,22,2,0)',
                            areaColor: 'rgba(22,22,2,0)',
                            borderColor: 'rgba(22,22,2,0)'
                        }
                    }
                },

                series: [{
                    type: 'lines',
                    zlevel: 1,
                    effect: {
                        show: true,
                        period: 3,
                        trailLength: 0.1,
                        color: '#A6C84C',
                        symbolSize: 8
                    },
                    lineStyle: {
                        normal: {
                            color: '#a6c84c',
                            width: 0,
                            curveness: 0.2
                        }
                    },
                    data: [{

                        coords: [geoCoordMap['原市国税'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['水务局'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['苏宁银行'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['市民政'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['市财政'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['国土局'], geoCoordMap['西安市税务局']]
                    }]
                }, {

                    type: 'lines',
                    zlevel: 2,
                    effect: {
                        show: true,
                        period: 3,
                        trailLength: 0,
                        symbol: 'image://',
                        // symbol: planePath,
                        symbolSize: 15
                    },
                    lineStyle: {
                        normal: {
                            color: '#a6c84c',
                            width: 1,
                            opacity: 0.4,
                            curveness: 0.2
                        }
                    },
                    data: [{

                        coords: [geoCoordMap['原市国税'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['水务局'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['苏宁银行'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['市民政'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['市财政'], geoCoordMap['西安市税务局']]
                    }, {

                        coords: [geoCoordMap['国土局'], geoCoordMap['西安市税务局']]
                    }]
                }, {

                    type: 'effectScatter',
                    coordinateSystem: 'geo',
                    zlevel: 2,
                    rippleEffect: {
                        period: 4,
                        scale: 1.8, //动画中波纹的最大缩放比例。
                        brushType: 'fill'
                    },
                    label: {
                        normal: {
                            show: true,
                            position: 'bottom',
                            formatter: '{b}',
                            fontSize: 16,
                            offset: [0, 10]
                        }
                    },
                    //图形大小
                    symbolSize: '60',
                    itemStyle: {
                        normal: {
                            color: '#ffffff'
                        }
                    },
                    data: [{
                        name: '原市国税',
                        value: geoCoordMap['原市国税'].concat(data.原市国税),
                        symbol: 'image://' + sgs
                    }, {
                        name: '水务局',
                        value: geoCoordMap['水务局'].concat(data.水务局),
                        symbol: 'image://' + swj
                    }, {
                        name: '苏宁银行',
                        value: geoCoordMap['苏宁银行'].concat(data.苏宁银行),
                        symbol: 'image://' + snyh
                    }, {
                        name: '市民政',
                        value: geoCoordMap['市民政'].concat(data.市民政),
                        symbol: 'image://' + smz
                    }, , {
                        name: '市财政',
                        value: geoCoordMap['市财政'].concat(data.市财政),
                        symbol: 'image://' + sxcz
                    }, , {
                        name: '国土局',
                        value: geoCoordMap['国土局'].concat(data.国土局),
                        symbol: 'image://' + gtj
                    }, {
                        name: '西安市税务局',
                        value: geoCoordMap['西安市税务局'].concat(parseInt(data.原市国税) + parseInt(data.水务局) + parseInt(data.苏宁银行) + parseInt(data.市民政) + parseInt(data.市财政) + parseInt(data.国土局)),
                        itemStyle: {
                            normal: {
                                color: '#ffffff',
                                borderColor: '#000'
                            }
                        },
                        symbol: 'image://' + xxds
                    }]
                }]
            };
            myChart02.setOption(option02);
        });
    });


    //轮询切换数据
    function intervaldatas(){

        console.log("lx:",aa);
         if(aa==optionsdata1.length){
             aa=0;
         }else{
             aa=aa+1==optionsdata1.length?0:(aa+1);
             console.log("lx1:",aa);
         }
        $("#dwmc").text(optionsdata1[aa].BM);
        $("#lj").text(optionsdata1[aa].SJL);
        $("#bnd").text(optionsdata1[aa].SJL);
        $("#bjd").text("0");
        $("#byd").text("0");


    }
    var myChart04 = echarts.init(document.getElementById('main04'));
    myChart04.showLoading();
    var data2 = {
        name: "数据清匹配\n规则",
        children: [
            {
                "name": "清洗规则",
                "children": [
                    {"name": "自动清洗", "value": 4116},
                    {"name": "人工手动清洗", "value": 4116}
                ]
            },
            {
                "name": "匹配规则",
                "children": [
                    {
                        "name": "人",
                        "children": [
                            {"name": "纳税人名称", "value": 4116},
                            {"name": "工商注册号", "value": 4116},
                            {"name": "税务档案编号", "value": 4116},
                            {"name": "纳税人识别号", "value": 4116},
                            {"name": "社会信用代码", "value": 4116},
                            {"name": "自然人姓名+身份证", "value": 4116},
                            {"name": "楼盘信息关联匹配", "value": 4116},
                            {"name": "管理代码一一对应", "value": 4116}
                        ]
                    },
                    {"name": "事", "value": 1316},
                    {
                        "name": "物",
                        "children": [
                            {"name": "车船", "value": 4116},
                            {"name": "房产", "value": 4116},
                            {"name": "土地", "value": 4116},
                            {"name": "项目", "value": 4116}
                        ]
                    }
                ]
            }
        ]
    };

    myChart04.hideLoading();
    option04 = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
//  legend: {
//      top: '0%',
//     // left: '1%',
//      orient: 'vertical',
//      data: [
//      {
//          name: 'tree2',
//          icon: 'rectangle'
//      }],
//      borderColor: '#0091d0'
//  },
        series: [
            {
                type: 'tree',
                name: 'tree2',
                data: [data2],

                top: '0%',
                left: '20%',
                bottom: '22%',
                right: '35%',

                symbolSize: 10,

                label: {
                    normal: {
                        verticalAlign: 'middle',
                        align: 'right',
                        fontSize: 12,
                        color: '#d8fbfa'
                        // fontStyle: '600',
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

                animationDuration: 550, //进入动画时长，单位ms
                animationDurationUpdate: 750 //更新动画时长，单位ms
            }
        ]
    };
    myChart04.setOption(option04);
    var myChart5 = echarts.init(document.getElementById('main05'));

    //外部门数据状况
    $.post("${ctx}/main/homepage/externalSectorData", null, function (data) {
        option5 = {
            calculable: true,
            tooltip: {
                trigger: "item",
                formatter: "{a}<br/>{b}:{c}条"
            },
            calculable: true,
            legend: {
                icon: "circle",
                x: "center",
                y: "0",
                data: [
                    "原市国税",
                    "审计局",
                    "科技局",
                    "民政局",
                    "统计局",
                    "司法局",
                    "银行",
                    "住建局",
                    "电力局",
                    "物价局"
                ],
                textStyle: {
                    "color": "#fff"
                }
            },
            series: [{
                "name": "数据量",
                "type": "pie",
                "radius": [
                    17,
                    105
                ],
                "avoidLabelOverlap": false,
                "startAngle": 0,
                center: [
                    "50.1%",
                    "29%"
                ],
                roseType: "area",
                selectedMode: "single",
                label: {
                    "normal": {
                        "show": true,
                        "formatter": "{c}条"
                    },
                    "emphasis": {
                        "show": true
                    }
                },
                labelLine: {
                    "normal": {
                        "show": true,
                        "smooth": false,
                        "length": 5,
                        "length2": 5
                    },
                    "emphasis": {
                        "show": true
                    }
                },
                data: [{
                    "value": data[5].SJL,
                    "name": "原市国税",
                    "itemStyle": {
                        "normal": {
                            "color": "#f845f1"
                        }
                    }
                },
                    {
                        "value": data[25].SJL,
                        "name": "审计局",
                        "itemStyle": {
                            "normal": {
                                "color": "#ad46f3"
                            }
                        }
                    },
                    {
                        "value": data[26].SJL,
                        "name": "科技局",
                        "itemStyle": {
                            "normal": {
                                "color": "#5045f6"
                            }
                        }
                    },
                    {
                        "value": data[13].SJL,
                        "name": "民政局",
                        "itemStyle": {
                            "normal": {
                                "color": "#4777f5"
                            }
                        }
                    },
                    {
                        "value": data[6].SJL,
                        "name": "统计局",
                        "itemStyle": {
                            "normal": {
                                "color": "#44aff0"
                            }
                        }
                    },
                    {
                        "value": data[13].SJL,
                        "name": "司法局",
                        "itemStyle": {
                            "normal": {
                                "color": "#45dbf7"
                            }
                        }
                    },
                    {
                        "value": data[27].SJL,
                        "name": "银行",
                        "itemStyle": {
                            "normal": {
                                "color": "#f6d54a"
                            }
                        }
                    },
                    {
                        "value": data[36].SJL,
                        "name": "住建局",
                        "itemStyle": {
                            "normal": {
                                "color": "#f69846"
                            }
                        }
                    },
                    {
                        "value": data[28].SJL,
                        "name": "电力局",
                        "itemStyle": {
                            "normal": {
                                "color": "#ff4343"
                            }
                        }
                    },
                    {
                        "value": data[1].SJL,
                        "name": "物价局",
                        "itemStyle": {
                            "normal": {
                                "color": "#ff4343"
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    },
                    {
                        "value": 0,
                        "name": "",
                        "itemStyle": {
                            "normal": {
                                "label": {
                                    "show": false
                                },
                                "labelLine": {
                                    "show": false
                                }
                            }
                        }
                    }
                ]
            }]
        };
        myChart5.setOption(option5);
    });

    var myChart6 = echarts.init(document.getElementById('main06'));
    var data = [{
        "name": "商品房买卖\n合同备案信息",
        "value": 4771.95
    }, {
        "name": "市工商股权\n变更信息",
        "value": 107.09
    }, {
        "name": "原市国税税款\n申报入库信息",
        "value": 527.76
    }, {
        "name": "国土局土地\n出让信息",
        "value": 120.71
    }];
    var xData = [],
        yData = [];
    var min = 50;
    data.map(function (a, b) {
        xData.push(a.name);
        if (a.value === 0) {
            yData.push(a.value + min);
        } else {
            yData.push(a.value);
        }
    });
    option6 = {
        // backgroundColor:"#111c4e",
        color: ['#3398DB'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'line',
                lineStyle: {
                    opacity: 0
                }
            },
            formatter: function (prams) {
                if (prams[0].data === min) {
                    return "税种"
                } else {
                    return "涉税税收收入：" + prams[0].data + "万元"
                }
            }
        },
        legend: {
            data: ['直接访问', '背景'],
            show: false
        },
        grid: {
            left: '0%',
            right: '0%',
            bottom: '10%',
            top: '2%',
            height: '75%',
            containLabel: true,
            z: 22
        },
        xAxis: [{
            type: 'category',
            gridIndex: 0,
            data: xData,
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                lineStyle: {
                    color: '#0c3b71'
                }
            },
            axisLabel: {
                show: true,
                color: 'rgb(170,170,170)',
                // rotate:3,//倾斜度
                fontSize: 12,
                interval: 0
            }
        }],
        yAxis: [{
            type: 'value',
            gridIndex: 0,
            splitLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            min: min,
            max: 10000,
            axisLine: {
                lineStyle: {
                    color: '#0c3b71'
                }
            },
            axisLabel: {
                color: 'rgb(170,170,170)',
                formatter: '{value}'
            }
        },
            {
                type: 'value',
                gridIndex: 0,
                min: min,
                max: 100,
                splitNumber: 12,
                splitLine: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                splitArea: {
                    show: true,
                    areaStyle: {
                        color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)']
                    }
                }
            }
        ],
        series: [{
            name: '税种',
            type: 'bar',
            barWidth: '30%',
            xAxisIndex: 0,
            yAxisIndex: 0,
            itemStyle: {
                normal: {
                    barBorderRadius: 30,
                    color: new echarts.graphic.LinearGradient(
                        0, 0, 0, 1, [{
                            offset: 0,
                            color: '#00feff'
                        },
                            {
                                offset: 0.5,
                                color: '#027eff'
                            },
                            {
                                offset: 1,
                                color: '#0286ff'
                            }
                        ]
                    )
                }
            },
            data: yData,
            zlevel: 11

        },
            {
                name: '背景',
                type: 'bar',
                barWidth: '50%',
                xAxisIndex: 0,
                yAxisIndex: 1,
                barGap: '-135%',
                data: [100, 100, 100, 100],
                itemStyle: {
                    normal: {
                        color: 'rgba(255,255,255,0.1)'
                    }
                },
                zlevel: 9
            }

        ]
    };


    myChart6.setOption(option6);



</script>