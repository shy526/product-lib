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

    <div class="row" id="step-1"  style="margin-bottom: 20px">
        <h2>产品信息:</h2>
        <hr/>
        <div class="col-md-6">

            <div class="input-group" style="margin-bottom: 20px">
                <span class="input-group-addon">产品名</span>
                <input type="text" class="form-control" placeholder="产品名" name="name">
            </div>
        </div>
        <div class="col-md-6">

            <div class="input-group">
                <span class="input-group-addon">类型</span>
                <select class="form-control" name="typeId">

                </select>
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        菜单
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li id="btn-refresh"><a href="javascript:void(0)">刷新</a></li>
                        <li><a href="/page/type/manager" target="_blank">分类管理</a></li>
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
        <h2>产品权限:</h2>
        <div class="col-md-12">
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="power" value="0">加入游客(guest)访问列表
                </label>
            </div>

        </div>
    </div>
    <div class="row" id="step-tool>
        <div class=" col-md-12
    ">
    <div class="btn-group">
        <button type="button" class="btn btn-default" id="previous" style="display: none">上一步</button>
        <button type="button" class="btn btn-default" id="next">下一步</button>
        <button class="btn btn-primary" id="ajax-add" style="display: none">添加商品</button>
    </div>
</div>
</div>

</div>
</body>
<script>

    var addManger = {
        ajax: {
            typeAll:function (func) {
                $.ajax({
                    url: "/type/all",
                    type: "post",
                    success: func
                })
            }
        },
        initCat:function(){
            addManger.ajax.typeAll(function (result) {
                if (result.code==200){
                    $("select[name='typeId']").empty()
                    for (let i=0;i<result.data.length;i++){
                        $("select[name='typeId']").append("<option value='"+result.data[i].id+"'>"+result.data[i].name+"</option>")
                    }
                }
            })
        },
        step: {
            index: 1,
            maxIndex: 3,
            init: function () {
                $("#step-2").hide();
                $("#step-3").hide();
            }
            ,
            next: function () {
                if (addManger.step.index<addManger.step.maxIndex) {
                    $("#step-" + addManger.step.index).hide();
                    addManger.step.index++;
                    $("#step-" + addManger.step.index).show();
                }
                return addManger.step.index;

            }
            ,
            previous: function () {
                if (addManger.step.index >1){
                    $("#step-" + addManger.step.index).hide();
                    addManger.step.index--;
                    $("#step-" + addManger.step.index).show();
                }
                return addManger.step.index;

            }
        },
        initUpload:function(){
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
                msgFileNotReadable: "文件 {name} 未找到!",
                uploadExtraData : function() {  //传递参数
                    return {
                        typeId:$("select[name='typeId']").val(),
                        guest:$("input[name='power']").prop("checked")?0:1,
                         name:$("input[name='name']").val()
                    };
                }
            }).on('filebatchuploadsuccess', function(event, data, previewId, index) {
                if (confirm("添加成功,继续添加")){
                    window.location.reload();
                }else {
                    window.location.href="/"
                }

            }).on('filebatchuploaderror', function(event, data, msg) {
                alert("添加错误,请检查该产品")

            })


        },
        binding: function () {
            $("#next").click(function () {
                let index = addManger.step.next();
                if (index==3){
                    $(this).hide();
                    $("#ajax-add").show();
                }else {
                    $(this).show();
                    $("#previous").show();
                    $("#ajax-add").hide();
                }
            })
            $("#previous").click(function () {
                let index = addManger.step.previous();

                if (index==1){
                    $(this).hide();
                    $("#ajax-add").hide();
                }else {
                    $("#next").show()
                    $(this).show()
                    $("#ajax-add").hide();
                }
            })
            $("#ajax-add").click(function () {
                let typeId = $("select[name='typeId']").val();
                if (!typeId){
                    alert("没有选择分类");
                    return;
                }
                let power = $("input[name='power']").prop("checked");
                let name = $("input[name='name']").val();
                if (!name){
                    alert("产品名称不能为空");
                    return;
                }
                let files = $("input[name='files']").val();
                if (!files){
                    alert("至少上传一张图片");
                    return;
                }
                 $("#kv-explorer").fileinput("upload");

            })
            $("#btn-refresh").click(function () {
                addManger.initCat();
            })
        },
        init:function () {
            addManger.initUpload();
            addManger.step.init();
            addManger.binding();
            addManger.initCat();
        }
    }
    $(document).ready(function () {
        addManger.init();

    });
</script>
</html>