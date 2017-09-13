<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <style>
        /*.layui-form-label{*/
            /*width: 90px;*/
        /*}*/
    </style>
</head>
<body>
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 90px;">管理员名称：</label>
            <div class="layui-input-inline">
                <input class="layui-input" id="select_name" type="text" name="title" placeholder="请输入管理员名称">
            </div>
            <div><input type="button" id="selectonname" class="layui-btn layui-btn-normal" value="搜索"></div>
        </div>
    </div>

    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col width="250">
            <col width="200">
            <col width="250">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
            <th>管理员名称</th>
            <th>管理员邮箱</th>
            <th>登录ip</th>
            <th>登录地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>

    <div style="margin-left: 48%;">
        <button id="load" class="layui-btn layui-btn-warm">加载更多</button>
    </div>

</body>
<script src="../ajax/ajax_admin.js"></script>
<script>
    var layer;
    layui.use('layer', function(){
        layer = layui.layer;

//        layer.msg('hello');
    });

    var selectname = '';
    var pageNumber = 1;

    function getdata() {
        //模板
        var model = '<tr>\n' +
            '            <td>#{id}</td>\n' +
            '            <td>#{name}</td>\n' +
            '            <td>#{email}</td>\n' +
            '            <td>#{ip}</td>\n' +
            '            <td>#{address}</td>\n' +
            '            <td>\n' +
            '                <button id="u#{id}" class="layui-btn layui-btn-primary layui-btn-mini updata_admin">修改</button>\n' +
            '                <button id="d#{id}" class="layui-btn layui-btn-primary layui-btn-mini delect_admin">删除</button>\n' +
            '                <button id="j#{id}" class="layui-btn layui-btn-primary layui-btn-mini disable_admin">禁用</button>\n' +
            '            </td>\n' +
            '        </tr>'

        

        //封装好数据方法
        getadminlist(selectname, pageNumber, function (data) {
            //判断是否到底
            if (data.data.total <= pageNumber){
                $('#load').removeClass("layui-btn-warm");
                $('#load').addClass("layui-btn-disabled");
                $('#load').html('已经到底了');
            }
            data = data.data.Data;

            for (var i=0;i<data.length;i++){
                var tr = model.replace(new RegExp("#{id}","gm"), data[i].id)
                    .replace("#{name}", data[i].adminName)
                    .replace("#{email}", data[i].adminEmail)
                    .replace("#{ip}", data[i].adminIp)
                    .replace("#{address}", data[i].adminAddress);
                $('#tbody').append(tr);
            }
            $(".updata_admin").on('click',function () {
                var id = $(this).attr('id');
                id = id.substr(1,id.length);
                console.log(id);

                //弹出修改
                var type = 'auto'
                    ,text =
                    '<div class="layui-form">' +
                    '  <div class="layui-form-item">\n' +
                    '    <label class="layui-form-label" style="">序号：</label>\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <input id="uid" type="text" name="title" lay-verify="title" autocomplete="off" disabled="" class="layui-input">\n' +
                    '    </div>\n' +
                    '  </div>' +
                    '  <div class="layui-form-item">\n' +
                    '    <label class="layui-form-label">名称：</label>\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <input type="text" name="title" lay-verify="title" autocomplete="off" value="" class="layui-input">\n' +
                    '    </div>\n' +
                    '  </div>' +
                    '  <div class="layui-form-item">\n' +
                    '    <label class="layui-form-label">邮箱：</label>\n' +
                    '    <div class="layui-input-block">\n' +
                    '      <input type="text" name="title" lay-verify="title" autocomplete="off" value="" class="layui-input">\n' +
                    '    </div>\n' +
                    '  </div>' +
                    '</div>';

                layer.open({
                    type: 1
                    ,area: ['500px','700px'] //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,offset: 1
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,content: '<div style="margin: 20px;">'+ text +'</div>'
                    ,btn: '修改'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    },success:function () {
                        $('#uid').val(id);
                        getadmindetails(id,function (data) {
                            console.log(data);
                        });
                    }
                });


            })
            pageNumber++;
        })

        //修改事件


    }
    getdata();
    
    
    //监听加载更多
    $('#load').on('click',function () {
        getdata();
    })


    //点击查询事件
    $('#selectonname').on('click', function () {

        selectname = $('#select_name').val();
        pageNumber = 1;
        $('#tbody').html('');
        getdata()
    })
    


</script>

</html>