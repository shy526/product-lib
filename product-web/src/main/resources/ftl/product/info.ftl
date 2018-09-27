<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap.css"
    <link href="/static/imageplug/style.css" type="text/css" rel="stylesheet">

    <title>${name}</title>
    <style>
        .gap {
            padding: 30px;
        }

        .cter {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <style>

        #gallery img {
            border: none;
        }

        #gallery_nav {
            /*    float: left;
                width: 150px;*/
            border: 1px solid rgba(0, 0, 0, .05);
            text-align: center;
        }

        #gallery_nav img {
            width: 50px;
            border: 1px solid #D0D0D0;
        }

        #gallery_output {
            /*  float: left;*/
            width: 100% px;
            overflow: hidden;
        }

        #gallery_output img {
            width: 100%;
            display: block;
            margin: 0px auto 0 auto;
        }

        /*产品名*/
        .name_h1 {
            line-height: 1;
            font-size: 16px;
            font-weight: 700;
            color: #000;
        }

        /*卖点*/
        .new {
            font-size: 14px;
            color: #FF0036;
        }

        .tm-fcs-panel {
            background-color: #e9e9e9;

        }

        .tm-yen {
            color: #FF0036;
            font-size: 18px;
            font-weight: bolder;
            float: left;
        }

        .tm-price {
            color: #FF0036;
            font-size: 24px;
            font-weight: bolder;
            float: left;
        }

        .tb-metatit {
            width: 69px;
            margin: 0 0 0 8px;
            float: left;
        }

        .tm-price-cur {
            line-height: 30px;
        }
        .tm-ind-panel{
            border: 1px dotted #c9c9c9;
            border-width: 1px 0;
            margin: -1px 20px 0 0;
            padding: 10px 0;
            position: relative;
            overflow: hidden;
            clear: both;
            display: flex;
        }
        .tm-ind-item {
            float: left;
            width: 33%;
            text-align: center;
            position: relative;
            left: -1px;
            border-left: 1px solid #e5dfda;
            flex: 1;
            line-height: 16px;
        }
        li, ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }
       .tm-label {
           display: inline-block;
           line-height: 16px;
           height: 16px;
           color: #999;
       }
        .tm-count {
            display: inline-block;
            line-height: 16px;
            height: 16px;
            font-weight: 700;
            margin-left: 3px;
        }
        .tm-indcon {
            display: inline-block;
            margin: 0 auto;
            line-height: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="content">
        <div class="row gap">
            <div class="col-sm-6">
                <div id="gallery">
                    <div id="gallery_output">
                        <img id="img1" src="/static/images/img01.jpg"/>
                        <img id="img2" src="/static/images/img02.jpg"/>
                        <img id="img3" src="/static/images/img03.jpg"/>
                    </div>
                    <div class="clear"></div>
                    <div id="gallery_nav">
                        <a rel="img1" href="javascript:;"><img src="/static/images/img01.jpg"/></a>
                        <a rel="img3" href="javascript:;"><img src="/static/images/img02.jpg"/></a>
                        <a rel="img2" href="javascript:;"><img src="/static/images/img03.jpg"/></a>
                        <a rel="img4" href="javascript:;"><img src="/static/images/img01.jpg"/></a>
                        <a rel="img1" href="javascript:;"><img src="/static/images/img01.jpg"/></a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <h1 class="name_h1">Skechers斯凯奇男鞋秋冬绑带低帮鞋 健步减震休闲运动鞋 54165</h1>
                <p class="new">第四代Go Walk健步系列，舒适缓震</p>
                <div class="tm-fcs-panel">
                    <dl class="tm-price-cur tm-fcs-panel">
                        <dt class="tb-metatit">价格:</dt>
                        <dd>
                            <em class="tm-yen">¥</em>
                            <span class="tm-price">699.00</span>
                        </dd>
                    </dl>
                </div>
                <ul class="tm-ind-panel">
                    <li class="tm-ind-item" data-label="月销量" style="display: none;"></li>
                    <li class="tm-ind-item">
                        <div class="tm-indcon">
                            <span class="tm-label" >创建日期</span>
                            <span class="tm-count" style="color: #280;">49506</span>
                        </div>
                    </li>

                    <li class="tm-ind-item ">
                        <div class="tm-indcon">
                            <span class="tm-label">更新日期</span>
                            <span class="tm-count" style="color: #FF0036;">279</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>


</body>
<!-- Optional JavaScript -->
<script src="/static/bootstrap4/js/jquery.js"></script>
<script src="/static/bootstrap4/js/bootstrap.js"></script>

</html>


<#--<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>-->
	<script language="javascript">

        $(document).ready(function () {
            $("#gallery_output img").not(":first").hide();

            $("#gallery a").click(function () {
                if ($("#" + this.rel).is(":hidden")) {
                    $("#gallery_output img").slideUp();
                    $("#" + this.rel).slideDown();
                }
            });
        });

    </script>