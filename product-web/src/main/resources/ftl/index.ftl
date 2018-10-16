<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--视口的设置，让网页能等比例的缩放到对应设备中-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--告诉ie浏览器用最新内核去渲染网页-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>产品库</title>
    <link rel="stylesheet" href="/static/bootstrap/3/css/bootstrap.min.css">
</head>
<body>


<style type="text/css">
    .container .items {
        border: 1px solid #EEEEEE;
        padding: 10px;
        margin-bottom: 15px;
    }

    .row {
        margin-bottom: 10px;
    }

</style>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div>


                <h1 class="text-center"><img class="img-responsive center-block"
                                             src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481"/
                    >产品库</h1>

            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="input-group">
                <div class="input-group-btn">
                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown"id="carte">
                        分类<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" id="carte_menu">
                        <li data-id="-1" ><a href="javascript:void(0)" >所有</a></li>
                    </ul>
                </div>
                <input type="text" class="form-control">
                <div class="input-group-btn">
                    <button class="btn btn-default" style="width: 80px;">
                        <span class="glyphicon glyphicon-search">搜索</span>
                    </button>
                    <button class="btn btn-default" style="width: 80px;" id="btn-yqm">
                        邀请码
                    </button>
                    <div class="btn-group" id="btn-manager" style="display: none">
                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            管理<span class="caret" id="cate"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="/page/type/manager">分类管理</a></li>
                            <li><a href="/page/access/manager">邀请码管理</a></li>
                            <li><a href="/page/product/add">添加产品</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </div>
<#--卡片-->
    <div id="cards">
    </div>
    <div class="row">
        <div class="col-md-12">
            <p class="text-success text-center" id="mmm" style="display: none">没有更多数据了</p>
        </div>

    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">邀请码</h4>
            </div>
            <div class="modal-body">
                <p>当前邀请码: <span class="text-success" id="wname">guest</span></p>
                <div class="form-group" id="d-name">
                    <label for="f-name">邀请码</label>
                    <input type="text" class="form-control" placeholder="请输入邀请码" name="name">
                </div>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn-login">切换</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/jquery/jquery.min.js"></script>

