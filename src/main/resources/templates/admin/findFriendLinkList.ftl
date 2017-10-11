<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <div id="friendlinks" class="layui-row">

    </div>
</div>
<#include "foot.ftl" />

<script>

    var menuJson = ${menus};
    var friendLinks = ${friendLinks}

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
    
    function setDate() {
        var model = '<span id="f{{id}}" class="layui-badge layui-bg-blue" style="font-size: 30px;">{{name}}</span>';
        var code = '';
        for(var i=0; i<friendLinks.length; i++){
            code += model.replace("{{id}}", i).replace("{{name}}", friendLinks[i].linkValue);
        }

        $("#friendlinks").html(code);

    }

    setDate();

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>