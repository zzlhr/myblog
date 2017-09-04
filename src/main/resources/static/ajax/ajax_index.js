
function getdata(callback) {

    //获取菜单,暂时处理单层
    ajax("menulist.do",0,'',function (data) {
        if((data = JSON.parse(data)).code == 0){
            callback(data.data);
        }else {
            callback(data);
        }
    })
}