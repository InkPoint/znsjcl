<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${ctx }/static/jquery-easyui-1.4/themes/${themeName }/easyui.css" type="text/css" rel="stylesheet" />
<link href="${ctx }/static/jquery-easyui-1.4/themes/icon.css" type="text/css" rel="stylesheet">
<script src="${ctx}/static/jquery-easyui-1.4/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/static/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
    (function ($) {
        var buttonDir = {north: 'down'};
        $.extend($.fn.layout.paneldefaults, {
            onBeforeCollapse: function () {
                var popts = $(this).panel('options');
                var dir = popts.region;
                var btnDir = buttonDir[dir];
                if (!btnDir) return false;
                setTimeout(function () {
                    if (popts.title) {
                        var vTitle = popts.title;
                        $('.layout-button-' + btnDir).closest('.layout-expand').find('.panel-title').css({textAlign: 'left'}).html("<div>" + vTitle + "<div style='float: right;margin-right:20px;'>展开查看查询条件</div></div>")
                    }
                }, 100)
            }
        })
    })(jQuery)
</script>