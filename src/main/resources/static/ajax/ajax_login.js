

function login(adminname, password, callback) {
    var url = "login.do";

    var data = {
        admin: adminname,
        password: password
    };

    var type = 1;

    ajax(url,type,data,callback);

}