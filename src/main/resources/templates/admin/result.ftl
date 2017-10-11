<#include "header.ftl" />
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <div style="width: 70%; margin: auto">
            <p>${message}</p>
            <p><a href="${href}">点击跳转</a></p>
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