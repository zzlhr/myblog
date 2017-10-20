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
    function init() {
        setDate();
        menuShow();
    };


    function setDate() {
        var model = '<span id="f{{id}}" class="layui-badge layui-bg-blue" style="font-size: 30px;">{{name}}</span>';
        var code = '';
        for(var i=0; i<friendLinks.length; i++){
            code += model.replace("{{id}}", i).replace("{{name}}", friendLinks[i].linkValue);
        }

        $("#friendlinks").html(code);

    }



    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
    $(document).ready(function () {
        init();
    });
</script>
</body>
</html>