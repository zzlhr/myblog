<#include "header.ftl" />
    <!-- 修改个人信息 -->
    <div style="padding: 15px;">
        <form class="layui-form" action="" method="">
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱:</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                </div>
            </div>

        </form>
    </div>
<#include "foot.ftl" />

<script>

    function init() {
        menuShow();
    }


    var menuJson = ${menus};
    

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