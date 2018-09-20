<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>bootstrap基本信息查询</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.js"></script>
    <script src="${ctx}/assets/js/bootstrap-editable.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/js/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/weather-icons.min.css" />

    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/animate.min.css" />

    <script src="${ctx}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${ctx}/assets/js/beyond.min.js"></script>


</head>
<body>
    <div> <table class="table   table-bordered table-hover" id="mytab"></table></div>

</body>
</html>
<script>


    $(function(){
        $.ajax({
            url:'${pageContext.request.contextPath}/demos/basicQuery/qwmconcat',
            datatype:'json',
            success:function(data1){
                $('#mytab').bootstrapTable("destroy");
                $('#mytab').bootstrapTable({
                    data:data1,
                    search: false, //是否启用搜素
                    showRefresh: false, //刷新按钮
                    showPaginationSwitch: false,
                    pagination: false, //是否分页
                    singleSelect: false,
//                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
//                    pageSize: 10, //每页的记录行数
//                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    onlyInfoPagination: false,
                    //sidePagination: "client",//表示客户端请求
                    paginationLoop: false,
                    uniqueId: 'RN',
//            idField:'TAXREGCODE',
                    clickToSelect: true, //是否启用点击选中行
                    uniqueIS: "bm", //每一行的唯一标识，一般为主键列
                    showToggle: "false", //切换视图
                    showColumns: 'false', //是否显示内容列下拉框

                    onClickRow:function(row,$element){
                        curRow=row;
//                console.log("row:",row);
                    },
                    columns: [

                        {
                            field: 'bm',
                            align: 'center',
                            title: '部门名称',
                            width:'20%',
                            formatter:function(value,row,index){
                                return value;
                            }

                        }, {
                            field: 'tabname',
                            halign:'center',
                            align: 'left',
                            title: '设计的表' ,
                            width:'80%' ,
                            formatter:function(value,row,index){
                                var aa= decodeURIComponent(value);
                                var allstr="";
                                var myarr=aa.split(".");
                                $.each(myarr,function(indexs,values){
                                    var everydata=values.split("@");
                                    if(indexs==0){
                                            myarr='<a href="'+everydata[0]+'">'+everydata[1]+'</a>';
                                    }else{
                                            myarr=myarr+', <a href="'+everydata[0]+'">'+everydata[1]+'</a>';
                                    }
                                });
                                return myarr;
                            }
                        } ],

                    onLoadSuccess:function(){

                        //添加行编辑模式
                        $("#mytab a").editable({
                            url:function(params){
                                var aname=$(this).attr("name");
                                curRow[aname]=params.value;
                            }
                        });

                    }
                });
            }
        });

//        var aaa=$('#mytab').bootstrapTable('getData');
//        var bbb=$('#mytab').bootstrapTable("getOptions");

    });



</script>
