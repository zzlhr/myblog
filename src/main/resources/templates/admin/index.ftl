<#include "header.ftl" />
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">

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
    })

</script>
</body>
</html>