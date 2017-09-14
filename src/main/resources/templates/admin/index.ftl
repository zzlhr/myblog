<!DOCTYPE html>
<html>
<head>
	<title>后台管理系统</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/blog-admin.css">
</head>
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">黑白博客后台管理系统</a>
    </div>
  	<ul class="nav navbar-nav navbar-right">
	    <li><a href="#"><span class="glyphicon glyphicon-user"></span>admin</a></li>
	</ul>
    </div>
  </div>
</nav>

<!-- 内容整体 -->
<div>
	<div class="col-lg-2 blog-admin-main">
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							文章管理
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body blog-admin-left-item">
						<ul class="list-group">
							<li class="list-group-item blog-left-nav-item" data-name="articles" data-url="articles.html">文章管理</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
							留言管理
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body blog-admin-left-item">
						<ul class="list-group">
							<li class="list-group-item blog-left-nav-item" data-name="messages" data-url="messages.html">留言管理</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
							管理员管理
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body blog-admin-left-item">
						<ul class="list-group">
							<li class="list-group-item blog-left-nav-item" data-name="admins" data-url="admins.html">管理员管理</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>




	<div class="col-lg-10">
		<ul id="tab-list" class="nav nav-tabs">

		</ul>

		<div id="myTabContent" class="tab-content">

		</div>
	</div>
</div>


</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/admin.js"></script>
<script type="text/javascript">




	var init = init();



</script>
</html>