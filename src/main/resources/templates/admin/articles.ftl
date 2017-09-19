<!DOCTYPE html>
<html>
<head>
	<title>文章管理</title>
	<meta charset="UTF-8">

</head>
<style>
	.modal-dialog{
		width: 800px;
	}
</style>
<body>
	<div class="col-lg-12" style="margin-top: 10px">
		<div class="col-lg-11"></div>
		<div class="col-lg-1">
			<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#add-article">
				发表文章
			</button>
		</div>
	</div>
	<!-- 文章列表 -->
	<table class="table table-striped table-hover blog-admin-table">
		<thead>
		<tr>
			<th>文章序号</th>
			<th>文章标题</th>
			<th>发布人</th>
			<th>分类</th>
			<th>文章关键字</th>
			<th>点击数</th>
			<th>点赞数</th>
			<th>状态</th>
			<th>创建时间</th>
			<th>修改时间</th>
			<th>编辑</th>
		</tr>
		</thead>
		<tbody id="article-tbody">

        </tbody>
	</table>

	<!-- 编辑文章弹出层 -->
	<div class="modal fade" id="add-article" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">编辑文章</h4>
				</div>
				<div class="modal-body">
					<form id="addArticleForm" action="article-add.do" method="post" class="form-horizontal">
						<div class="form-group">
							<label for="articelTitile" class="col-lg-2 control-label">
								标题
							</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="articelTitile" name="articelTitile" placeholder="请输入文章标题">
							</div>
						</div>

						<div class="form-group">
							<label for="articleKeyword" class="col-lg-2 control-label">关键字</label>
							<div class="col-lg-10">
								<textarea class="form-control" name="articleKeyword" rows="3" id="articleKeyword"></textarea>
								<!--<span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>-->
							</div>
						</div>

						<div class="form-group">
							<label for="articleDescribe" class="col-lg-2 control-label">描述</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="3" name="articleDescribe" id="articleDescribe"></textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="clazz" class="col-lg-2 control-label">选择分类</label>
							<div class="col-lg-10">
								<select class="form-control" name="articleClass" id="clazz">
									<option value="未分类">未分类</option>
									<option value="java">Java</option>
									<option value="js">js</option>
									<option value="Linux">Linux</option>
									<option value="DB">DB</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="commend" class="col-lg-2 control-label">是否推荐</label>
							<div class="col-lg-10">
								<select class="form-control" name="articleCommend" id="commend">
									<option value="0">不推荐</option>
									<option value="1">推荐到首页</option>
									<option value="2">推荐到右侧</option>
								</select>
							</div>
						</div>


						<div class="form-group">
							<label for="status" class="col-lg-2 control-label">状态</label>
							<div class="col-lg-10">
								<select class="form-control" name="articleStatus" id="status">
									<option value="0">开放</option>
									<option value="1">不开放</option>
								</select>
							</div>
						</div>
						<textarea class="hidden" id="text" name="articleText"></textarea>
						<div id="articleText"></div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="addArticleBtn" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!--  确认删除弹出 -->
	<div class="modal fade" id="del-article" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">是否删除</h4>
				</div>
				<div class="modal-body">
					<label>确认要删除这篇文章吗？</label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary del-article-enter">确定</button>
				</div>
			</div>
		</div>
	</div>



</body>
<script type="text/javascript" src="js/wangEditor.min.js"></script>
<script>

	var tableData = ${articles};

    initUEditor();
    articleInit();


	var delArticleId = '';
    
	function articleInit() {
	    //设置删除按钮监听事件
		$('.del-article').on('click',function () {
            delArticleId = $(this).attr("name");
            $('#del-article').modal();
        })

		$('.del-article-enter').on('click', function () {
		    var id = delArticleId;
			//提交删除ajax
            $('#del-article').modal('hide');
        })

        //发送按钮被单机
        $('#addArticleBtn').on('click', function () {
            $('#addArticleForm').submit();
        })

		//待删除id
        var holdDelectId = '';
		//渲染数据
		for (var i=0;i<tableData.length;i++){
//            tableData = JSON.parse(tableData);
		    var row = '<tr>' +
                    '<td>'+tableData[i].id+'</td>' +
                    '<td>'+tableData[i].articleTitle+'</td>' +
                    '<td>'+tableData[i].articleAdmin+'</td>' +
                    '<td>'+tableData[i].articleClass+'</td>' +
                    '<td>'+tableData[i].articleKeyword+'</td>' +
                    '<td>'+tableData[i].articleClick+'</td>' +
                    '<td>'+tableData[i].articlePraise+'</td>' +
                    '<td>'+tableData[i].articleStatus+'</td>' +
                    '<td>'+tableData[i].createTime+'</td>' +
                    '<td>'+tableData[i].updateTime+'</td>' +
                    '<td>' +
                    '<a href="#" class="btn btn-primary btn-xs">修改</a>' +
                    '<button class="btn btn-primary btn-xs del-article" name="'+tableData[i].id+'" ' +
//					'data-toggle="model" data-target="#del-article">删除</button>' +
					'>删除</button>'
                    '</td>' +
                    '</tr>';

			$('#article-tbody').html($('#article-tbody').html()+row);
			
			//删除列表绑定事件
			$('.del-article').on('click', function () {
//				$(this).
                $('#del-article').modal('show');
                holdDelectId = $(this).attr("name");
			})




            //设置删除确定按钮监听时间
			$('.del-article-enter').on('click'， function () {
				//删除交互地址！



            })

		}
    }


    function initUEditor() {
        var E = window.wangEditor;
        var editor = new E('#articleText');
        editor.customConfig.onchange = function (html) {
            $('#text').text(html);
            console.log($('#text').text());
        }
        editor.create();
    }




</script>
<script>
</script>
</html>