<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <form class="layui-form" action="updateArticle.html", method="post">
        <input class="layui-hide" id="ide" name="id", value="">
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="title" autocomplete="off" class="layui-input" placeholder="请输入标题">
            </div>
            <label class="layui-form-label">文章分类</label>
            <div class="layui-input-inline">
                <input type="text" name="clazz" id="clazz" autocomplete="off" class="layui-input" placeholder="请输入文章分类">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">推荐</label>
            <div class="layui-input-block">
                <input type="radio" name="commend" value="0" id="t0" title="不推荐">
                <input type="radio" name="commend" value="1" id="t1" title="推荐到首页">
                <input type="radio" name="commend" value="2" id="t2" title="推荐到右侧">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否显示</label>
            <div class="layui-input-block">
                <input type="checkbox" name="status" id="status" lay-skin="switch" lay-filter="switchTest" lay-text="显示|不显示">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章关键字</label>
            <div class="layui-input-block">
                <input type="text" name="keyword" id="keyword" lay-verify="title" autocomplete="off" placeholder="请输入文章关键字" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入文章描述" id="describe" name="describe" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文章内容</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input class="layui-btn" type="submit" value="修改">
            </div>
        </div>
    </form>
</div>
<#include "foot.ftl" />

<script>

    var menuJson = ${menus};

    var articled = ${article}

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

    setArticle();
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit;


        //创建一个编辑器
        layedit.set({
            uploadImage: {
                url: 'addArticleUpdate' //接口url
                ,type: 'post' //默认post
            }
        });

        var editIndex = layedit.build('LAY_demo_editor',{
            tool: [
                'strong' //加粗
                ,'italic' //斜体
                ,'underline' //下划线
                ,'del' //删除线

                ,'|' //分割线

                ,'left' //左对齐
                ,'center' //居中对齐
                ,'right' //右对齐
                ,'link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image' //插入图片
                ,'help' //帮助
            ]
        });

    });
    
    
    function setArticle() {
        $("#ide").val(GetQueryString("id"));
        $("#title").val(articled.articleTitle);
        $("#clazz").val(articled.articleClass);
        if(articled.articleCommend === 0){
            $("#t0").attr("checked","")
        }else if (articled.articleCommend === 1){
            $("#t1").attr("checked","")
        }else if (articled.articleCommend === 2){
            $("#t2").attr("checked","")
        }
        $("#keyword").val(articled.articleKeyword);
        $("#describe").val(articled.articleDescribe);
        $("#LAY_demo_editor").val(articled.articleText);
        if(articled.articleStatus == 0){
            $("#status").attr("checked","")
        }


    }

    function GetQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
</script>
</body>
</html>