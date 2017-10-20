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


    function init() {
        menuShow();
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