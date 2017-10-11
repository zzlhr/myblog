<!DOCTYPE html>
<html>
<head>
	<title>后台登录</title>
	<link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
	<style>
		.layui-colla-item{
			width: 40%;
			margin: auto;
		}
	</style>
</head>
<body>
	<div class="layui-colla-item">
		<h2 class="layui-colla-title">登录</h2>
		<form class="layui-colla-content layui-show" action="login.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">管理员账号</label>
                <div class="layui-input-block">
                    <input type="text" name="admin" required  lay-verify="required" placeholder="请输入管理员账号" autocomplete="off" class="layui-input">
				</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">管理员密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" required  lay-verify="required" placeholder="请输入管理员密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                    <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
                </div>
            </div>
		</>
	</div>
</body>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
</html>