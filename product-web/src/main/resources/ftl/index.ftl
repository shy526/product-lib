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
    <div class="row ">
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
                    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        分类<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">菜单项1</a></li>
                        <li><a href="#">菜单项2</a></li>
                        <li><a href="#">菜单项3</a></li>
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
                </div>
            </div>
        </div>

    </div>
<#--卡片-->
    <div class="row">
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive"
                     src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481"/>
                <h3>名称</h3>
                <p>标签</p>
                <p>介绍</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/yarn.png?1507601668481"/>
                <h3>Bootstrap 编码规范</h3>
                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/react.png?1507601668481"/>
                <h3>Bootstrap 编码规范</h3>
                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/webpack.png?1507601668481"/>
                <h3>Bootstrap 编码规范</h3>
                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
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
                <p>当前邀请码: <span class="">xxxxx</span></p>
                <div class="form-group"id="d-name">
                    <label for="f-name">邀请码</label>
                    <input type="text" class="form-control" placeholder="请输入邀请码" name="name">
                </div>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="ajax-login">切换</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/static/bootstrap/3/js/bootstrap.min.js"></script>
<script>

    $("#btn-yqm").click(function () {
        $('#myModal').modal('show')
    })
/*    $(window).scroll(function () {
        //浏览器的高度加上滚动条的高度
        var h = parseFloat($(window).height()) + parseFloat($(window).scrollTop());
        if (nowH > h) {
            //这里防止重复加载
            return;
        }
        console.log("现在的高：" + $(document).height() + "现在的高：" + h)
        nowH = h;
        if ($(document).height() <= h) {
            console.log("开始加载数据")
        }
    });*/
</script>
</body>
</html>
