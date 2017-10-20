<#include "header.ftl" />
    <!-- 查看管理员列表 -->
    <div style="padding: 15px;">
        <div class="layui-row">
            <form class="layui-col-lg11" method="get" action="findAdminList.html">
                <div class="layui-form-item">
                    <label class="layui-form-label">管理员名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" lay-verify="required" placeholder="管理员名称" autocomplete="off" class="layui-input">
                    </div>
                    <input type="submit" value="查询" class="layui-btn">
                </div>
            </form>
            <a href="addAdminList.html" class="layui-btn">添加</a>
        </div>


        <table class="layui-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>管理员名称</th>
                <th>管理员邮箱</th>
                <th>状态</th>
                <th>登录ip</th>
                <th>IP地址</th>
                <th>创建时间</th>
                <th>最后更新时间</th>
                <th>所在权限组</th>
            </tr>
            </thead>
            <tbody id="adminTbody">

            </tbody>
        </table>

        <div id="page"></div>

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
    })
</script>
</body>
</html>