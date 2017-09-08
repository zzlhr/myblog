<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<!-- 处理响应式 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>文章列表</title>
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
	                <!--<li><a href="articles.html?cs=易语言">易语言</a></li>-->
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
	            <li><a href="http://builtwithbootstrap.com/" target="_blank">登录</a></li>
	            <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">注册</a></li>
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
					<h2 class="pull-left">文章列表</h2>
				</div>
				<hr />
				<!--
	            	作者：lhr5533@126.com
	            	时间：2017-05-20
	            	描述：文章列表
	            -->
	            <div id="articlelist" class="raw">
	            	<!-- 文章列表 -->

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
		                  <p>姓名：刘浩然</p>
		                  <p>性别：男</p>
		                  <p>就职于：河南通信软件科技有限公司</p>
		                  <p>爱好：一个人安安静静的敲代码（迫不得已）</p>
		                  <p>座右铭：定一个大目标和一堆小目标，规划好自己的时间，一步一步向前走。</p>
		                  <p>给一些刚入行或在迷茫的coder的寄语：不管大家因为什么选择coder这个职业，喜欢也好，有所图也好，前者需要的是不断努力；后者需要的是做好一件事的决心，然后成为前者。</p>
		                </div>
		              </div>
		              
		              <div class="panel panel-primary">
		                <div class="panel-heading">
		                  <h3 class="panel-title">最新文章</h3>
		                </div>
		                <div class="panel-body">
		                	<ul class="list-group">
		                		<li class="list-group-item clearfix" style="padding: 5px;">
		                			<a class="pull-left" herf="article.html">
		                				<p class="blog-li-text15" style="margin: 0px;">不断学习，不断进步，挑战自己，超越自己</p>
		                			</a>
		                			<span class="pull-right">2017-5-21 17:31:00</span>
		                		</li>
		                		<li class="list-group-item clearfix" style="padding: 5px;">
		                			<a class="pull-left" herf="article.html">
		                				<p class="blog-li-text15" style="margin: 0px;">不断学习，不断进步，挑战自己，超越自己</p>
		                			</a>
		                			<span class="pull-right">2017-5-21 17:31:00</span>
		                		</li>
		                		<li class="list-group-item clearfix" style="padding: 5px;">
		                			<a class="pull-left" herf="article.html">
		                				<p class="blog-li-text15" style="margin: 0px;">不断学习，不断进步，挑战自己，超越自己</p>
		                			</a>
		                			<span class="pull-right">2017-5-21 17:31:00</span>
		                		</li>
		                	</ul>
		                </div>
		              </div>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="ajax/base.js"></script>
<script>

	var articles = ${articles};
    function init() {
        var model = '<div class="clearfix panel panel-default blog-article-li" style="margin-bottom: 30px;">' +
                '<a href="(href)"><h4>(title)</h4></a>' +
                '<p><small>作者：(admin)&nbsp;|&nbsp;发布时间：(time)&nbsp;</small><small class="hidden-xs hidden-sm">|&nbsp;点击数：(click)&nbsp;|&nbsp;赞：(praise)</small></p>' +
                '<p><b>摘要:</b>&nbsp;(describe)</p>' +
                '<div class="visible-xs pull-right"><a href="(href)" class="btn btn-sm btn-success">查看详情</a></div>' +
                '</div>'

//	    articles = JSON.parse(articles);
        var tmodel = "";
        for (var i=0;i<articles.length;i++){
            var article = articles[i];
            tmodel += model.replace('(title)', article.articleTitle)
                    .replace('(admin)', article.articleAdmin)
                    .replace('(time)', article.updateTime)
                    .replace('(click)',article.articleClick)
                    .replace('(praise)', article.articlePraise)
                    .replace('(describe)', article.articleDescribe)
                    .replace('(href)', 'article.html?id=' + article.id)
                    .replace('(href)', 'article.html?id=' + article.id);
        }
//		console.log(tmodel);
        $('#articlelist').html(tmodel);

        setAbout();
    }

    init();

</script>
</html>
