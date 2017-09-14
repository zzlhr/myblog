function tabDo(){
	var obj = new Object();
	obj.close = function(dom){
		console.log("close tab");
		//删除tab
		var a = $(dom).parent();
		var divdom = a.attr('href');
		a.parent().remove();
		//删除tab对应的div
		$(divdom).remove();
	}
    /**
	 * 添加选择卡
     * @param name 选择卡name作为dom操作元素
     * @param title	选择卡显示标题
	 * @param url 选择卡打开url
     */
	obj.add = function (name, title, url) {
		//取消所有选择状态
		$('.nav-tabs').children(".active").removeClass("active");
		$('#myTabContent').children(".active").removeClass("in");
        $('#myTabContent').children(".active").removeClass("active");


		var html = $('.nav-tabs').html();
		$('.nav-tabs').html(html + '<li class="active"><a href="#tab-'+name+'" data-toggle="tab">'+title+' &nbsp;<span class="glyphicon glyphicon-remove close-tab"></span></a></li>');
		var model = '<div class="tab-pane fade active in" id="tab-'+name+'"></div>'
		$('#myTabContent').html($('#myTabContent').html()+model);
		$('#tab-'+name).load(url);
    }
	
	
	return obj;

}

function init(){
    var tab = tabDo();
    $('.close-tab').on('click', function(){
		tab.close(this);
	})
	
	
	$('.blog-left-nav-item').on('click',function () {
		var title = $(this).html();
        var name = $(this).attr('data-name');
        var url = $(this).attr('data-url');



        var tabList = $('#tab-list').children();

        for (var i=0; i<tabList.length; i++){
        	if($(tabList[i]).children('a').attr("href") == "#tab-"+name){
				//执行选中后返回
                $(tabList[i]).siblings().removeClass('active');
                $(tabList[i]).addClass('active');
                $('#myTabContent').children('.active').removeClass('in');
                $('#myTabContent').children('.active').removeClass('active');

                $($(tabList[i]).children('a').attr("href")).addClass('in');
                $($(tabList[i]).children('a').attr("href")).addClass('active');
				return;
            }
        }

    	tab.add(name,title,url);
        $('.close-tab').on('click', function(){
            tab.close(this);
        })
	})
}

