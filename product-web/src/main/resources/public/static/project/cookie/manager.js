/**
 * 检查 cookie 并提供几个常用的方法
 * @type {{getAccessId: (function(): *), ajax: {login: cookieManger.ajax.login}, auto: cookieManger.auto}}
 */

var cookieManger={
    /**
     *  获取cookie中的id
     */
    getAccessId:function () {
        return $.cookie('access');
    },
    ajax:{
        /**
         * 登录请求
         * @param accessKey
         * @param func
         */
        login:function (accessKey, func) {
            $.ajax({
                url: "/accesskey/login",
                type: "post",
                data: {
                    accessKey: accessKey,
                },
                success: func
            })
        },
        /**
         * 获取登录的access
         * @param id
         * @param func
         */
        check:function (id, func) {
            $.ajax({
                url: "/accesskey/name",
                type: "post",
                data: {
                    id: id,
                },
                success: func
            })
        }
    },
    /**
     * 自动登录
     */
    auto:function () {
        let accessId = cookieManger.getAccessId();
        if (!accessId){
            cookieManger.ajax.login("guest",function (result) {
                if (result.code==200){
                    console.log("自动登录:guest");
                }else {
                    alert("登录异常,请检查你的邀请码");
                }
                window.location.href="/"
            })
        }
    }
}

console.log("auto login check");
cookieManger.auto();

