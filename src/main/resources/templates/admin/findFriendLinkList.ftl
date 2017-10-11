<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <div style="padding: 15px;">
        <div class="layui-row">
            <form class="layui-col-lg11" method="get" action="findArticleLst.html">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题关键字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="keyword" lay-verify="required" placeholder="请输入关键字" autocomplete="off" class="layui-input">
                    </div>
                    <input type="submit" value="查询" class="layui-btn">
                </div>
            </form>
            <a href="addArticle.html" class="layui-btn">添加</a>
        </div>


        <table class="layui-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>链接名称</th>
                <th>链接地址</th>
                <th>添加管理员</th>
                <th>状态</th>
                <th>位置</th>
                <th>添加时间</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="friendLinkTbody">

            </tbody>
        </table>
    </div>
</div>
<#include "foot.ftl" />

<script>

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


    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>