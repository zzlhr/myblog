<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<!-- 处理响应式 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>关于</title>
    <meta name="keyword" content="${website.websiteKeyword}">
    <meta name="description" content="${website.websiteDescribe}">
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

	<div class="container-fluid" style="margin-top: 10px;">
		
		<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
			<h2>关于</h2>
			<hr />
			<!--
            	作者：lhr5533@126.com
            	时间：2017-05-26
            	描述：关于
            -->
			<!--<label>关于我</label>-->
			<div class="visible-lg visible-md "></div>
			<div class="">
				<div class="center-block">
					<div class="col-lg-10">
						<h4>关于我</h4>
						<p class="text-right"><small>永不放弃对技术的追求。</small></p>
						<p>姓名：刘浩然</p>
						<p>英文缩写：lhr</p>
						<p>性别：男</p>
						<p>出生地：河南平顶山</p>
						<p>现居：河南郑州</p>
						<p>爱好：一切美好的事物！</p>
						<p> </p>
						<hr />
						<p> </p>
						<h4>关于博客</h4>
						<p class="text-right"><small>不断追求完美。</small></p>
						<p>服务器：阿里云</p>
						<p>域名：myheibai.cn</p>
						<p>架构语言：Java</p>
						<p>框架：spring boot</p>
						<p>前端：boostrap</p>
					</div>
				</div>
			</div>
			<div class="visible-lg visible-md col-lg-1 col-md-3"></div>
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
	                <div class="panel-body">
	                	<ul class="list-group blog-commend-left">
	                	</ul>
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
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="ajax/base.js"></script>
<script>
    var friendLinks = ${friendLinks};

    function init() {
        var leftarticles = ${leftArticles};
        var aboutme = ${aboutme};
        setAbout(aboutme);
        setNewArticle(leftarticles);
        setFriendLink();
    }

    init();


</script>

