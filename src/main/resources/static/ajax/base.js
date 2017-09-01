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
    return "http://localhost:8080/"
}