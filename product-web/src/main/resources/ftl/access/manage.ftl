<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--视口的设置，让网页能等比例的缩放到对应设备中-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--告诉ie浏览器用最新内核去渲染网页-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>邀请码-管理</title>
    <link rel="stylesheet" href="/static/bootstrap/3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bootstrap-table/bootstrap-table.min.css">
</head>
<body>


<style type="text/css">
    .container .items {
        border: 1px solid #EEEEEE;
        padding: 10px;
        margin-bottom: 15px;
    }

    .gap {
        margin-bottom: 10px;
    }

</style>
<div class="container">
    <div class="row ">
        <div class="col-md-12">
            <div>


                <h1 class="text-center"><img class="img-responsive center-block"
                                             src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481"/
                    >类目管理</h1>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_edit" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>
            <table id="type-table">
                <thead>
                </thead>
            </table>
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
                <h4 class="modal-title" id="myModalLabel">新增-表单</h4>
            </div>
            <div class="modal-body">
                <p></p>
                <div class="form-group"id="d-name">
                    <label for="f-name">名称</label>
                    <input type="text" class="form-control" placeholder="请输入名称" name="name" id="f-name" data-name="">
                </div>
                <div class="form-group" id="d-dataStatus">
                    <label for="f-dataStatus">状态</label>
                    <select class="form-control" name="dataStatus" id="f-dataStatus" data-dataStatus="">
                        <option value="0">可用</option>
                        <option value="1">不可用</option>
                    </select>
                </div>
                <p></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="ajax-add" style="display: none">保存</button>
                <button type="button" class="btn btn-primary" id="ajax-edit" style="display: none">保存</button>
               <input type="hidden" name="id">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/static/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/static/common/dateFrom.js"></script>
<script type="text/javascript" src="/static/bootstrap/3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-table/bootstrap-table.min.js"></script>
<script type="text/javascript" src="/static/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script>
    var accessManager={
        initTable:function () {
            $('#type-table').bootstrapTable({
                url: "/access/limit",
                toolbar: '#toolbar',
                method: 'post',
                cache: false,
                queryParamsType: "",
                sidePagination: 'server',
                //是否显示分页条
                pagination: true,
                //首页页码
                pageNumber: 1,
                //每页可显示数量
                pageSize: 20,
                //每页可显示数量选项
                pageList: [10, 20, 'all'],

                //各行变色
                striped: true,
                //是否启用搜索框
                search: true,
                // 行唯一识别
                uniqueId: "id",
                //切换视图按钮
                showToggle: true,
                //勾选是否显示
                showColumns: true,
                //刷新按钮
                showRefresh: true,
                responseHandler: function (result) {
                    if (result.code == 200) {
                        return {rows: result.data.data, total: result.data.total}
                    }
                },
                rowStyle: function (row, index) {
                    //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
                    if (row.dataStatus == 1) {
                        return {classes: "danger"}
                    }
                    return {};
                },
                columns: [{
                    checkbox: true,
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                }, {
                    field: 'id',
                    title: 'id',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    visible: false,
                    cardVisible: false,
                    sortable: true
                }, {
                    field: 'accessKey',
                    title: '邀请码',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    sortable: true,
                    disabled: false
                }, {
                    field: 'accessPower',
                    title: '访问权限',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    visible: true,
                    cardVisible: false,
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<button type=\"button\" class=\"btn btn-success\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",1)'>可用</button>"
                        } else if (value == 1) {
                            return "<button type=\"button\" class=\"btn btn-danger\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",0)'>不可用</button>"
                        }
                    }
                }, {
                    field: 'managerPower',
                    title: '管理权限',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    visible: true,
                    cardVisible: false,
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<button type=\"button\" class=\"btn btn-success\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",1)'>可用</button>"
                        } else if (value == 1) {
                            return "<button type=\"button\" class=\"btn btn-danger\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",0)'>不可用</button>"
                        }
                    }
                }, {
                    field: 'description',
                    title: '描述',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    visible: true,
                    cardVisible: false,
                    sortable: true
                }, {
                    field: 'dataStatus',
                    title: '状态',
                    align: 'center',
                    valign: 'middle',
                    halign: 'center',
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return "<button type=\"button\" class=\"btn btn-success\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",1)'>可用</button>"
                        } else if (value == 1) {
                            return "<button type=\"button\" class=\"btn btn-danger\" onclick='typeManage.ajax.updateStatus(" + row.id + "," + index + ",0)'>不可用</button>"
                        }
                    }
                }, {
                    field: 'createTime',
                    title: '创建时间',
                    formatter: function (value, row, index) {
                        let src = "";
                        if (value) {
                            src += new Date(value).Format("yyyy-MM-dd");
                        }
                        return src;
                    },
                    sortable: true
                }, {
                    field: 'updateTime',
                    title: '更新时间',
                    formatter: function (value, row, index) {
                        let src = "";
                        if (value) {
                            src += new Date(value).Format("yyyy-MM-dd");
                        }
                        return src;
                    },
                    sortable: true
                }]
            });
        },
        init:function() {
            accessManager.initTable();
        }
    }
    $(function () {
        accessManager.init()
    })
</script>
</body>
</html>
