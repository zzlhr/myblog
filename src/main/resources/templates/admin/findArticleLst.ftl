<#include "header.ftl"/>
        <!-- 内容主体区域 -->
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
                    <th>标题</th>
                    <th>管理员</th>
                    <th>关键字</th>
                    <th>点击数</th>
                    <th>分类</th>
                    <th>状态</th>
                    <th>最后更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="articleTbody">

                </tbody>
            </table>

            <div id="page"></div>

        </div>
<#include "foot.ftl"/>

<script>
    function init() {
        menuShow();
        dataShow();
    }

    var menuJson = ${menus};

    var articleList = ${articleList};

    var page_now = ${page};

    var page_total = ${totalPage};

    function dataShow() {

        var model = "<tr><td>{{id}}</td><td>{{title}}</td><td>{{admin}}</td><td>{{keyword}}</td>" +
                "<td>{{click}}</td><td>{{class}}</td><td>{{status}}</td><td>{{updatetime}}</td><td>" +
                "<a class='layui-btn-small' href='updateArticle.html?id={{id}}'>修改</a></td></tr>";
        var rec = '';
        for (var i = 0; i < articleList.length; i++){
            var article = articleList[i];
            var status = "显示";
            if (article.articleStatus != 0){
                status = "不显示"
            }
            rec += model.replace("{{id}}",article.id)
                    .replace("{{title}}",article.articleTitle)
                    .replace("{{admin}}", article.articleAdmin)
                    .replace("{{keyword}}", article.articleKeyword)
                    .replace("{{click}}", article.articleClick)
                    .replace("{{class}}",article.articleClass)
                    .replace("{{status}}",status)
                    .replace("{{updatetime}}", article.updateTime)
                    .replace("{{id}}",article.id);
        }
        $("#articleTbody").html(rec);
    }
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element
    });



    $("#page").pagination({
        currentPage: page_now,// 当前页数
        totalPage: page_total,// 总页数
        isShow: true,// 是否显示首尾页
        count: 5,// 显示个数
        homePageText: "首页",// 首页文本
        endPageText: "尾页",// 尾页文本
        prevPageText: "上一页",// 上一页文本
        nextPageText: "下一页",// 下一页文本
        callback: function(current) {
            // 回调,current(当前页数)
            console.log("current:"+current)
            window.location.href = changeUrlArg(window.location.href, "page", current);
        }
    });

    function changeUrlArg(url, arg, val){


    //替换
        var pattern = arg+'=([^&]*)';
        var replaceText = arg+'='+val;
        return url.match(pattern) ? url.replace(eval('/('+ arg+'=)([^&]*)/gi'), replaceText) : (url.match('[\?]') ? url+'&'+replaceText : url+'?'+replaceText);
    }
    $(document).ready(init());
</script>
</body>
</html>