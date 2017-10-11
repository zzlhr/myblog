<#include "header.ftl" />
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <form class="layui-form" action="addArticle.html", method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" class="layui-input" placeholder="请输入标题">
            </div>
            <label class="layui-form-label">文章分类</label>
            <div class="layui-input-inline">
                <input type="text" name="clazz" autocomplete="off" class="layui-input" placeholder="请输入文章分类">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">推荐</label>
            <div class="layui-input-block">
                <input type="radio" name="commend" value="0" title="不推荐" checked="">
                <input type="radio" name="commend" value="1" title="推荐到首页">
                <input type="radio" name="commend" value="2" title="推荐到右侧">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章关键字</label>
            <div class="layui-input-block">
                <input type="text" name="keyword" lay-verify="title" autocomplete="off" placeholder="请输入文章关键字" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">文章描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入文章描述" name="describe" class="layui-textarea"></textarea>
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
                <input class="layui-btn" type="submit" value="发表">
            </div>
        </div>
    </form>
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
//
//        //自定义验证规则
//        form.verify({
//            title: function(value){
//                if(value.length < 5){
//                    return '标题至少得5个字符啊';
//                }
//            }
//            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
//            ,content: function(value){
//                layedit.sync(editIndex);
//            }
//        });


//        //监听提交
//        form.on('submit(demo1)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
//            return false;
//        });


    });
</script>
</body>
</html>