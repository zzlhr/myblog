/**
 * ajax封装
 * @param url   请求地址
 * @param type  请求类型 0:get,1:post 默认为get
 * @param data  请求数据，可控
 */
function ajax(url, type, data,callback) {
    $.ajax({
        url: url,
        type: (type == 1) ? 'get':'post',
        data: data,
        success:function (result) {
            callback(result);
        },error:function (error) {
            callback(error)
        }
    })
}



function baseurl() {
    // return "http://blog.myheibai.cn"
    return "http://localhost:8080"
}

function setFriendLink() {
    var models = ''
    for (var i=0;i<friendLinks.length;i++){
        var friendLink = friendLinks[i];
        var model = "<a href='(href)'>(name)</a>&nbsp;&nbsp;";
        model = model.replace('(href)', friendLink.linkUrl).replace('(name)', friendLink.linkValue);
        models += model;
    }
    $('.blog-friendlink').html(models)
}

/**
 * 设置关于
 */
function setAbout() {
    var about;
    if(sessionStorage.getItem("about") == null){
        ajax(baseurl()+"/about.json", 0, '',function (data) {
            about = data;
            var model = "<p>姓名："+about.aboutName+"</p>" +
                "<p>性别："+about.aboutSex+"</p>" +
                "<p>爱好："+about.aboutHobby+"</p>" +
                "<p>座右铭："+about.aboutMotto+"</p>" +
                "<p>"+about.aboutOther+"</p>";
            $('.blog-about').html(model);
        })
    }else {
        about = sessionStorage.getItem("about");
        var model = "<p>姓名："+about.aboutName+"</p>" +
            "<p>性别："+about.aboutSex+"</p>" +
            "<p>爱好："+about.aboutHobby+"</p>" +
            "<p>座右铭："+about.aboutMotto+"</p>" +
            "<p>"+about.aboutOther+"</p>";
        $('.blog-about').html(model);
    }
}


function setNewArticle() {

    var model = '<li class="list-group-item clearfix" style="padding: 5px;">' +
        '<p class="blog-li-text15" style="margin: 0px;"><a class="pull-left" href="(href)">(title)</a></p>' +
        '<span class="pull-right">(time)</span>' +
        '</li>'

    ajax("/articles.json",0,'',function (data) {
        var mhtml = '';

        for (var i = 0; i < data.length; i++){
            mhtml += model.replace('(href)', baseurl() + "/article.html?id=" + data[i].id)
                .replace('(title)', data[i].title)
                .replace('(time)', data[i].time);
        }

        $('.blog-commend-left').html(mhtml);
    })
    
}
