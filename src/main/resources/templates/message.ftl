<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<!-- 处理响应式 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>黑白的博客</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/custom.min.css" />
	<link rel="stylesheet" type="text/css" href="css/blog3.css" />
</head>
<body style="background-color: #f6f6f6">
	<div class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <a href="index.html" class="navbar-brand">HeiBai小站</a>
		  <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		</div>
		<div class="navbar-collapse collapse" id="navbar-main">
		  <ul class="nav navbar-nav">
			<li class="dropdown">
			  <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">分类 <span class="caret"></span></a>
			  <ul class="dropdown-menu" aria-labelledby="themes">
				<li><a href="articles.html?cs=java">Java</a></li>
				<li><a href="articles.html?cs=js">js</a></li>
				<li><a href="articles.html?cs=linux">Linux</a></li>
				<li><a href="articles.html?cs=db">DB</a></li>
			  </ul>
			</li>
			<li>
			  <a href="message.html">留言板</a>
			</li>
			<li>
			  <a href="works.html">作品展示</a>
			</li>
			<li>
			  <a href="about.html">about</a>
			</li>
		  </ul>

		  <ul class="nav navbar-nav navbar-right">
			<li class="form-group" style="margin-bottom: 0px;">
				<input type="text" class="form-control" placeholder="Search" style="margin-top: 7px;">
			</li>
			<li><a href="#" target="_blank">登录</a></li>
			<li><a href="#" target="_blank">注册</a></li>
		  </ul>

		</div>
	  </div>
   </div>


	<!--
		作者：lhr5533@126.com
		时间：2017-05-21
		描述：内容
	-->
	<div class="container-fluid" style="margin-top: 10px;">
		<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
			<div class="clearfix">
				<h2 class="pull-left">留言板</h2>
                <button class="pull-right btn btn-primary" data-toggle="modal" data-target="#sendMessage" style="margin-top: 20px;">发表留言</button>
			</div>
            <hr />
			<!--
				作者：lhr5533@126.com
				时间：2017-05-20
				描述：留言列表
			-->
			<div id="messagelist" class="raw">


			</div>

		</div>
		<!--
			作者：lhr5533@126.com
			时间：2017-05-21
			描述：右侧栏目
		-->
		<div style="margin-top: 20px;">
			<div class="visible-lg col-lg-3">

				<div class="panel panel-primary">
					<div class="panel-heading">
					  <h3 class="panel-title">关于我</h3>
					</div>
					<div class="panel-body blog-about">
					</div>
				  </div>

				  <div class="panel panel-primary">
					<div class="panel-heading">
					  <h3 class="panel-title">最新文章</h3>
					</div>
					<div class="panel-body blog-commend-left">

					</div>
				  </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">友情链接</h3>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group blog-friendlink">

                        </ul>
                    </div>
                </div>
			</div>
		</div>
	</div>

	<!-- 留言 -->
    <div class="modal fade" id="sendMessage" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">发表留言</h4>
                </div>
                <form class="form-horizontal" method="post" action="message-send.do">

					<div class="modal-body">
						<div class="form-group">
							<label class="col-lg-3 control-label"><span style="color: red;">*</span>昵称：</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" name="name" placeholder="请输入昵称">
							</div>
						</div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label"><span style="color: red;">*</span>联系方式：</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control" name="link" placeholder="请输入联系方式">
                            </div>
                        </div>
						<div id="sendEditor">

						</div>
						<textarea class="hidden" name="text" id="sendText">

						</textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="发表">
					</div>
                </form>
			</div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="ajax/base.js"></script>
<script type="text/javascript" src="js/wangEditor.min.js"></script>
<script>
	var messages = ${messages};
    var friendLinks = ${friendLinks};

    function init() {
		
        setAbout();

        setNewArticle();

        setData();

        initEditor();
        setFriendLink();


    }

    function initEditor() {
        var e = window.wangEditor;
        var editor = new e('#sendEditor');
        editor.customConfig.menus = [
            'head',  // 标题
            'bold',  // 粗体
            'italic',  // 斜体
            'underline',  // 下划线
            'strikeThrough',  // 删除线
            'foreColor',  // 文字颜色
            'backColor',  // 背景颜色
            'link',  // 插入链接
            'list',  // 列表
            'justify',  // 对齐方式
            'quote',  // 引用
            'emoticon',  // 表情
            'image',  // 插入图片
            'table',  // 表格
            'video',  // 插入视频
            'code'  // 插入代码
        ];

        /* 监听内容发生改变 */
        editor.customConfig.onchange = function (html) {
            // html 即变化之后的内容
            console.log(html)
            $('#sendText').html(html);
            console.log($('#sendText').html())
        }

        editor.create();


    }
    
    function setData() {

        var model = '<div class="clearfix"style="margin-bottom: 30px;">' +
				'<!--头像-->' +
				'<div class="blog-message">' +
				'<div class="pull-left"style="padding-right: 10px;">' +
				'<a href="#">' +
				'<img class="media-object"style="width:32px;height:32px;border-radius:32px"src="images/header.jpg"alt="...">' +
				'</a>' +
				'</div><!--id和日期-->' +
				'<div>' +
				'<h5 style="margin-bottom: 0px; margin-top: 0px;">(name)</h5>' +
				'<p>' +
				'<small>(createtime)</small>' +
				'</p></div>' +
				'<p>(message)</p>' +
				'<div>' +
				'	<p><a href="#">黑白：</a>奋斗吧,趁年轻.</p>' +
				'</div>' +
				'</div><!--留言-->' +
				'<div class="clearfix">' +
				'<div class="visible-xs pull-right">' +
				'<button class="btn btn-sm btn btn-primary">评论</button></div>' +
				'<div class="hidden-xs pull-right"><a>评论</a></div></div><hr/></div>';
        var html = ''
		for (var i=0;i<messages.length;i++){
			html += model.replace('(name)', messages[i].messageName)
					.replace('(createtime)', messages[i].createTime)
					.replace('(message)', messages[i].messageValue)
		}
		$('#messagelist').html(html);
    }

    init();

</script>
</html>
