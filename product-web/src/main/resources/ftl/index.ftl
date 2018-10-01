<!DOCTYPE html>
<html lang="zh-cmn-Hans" style="    background: #252525;">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>xx产品库</title>

    <link rel="stylesheet" type="text/css" href="static/index/css/demo.css">
    <link rel="stylesheet" href="static/index/css/main.css">
    <link rel="stylesheet" href="static/index/dist/sortable.min.css">

    <style>
        .seek_c{
            height: 36px;!important;
            float: left;
            border: 1px solid #b6b6b6;
            border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;
            background: #fff;
            display: inline-block;
            vertical-align: top;
            width: 539px;
            margin-right: 0;
            border-right-width: 0;
            border-color: #b8b8b8 transparent #ccc #b8b8b8;
            overflow: hidden;
        }
        .seek{
            height: 22px;
            line-height: 22px;
            margin: 6px 0 0 7px;
            padding: 0;
            background: transparent;
            border: 0;
            outline: 0;
            -webkit-appearance: none;
            top: 0px;
            right: 0px;
            display: block;
            width: 500px;
            font: 16px arial;
        }
        .seek_click{
            width: 100px;
            height: 36px;
            color: #fff;
            font-size: 15px;
            letter-spacing: 1px;
            background: #3385ff;
            border-bottom: 1px solid #2d78f4;
            outline: medium;
            *border-bottom: 0;
            -webkit-appearance: none;
            -webkit-border-radius: 0;
            border: 0;
            padding: 0;
        }
        .ytitle{
            color: #fff;
            padding-top: 10px;
            display: flex;
            justify-content: center;
            margin-top: 0;
        }
    </style>

</head>
<body>

<main class="sortable">

    <div class="container">
        <h1 class="ytitle">产品库</h1>
        <div class="sortable__nav nav" style="padding: 20px 0;">
                <span class="seek_c">
                    <input class="seek" >
                </span>
                <span style="float: left;">
                    <input class="seek_click" type="submit" value="搜索">
                </span>

        </div>
        <div class="wrapper" style="    padding: 10px 0;!important;">
            <ul class="sortable__nav nav" id="cate">
                <li>
                    <a data-sjslink="all" class="nav__link">
                        所有
                    </a>
                </li>
            </ul>
            <div id="sortable" class="sjs-default">

                <#--<div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-2.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 2</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum vitae necessitatibus,
                                dolorem similique vero explicabo...
                            </p>
                        </div>
                    </div>
                </div>-->

            </div>
        </div>
    </div>
</main>
<script src="/static/bootstrap4/js/jquery.js"></script>
<script type="text/javascript" src="/static/index/dist/sortable.min.js"></script>
<script src="/static/layui/lay/modules/layer.js"></script>
<script type="text/javascript">


    function createCate() {
        $("#cate").empty()
        let html="       <li>\n" +
                "                    <a data-sjslink=\"all\" class=\"nav__link\">\n" +
                "                        所有\n" +
                "                    </a>\n" +
                "                </li>";
        $("#cate").append(html);
        $.ajax({
            url: "/product/type/all",
            success: function (result) {
                if (result==null) {
                    layer.msg('类目加载异常');
                    return;
                }
                    for (let i=0;i<result.length;i++){
                        let html="       <li>\n" +
                                "                    <a data-sjslink='"+result[i].id+"' class=\"nav__link\">\n" +
                                result[i].id+
                                "                    </a>\n" +
                                "                </li>";
                        $("#cate").append(html);

                    }
                createItem()
            }
        })
    }
    createCate();
    function createItem() {
        $("#sortable").empty();
        $.ajax({
            url: "/product/all",
            success: function (result) {
                if (result==null) {
                    layer.msg('产品加载异常');
                    return;
                }
                    for (let i=0;i<result.length;i++){
                        let html="<div data-sjsel='"+result[i].typeId+"'>\n" +
                                "                    <div class=\"card\">\n" +
                                "                        <img class=\"card__picture\" src='"+result[i].imgResources[0].showUrl+"' alt=\"\">\n" +
                                "                        <div class=\"card-infos\">\n" +
                                "                            <h2 class=\"card__title\">"+result[i].name+"</h2>\n" +
                                "                            <p class=\"card__text\">\n" +
                                "描述"
                                "                            </p>\n" +
                                "                        </div>\n" +
                                "                    </div>\n" +
                                "                </div>";
                        $('#sortable').append(html);
                    }
                document.querySelector('#sortable').sortablejs();

            }
        })
    }

</script>


</body>
</html>