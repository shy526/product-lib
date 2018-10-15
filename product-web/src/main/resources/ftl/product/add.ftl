<!DOCTYPE html>
<!-- release v4.4.4, copyright 2014 - 2017 Kartik Visweswaran -->
<!--suppress JSUnresolvedLibraryURL -->
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>添加-产品</title>
    <link rel="stylesheet" href="/static/bootstrap/3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bootstrap-input/css/fileinput.min.css">
    <link rel="stylesheet" href="/static/bootstrap-input/themes/explorer-fa/theme.css">

    <script type="text/javascript" src="/static/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/static/common/dateFrom.js"></script>
    <script type="text/javascript" src="/static/bootstrap/3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/js/plugins/sortable.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/js/fileinput.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/js/locales/zh.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/js/locales/fr.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/js/locales/es.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/themes/explorer-fa/theme.js"></script>
    <script type="text/javascript" src="/static/bootstrap-input/themes/fa/theme.js"></script>
    <style>
        .kv-file-upload {
            display: none;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="row ">
        <div class="col-md-12">
            <div>
                <h1 class="text-center"><img class="img-responsive center-block"
                                             src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481"/
                    >添加产品</h1>
            </div>

        </div>
    </div>

    <div class="row" id="step-1">
        <h2>产品信息:</h2>
        <hr/>
        <div class="col-md-6">

            <div class="input-group" style="margin-bottom: 20px">
                <span class="input-group-addon">产品名</span>
                <input type="text" class="form-control" placeholder="产品名">
            </div>
        </div>
        <div class="col-md-6">

            <div class="input-group">
                <span class="input-group-addon">类型</span>
                <select class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        下拉
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">刷新</a></li>
                        <li><a href="#">分类管理</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="row" id="step-2" style="margin-bottom: 20px">
        <h2>产品图片:</h2>
        <hr/>
        <div class="col-md-12">
            <input id="kv-explorer" type="file" name="files" multiple>
        </div>
    </div>

    <div class="row" id="step-3">
        <div class="col-md-12">
            <div class="checkbox">
                <label>
                    <input type="checkbox">加入游客(guest)访问列表
                </label>
            </div>
            <button class="btn btn-primary" id="ajax-add">添加商品</button>
        </div>
    </div>
    <div class="row" id="step-tool>
        <div class="col-md-12">
            <div class="btn-group">
                <button type="button" class="btn btn-default">上一步</button>
                <button type="button" class="btn btn-default">下一步</button>
            </div>
        </div>
    </div>

</div>
</body>
<script>

   var addManger={
       step:{
           index:1,
           init:function () {
               $("#step-2").hide();
               $("#step-3").hide();
           },
           next:function () {
               addManger.step.index++;
           }
       }
   }
    $(document).ready(function () {
        $("#kv-explorer").fileinput({
            uploadAsync: false,
            language: 'zh', //设置语言
            showClose: false,
            showUploadedThumbs: false,
            showCancel: false,
            showUpload: false, //是否显示上传按钮
            uploadUrl: '/product/add',
            showBrowse: true,
            allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            dropZoneEnabled: false,//是否显示拖拽区域
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            msgFileNotReadable: "文件 {name} 未找到!"
        });

        $("#ajax-add").click(function () {
            $("#kv-explorer").fileinput("upload");
        })
        addManger.step.init();
    });
</script>
</html>