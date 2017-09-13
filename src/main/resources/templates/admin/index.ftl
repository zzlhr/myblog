<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>黑白的博客-后台管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        .layui-body{
            left: 205px;
        }
    </style>
</head>


<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">黑白博客后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul id="left-nav" class="layui-nav layui-nav-tree"  lay-filter="test">
                <!-- 左侧菜单li -->
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
            <ul id="tabs" class="layui-tab-title">
            </ul>
            <div id="item" class="layui-tab-content">
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © myheibai.cn - 黑白的小站
    </div>
</div>
<script src="../layui/layui.min.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../ajax/base.js"></script>
<script src="../ajax/ajax_index.js"></script>
<script>

    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });

    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });


    getdata(function (data) {
        var model = "<li class=\"layui-nav-item\" onclick='jump(this,\"#{uri}\")'><a >#{name}</a></li>";
        for (var i=0;i<data.length;i++){
            var menu = data[i];
            document.getElementById("left-nav").innerHTML
                += model.replace("#{uri}",baseurl()+ menu.menuUri).replace("#{name}", menu.menuName);
        }
    });





    function jump(dom,url) {

        var timestamp = new Date().getTime();
        $('#tabs').children('.layui-this').removeClass("layui-this");
        $('#tabs').prepend('<li class="layui-this '+timestamp+'">'+$(dom).children('a').html()+'<i class="layui-icon layui-unselect layui-tab-close i'+timestamp+'">ဆ</i></li>');

        $('#item').children('.layui-show').removeClass('layui-show');
        $('#item').prepend('<div class="layui-tab-item layui-show '+timestamp+'"></div>');
        $('#item').children('.layui-show').load(url);
        $('.i'+timestamp).on('click',function () {
            $('.'+timestamp).remove();
        })
    }








</script>


</body>
</html>