<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<!-- 处理响应式 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>三月，醉一场青春的流年</title>
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
            <li><a href="http://builtwithbootstrap.com/" target="_blank">登录</a></li>
            <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">注册</a></li>
          </ul>

        </div>
      </div>
   </div>

	<div class="container" style="margin-top: 10px;">
		
		<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 blog-article-div">
			<!--
            	作者：lhr5533@126.com
            	时间：2017-05-26
            	描述：关于
            -->
			<!--<label>关于我</label>-->
			<div>
				<div class="center-block">
					<div class="col-lg-10 blog-article">
						<h4 id="article-title"></h4>
						<p id="about-article"></p>
						<article id="article-text">


						</article>
					</div>
				</div>
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
	                <div class="panel-body">
	                	<ul class="list-group blog-commend-left">

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
	var article = ${article};
	
	function init() {

	    var aboutarticle =
				'<small>作者：(author)&nbsp;|&nbsp;发布时间：(createTime)&nbsp;|&nbsp;点击数：(click)&nbsp;</small>';

        aboutarticle = aboutarticle.replace('(author)', article.articleAdmin)
				.replace('(createTime)', article.createTime)
				.replace('(click)', article.articleClick);

        $('#article-title').html(article.articleTitle);

        $('#about-article').html(aboutarticle);

        $('#article-text').html(article.articleText);

        setAbout();

        setNewArticle();

    }

    init();



</script>
</html>
