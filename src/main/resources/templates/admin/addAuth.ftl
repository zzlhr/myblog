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
    var zTreeObj;
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

    // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
//    var zNodes = [
//        {name:"test1", id: 1128, open:true},
//            {name:"test1_1", id:1124,pId:1128}, {name:"test1_2", id:1125,pId:1128},
//        {name:"test2", id:1234,open:true},
//            {name:"test2_1", id:1126,pId:1234}, {name:"test2_2", id:1127, pId:1128}
//    ];

    var authTree = ${authTree};
    <#--var possessAuth = ${possessAuth};-->
    $(document).ready(function(){
//        var arrayTree = [];
//        arrayTree = possessAuth.concat(authTree);
//        arrayTree = uniqueArray(arrayTree, "id");
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, authTree);
    });

    <#--var groups = ${groups};-->

    var menuJson = ${menus};
    function menuShow() {
        var code = '';
        for (var i=0;i<menuJson.length;i++){
            var model = '<li class="layui-nav-item layui-nav-itemed">' +
                    '          <a class="">{{name}}</a>' +
                    '          <dl class="layui-nav-child">' +
                    '            {{item}}'+
                    '          </dl>' +
                    '        </li>';

            var modelCode = model.replace("{{name}}",menuJson[i].modelName)

            var itemModel = '<dd><a href="{{href}}">{{name}}</a></dd>';

            var item = ''
            var itemJson = menuJson[i].operates;
            for(var j=0;j<itemJson.length;j++){
                item += itemModel.replace("{{href}}",itemJson[j].operateCodename+".html").replace("{{name}}",itemJson[j].operateName)
            }
            code += modelCode.replace("{{item}}", item);
        }
        $("#menunav").html(code);
    }
    menuShow();

//    $("#savePermission").on("click",function () {
//        var checked = zTreeObj.getCheckedNodes(true);
//        var array = [];
//        for(var i = 0; i < checked.length; i++){
//            var value = checked[i].id;
//            array.push(value);
//        }
//        $.ajax(
//                url: "addAuth.html",
//                data : {
//            "type":2,
//                    "group":,
//            "permissions": array
//        },
//        type : "post"
//    )
//    })
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>