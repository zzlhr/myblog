<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <div>
        <form class="layui-col-lg9" action="findAuth.html" method="get">
            <div class="layui-inline">
                <label>请选择权限组:</label>
                <div class="layui-input-inline">
                    <select id="groupId" name="groupId">
                    </select>
                </div>
                <input class="layui-btn layui-btn-mini" type="submit" value="选择">
            </div>
        </form>
        <div class="layui-col-lg3">
            <button id="addPermission" class="layui-btn layui-btn-mini">添加权限组</button>
            <button id="updatePermission" class="layui-btn layui-btn-mini">修改权限组</button>
            <button id="delectPermission" class="layui-btn layui-btn-mini">删除权限组</button>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <ul id="treeDemo" class="ztree"></ul>
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
    var possessAuth = ${possessAuth};

    /*
    * JSON数组去重
    * @param: [array] json Array
    * @param: [string] 唯一的key名，根据此键名进行去重
    */
    function uniqueArray(array, key){
        var result = [array[0]];
        for(var i = 1; i < array.length; i++){
            var item = array[i];
            var repeat = false;
            for (var j = 0; j < result.length; j++) {
                if (item[key] == result[j][key]) {
                    repeat = true;
                    break;
                }
            }
            if (!repeat) {
                result.push(item);
            }
        }
        return result;
    }


    var groups = ${groups};

    var menuJson = ${menus};

    function init() {
        //初始化权限树状图
        initGroups();
        menuShow();
        var doms = $("#groupId").children();
        for(var i=0;i<doms.length; i++){
            if($(doms[i]).val() == ${groupId?string}){
                $(doms[i]).attr("selected",true)
            }
        }
        
        
        $('#addPermission').on('click', function () {
            location.href = "addAuth.html";
        })
        $('#updatePermission').on('click',function () {
            location.href = "updateAuth.html?groupId="+${groupId};
        })
        $('#delectPermission').on('click',function () {
            var id = $("#groupId option:selected").val()
            location.href = "delectAuth.html?groupId="+${groupId};
        })

    }
    function initGroups() {
        var model = "<option value='{{id}}'>{{name}}</option>";
        var html = "<option value=''>请选择权限组</option>";
        for (var i = 0; i < groups.length; i++){
            html += model.replace("{{id}}", groups[i].id).replace("{{name}}", groups[i].groupName);
        }
        $('#groupId').html(html);
    }
    

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    $(document).ready(function(){
        var arrayTree = [];
        init();
        arrayTree = possessAuth.concat(authTree);
        arrayTree = uniqueArray(arrayTree, "id");
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, arrayTree);
    });
</script>
</body>
</html>