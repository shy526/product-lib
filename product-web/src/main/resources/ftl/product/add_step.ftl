<!DOCTYPE html>
<html lang="n">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/static/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/static/step/css/jquery.step.css">
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
</head>
<body>

<#--<div class="jumbotron text-center">
    <h1></h1>
    <p>重置浏览器大小查看效果!</p>
</div>-->

<div class="container">
    <div class="row gap">
        <div class="cter">

            <h1><img src="/static/images/dengpao.png" style=" height: 63px;">添加产品</h1>
        </div>

    </div>
    <div class="row gap">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" id="step"></div>
        <div class="col-sm-2"></div>
    </div>
    <div class="row gap">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="padding-top: 40px">
            <div class="step-0">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">名称</span>
                    </div>
                    <input type="text" class="form-control" placeholder="产品名称" name="name">
                </div>
                <div class="input-group" style="padding-top: 30px;" >
                    <div class="input-group-prepend">
                        <span class="input-group-text">类目</span>
                    </div>
                        <select class="form-control" name="typeId">

                        </select>
                    <div class="btn-group btn-group-sm">
                        <button type="button" class="btn btn-primary" id="refresh-cate">刷新</button>
                        <a type="button" class="btn btn-success" href="/product/type/page/list" target="_blank">添加</a>
                    </div>

                </div>
            </div>
            <div class="step-1" style="display:none;padding-top: 10px">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
                    <div class="layui-upload-list">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>文件名</th>
                                <th>大小</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="demoList"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="step-2" style="display:none">
                <button type="button" class="layui-btn" id="testListAction">添加产品</button>
            </div>
            <div class="step-3" style="display:none"  >
                <button type="button" class="layui-btn" id="continue">继续添加</button>
                <button type="button" class="layui-btn" id="home">返回产品库</button>
            </div>
        </div>
        <div class="col-sm-2"></div>

    </div>
    <div class="row gap" style="padding-top: 10px;">
        <div class="col-sm-4"></div>
        <div class="col-sm-2">
            <button id="nextBtn" class="btn btn-primary">下一步</button>
        </div>
        <div class="col-sm-1">
        </div>
        <div class="col-sm-2">
            <button id="prevBtn" style="display:none" class="btn btn-primary">上一步</button>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>

</body>
<script src="/static/bootstrap4/js/jquery.js"></script>
<script src="/static/bootstrap4/js/bootstrap.js"></script>

<script src="/static/step/js/jquery.step.min.js"></script>
<script src="/static/layui/layui.all.js" charset="utf-8"></script>
<script src="/static/my/add_step.js" charset="utf-8"></script>


</html>