<script type="text/javascript" src="/static/bootstrap/3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="/static/project/cookie/manager.js"></script>
<script>
    var indexManager = {
        ajax: {
            typeAll:function (func) {
                $.ajax({
                    url: "/type/all",
                    type: "post",
                    success: func
                })
            },
            productPage:function (data,func) {
                $.ajax({
                    url:"/product/page",
                    type:"post",
                    data:data,
                    success: func
                })
            }
        },
        binding: function () {
            $("#btn-login").click(function () {
                let val = $("input[name='name']").val();
                if (!val) {
                    alert("邀请码不能为空");
                    return;
                }
                cookieManger.ajax.login(val, function (result) {
                    if (result.code == 200) {
                        window.location.reload();
                    }
                    else {
                        alert("切换失败,邀请码有误");
                    }
                })
            })
            $("#btn-yqm").click(function () {
                $('#myModal').modal('show')
            })
        },
        pageHelp:{
            page:1,
            flag:true,
            dataArray:[],
            /**
             * 下一页码
             */
            next:function () {
                indexManager.ajax.productPage({page:indexManager.pageHelp.page},function (result) {
                    if(result.code==200){
                        if (result.data.length<=0){
                            indexManager.pageHelp.flag=false
                            $("#mmm").show();
                        }
                        indexManager.pageHelp.page++;
                        indexManager.pageHelp.xuanran(result.data)
                        indexManager.pageHelp.dataArray=indexManager.pageHelp.dataArray.concat(result.data);
                    }else {
                        indexManager.pageHelp.flag=false
                        $("#mmm").show();
                    }
                })
            },
            checkScrollbar:function () {
                setTimeout(function () {
                    let flag=document.body.scrollHeight > (window.innerHeight || document.documentElement.clientHeight);
                    if (!flag){
                        if(indexManager.pageHelp.flag ){
                            indexManager.ajax.productPage({page:indexManager.pageHelp.page},function (result) {
                                if(result.code==200){
                                    if (result.data.length>0){
                                        indexManager.pageHelp.xuanran(result.data)
                                        indexManager.pageHelp.dataArray=indexManager.pageHelp.dataArray.concat(result.data);
                                        indexManager.pageHelp.checkScrollbar();
                                    } else {
                                        indexManager.pageHelp.flag=false
                                        $("#mmm").show();
                                    }
                                    indexManager.pageHelp.page++;
                                }else {
                                    indexManager.pageHelp.flag=false
                                    $("#mmm").show();
                                }
                            })

                        }
                    }
                })

            },
            xuanran:function(data){
                if (data){

                    for (let i=0;i<data.length;i++){
                        let index=$("#cards").children(".row:last-child").attr("data-index")
                        if (!index||index==4){
                            $("#cards").append("<div class=\"row\" data-index=\"0\"> </div>")
                        }
                        $("#cards").children(".row:last-child").append(
                                "        <div class=\"col-lg-3 col-md-4\" data-id='"+data[i].productType.id+"'>\n" +
                                "                <div class=\"items text-center\" >\n" +
                                "                    <img class=\"img-responsive\"\n" +
                                "                         src='"+data[i].imgResources[0].showUrl+"'/>\n" +
                                "                    <h3>"+data[i].name+"</h3>\n" +
                                "                    <p>标签</p>\n" +
                                "                    <p>介绍</p>\n" +
                                "                </div>\n" +
                                "            </div>")
                        let x=parseInt($("#cards").children(".row:last-child").attr("data-index"))+1;
                        $("#cards").children(".row:last-child").attr("data-index",x)
                    }
                }
            },
            monitorScrollbar:function () {
                $(window).scroll(function () {

                    //浏览器的高度加上滚动条的高度
                    let h = parseFloat($(window).height()) + parseFloat($(window).scrollTop());

                    if ($(document).height() <= h&&indexManager.pageHelp.flag) {

                       indexManager.pageHelp.next();
                    }
                });
            },
            init:function () {
                indexManager.pageHelp.checkScrollbar();
                indexManager.pageHelp.monitorScrollbar();
            }
        },
        check:function(){
          let accessId = cookieManger.getAccessId();
          cookieManger.ajax.check(accessId,function (result) {
              if (result.code==200){
                  $("#wname").text(result.data.accessKey)
                  if (result.data.managerPower==0) {
                      $("#btn-manager").show()
                  }
              }else {
                  alert("登录异常");
              }
          })
        },
        initCat:function(){
            indexManager.ajax.typeAll(function (result) {
                if (result.code==200){
                    if (result.data){
                        for (let i=0;i<result.data.length;i++){
                            $("#carte_menu").append("<li data-id='"+result.data[i].id+"'><a href=\"javascript:void(0)\">"+result.data[i].name+"</a></li>")
                        }
                        $("#carte_menu>li").click(function () {
                            let jQuery = $(this).children("a").eq(0).text();
                            $("#carte").text(jQuery);
                            let attr = $(this).attr("data-id");
                            $("#cards").empty();
                            if (attr==-1){
                               indexManager.pageHelp.xuanran(indexManager.pageHelp.dataArray);
                                return;
                            }
                            let array=[]
                            for (let i=0;i<indexManager.pageHelp.dataArray.length;i++){
                                if (attr==indexManager.pageHelp.dataArray[i].typeId){
                                    array.push(indexManager.pageHelp.dataArray[i])
                                }
                            }
                            indexManager.pageHelp.xuanran(array);
                        })
                    }
                }
            })
        },
        init:function () {
            indexManager.initCat();
            indexManager.check();
            indexManager.binding();
            indexManager.pageHelp.init()
        },
    }

    $(function () {
        indexManager.init();
    })

</script>
</body>
</html>
