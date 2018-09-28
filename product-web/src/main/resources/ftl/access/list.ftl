<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap.css">
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap-grid.css">
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap-reboot.css">
    <link rel="stylesheet" href="/static\bootstraptable\css\bootstrap-table.min.css" ?
    <link href="/static/imageplug/style.css" type="text/css" rel="stylesheet">
    <link href="/static/layui/css/modules/layer/default/layer.css" type="text/css" rel="stylesheet">

    <title>邀请码列表</title>
    <style>
        .cter {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .input-group {
            padding: 10px;
        }

        .label-primary {
            background-color: #0275d8;
        }

        .label {
            display: inline-block;
            padding: .25em .4em;
            font-size: 75%;
            line-height: 1;
            color: #fff;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: .25rem;
        }
        .label-success {
            background-color: #5cb85c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="cter">
            <h1>邀请码管理</h1>
        </div>
    </div>
    <div class="row">
        <div id="content" class="cter">
            <div id="toolbar">
                <button id="remove" class="btn btn-danger btn-sm">
                    <i class="glyphicon glyphicon-remove"></i> 删除
                </button>
                <button id="additem" class="btn btn-success btn-sm">
                    <i class="glyphicon glyphicon-remove"></i> 添加
                </button>
            </div>
            <table id="table" class="table table-striped table-bordered">
                <thead>
                <tr>
                </tr>
                </thead>
            </table>
        </div>

    </div>
    <div class="row">
        <div id="add" style="display: none;padding: 10px;">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">邀请码</span>
                </div>
                <input type="text" class="form-control" placeholder="accessKey" name="name">
            </div>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">添加产品</span>
                </div>
                <select class="form-control">
                    <option value="1">可用</option>
                    <option value="0">不可用</option>
                </select>
            </div>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">删除产品</span>
                </div>
                <select class="form-control">
                    <option value="1">可用</option>
                    <option value="0">不可用</option>
                </select>
            </div>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">管理邀请码</span>
                </div>
                <select class="form-control">
                    <option value="1">可用</option>
                    <option value="0">不可用</option>
                </select>
            </div>
            <div class="input-group">
                <div class="form-group">
                    <label for="name">描述</label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>
            </div>
            <div class="input-group">
                <div class="form-group">
                    <label for="name">访问权力分配</label>
                    <div id="access_power">

                    </div>
                </div>
            </div>
            <br>
            <div class="input-group ">
                <button id="ajax-add" class="btn btn-primary btn-sm cter">添加</button>
            </div>

        </div>
    </div>
    <div class="row">
        <div id="product" data-index="" style="display: none">
            <h1>fasdfasdf</h1>
        </div>
    </div>

</div>


</body>
<!-- Optional JavaScript -->
<script src="/static/bootstrap4/js/jquery.js"></script>
<script src="/static/bootstrap4/js/bootstrap.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table.min.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="/static/layui/lay/modules/layer.js"></script>
<script src="/static/my/access/list.js"></script>


</html>

