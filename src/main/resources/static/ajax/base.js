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
    return "http://localhost:8080"
}


function getAbout(callback) {
    ajax(baseurl()+"/about.json", 0, '',function (data) {
        callback(data);
    })
}


function setAbout() {
    var about;
    if(sessionStorage.getItem("about") == null){
        getAbout(function (data) {
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