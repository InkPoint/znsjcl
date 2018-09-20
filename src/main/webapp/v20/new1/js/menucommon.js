/**
 * Created with IntelliJ IDEA.
 * User: win7
 * Date: 18-5-15
 * Time: 上午11:22
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    //菜单项单击事件
    $("#content .btnlist").click(function(){
        var  urls="";
        var curval=$(this).val();
        //数据交换部分
        if(curval=="上传文件数据导入"){
            urls="sjjh/sjwjsc/initsjwjsc";
        }else if(curval=="水资源信息取用采集"){
            urls="sjjh/xxcj/initXxcj";
        }else if(curval=="导入任务定制"){
            urls="sjjh/drrwdz/initDrrwdz";
        }else if(curval=="导入任务监控"){
            urls="sjjh/drrwjk/initDrrwjk";
        }else if(curval=="任务实施反馈"){
            urls="sjjh/rwssfk/initRwssfk";
        }else if(curval=="任务进度监控"){
            urls="sjjh/rwjdjk/initRwjdjk";
        }else if(curval=="导入状况统计"){
            urls="sjjh/drzktj/initDrzktj";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }
        //数据处理
        if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }else if(curval=="数据验证"){
            urls="sjjh/sjyz/initSjyz";
        }
        window.location.href="${ctx}/"+urls;
    });

});
