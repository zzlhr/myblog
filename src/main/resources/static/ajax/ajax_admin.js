/**
 * 获取管理员列表
 * @param name  管理员名称
 * @param page  页数
 */
function getadminlist(name,page,callback) {
    var url = "admin_list.json"

    ajax(url,1,{admin_name: name, page: page}, function (data) {
        callback(data);
    });
}

function getadmindetails(id,callback) {
    var url = "admin_details.do?id="+id;

    ajax(url,0,function (data) {
        callback(data);
    });
}