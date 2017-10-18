<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <div>
        <form class="layui-col-lg9" action="updateAuth.html" method="get">
            <div class="layui-inline">
                <label>请选择权限组:</label>
                <div class="layui-input-inline">
                    <select id="groupId" name="groupId">
                    </select>
                </div>
                <input class="layui-btn layui-btn-mini" type="submit" value="选择">
            </div>
        </form>
        <button id="updateAuth" class="layui-btn">更新权限组</button>
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
    $(document).ready(function(){
        var arrayTree = [];
        arrayTree = possessAuth.concat(authTree);
        arrayTree = uniqueArray(arrayTree, "id");
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, arrayTree);
    });
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

    function init() {
        //初始化权限树状图
        initGroups();
        var doms = $("#groupId").children();
        for(var i=0;i<doms.length; i++){
            if($(doms[i]).val() == ${groupId?string}){
                $(doms[i]).attr("selected",true)
            }
        }
        $('#updateAuth').on("click",function () {
            updateAuth();
        })
    }
    init();
    function initGroups() {
        var model = "<option value='{{id}}'>{{name}}</option>";
        var html = "<option value=''>请选择权限组</option>";
        for (var i = 0; i < groups.length; i++){
            html += model.replace("{{id}}", groups[i].id).replace("{{name}}", groups[i].groupName);
        }
        $('#groupId').html(html);
    }
    
    function updateAuth() {
        var data = zTreeObj.getCheckedNodes(true);
        var dataArray = [];
        for (var i=0;i<data.length;i++){
            var auth = {
                "pid":data[i].PId,
                "id":data[i].id
            }
            dataArray.push(auth);
        }

        console.log(dataArray);
        $.ajax({
            url: "updateAuth.html",
            type: "post",
            data: {
                "auths": JSON.stringify(dataArray),
                "groupId": ${groupId}
            },
            success:function (data) {
                alert(data);
            },error:function (error) {
                console.log(error)
            }
        })
    }



    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>