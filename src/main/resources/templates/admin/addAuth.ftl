<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <div>
        <form class="layui-col-lg6" action="addAuth.html" method="post">
            <input class="layui-hide" name="type" value="1">
            <div class="layui-inline layui-col-lg4" style="margin-right: 10px;">
                <label class="layui-form-label">权限组名称:</label>
                <div class="layui-input-block">
                    <input type="text" name="name" lay-verify="name" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <input class="layui-btn " type="submit" value="添加">
        </form>
    </div>

</div>
<#include "foot.ftl" />
<script type="application/javascript" src="../js/jquery.ztree.all.min.js"></script>
<script>
    
    
    function init() {
        menuShow();
    }


    var zTreeObj;
    var authTree = ${authTree};
    var setting = {
        check: {
            enable: true,
            autoCheckTrigger: false,
            chkStyle: "checkbox",
            chkboxType: {"Y": "ps", "N": "s"},
            nocheckInherit: false,
            chkDisabledInherit: true,
            radioType: "level"
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "PId",
                rootPId: 0
            },
            key:{
                checked: "isChecked"
            }
        }
    };




    var menuJson = ${menus};

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    $(document).ready(function(){
        init();
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, authTree);
    });
</script>
</body>
</html>