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


</html>
<script>
    $("#additem").click(function () {
        $.ajax({
            url: "/product/type/all",
            data: {},
            success: function (result) {
                if (!result) {
                    layer.msg('异常');
                    return;
                }
                $("#access_power").empty();
                for (var i = 0; i < result.length; i++) {
                    var html = "<div class=\"custom-control custom-checkbox\">" +
                            "<input type=\"checkbox\" class=\"custom-control-input\"  id=\"product-type-" + result[i].id + "\" name=\"example1\" value='" + result[i].id + "'>" +
                            "<label data-text='"+result[i].name+"' data-array='[]' class=\"custom-control-label\" for=\"product-type-" + result[i].id + "\">" + result[i].name + "</label>" +
                            "<div id=\"product-select-" + result[i].id + "\"></div>" +
                            "</div>"
                    $("#access_power").append(html);
                    $("#product-type-" + result[i].id).click(function () {
                        let id = $(this).val();
                        if ($(this).prop('checked')) {
                            var html = "<span class=\"label label-primary\" id='product-select-item-"+id+"'>1</span>"
                            $("#product-select-" + id).append(html)
                            $("#product-select-item-"+id).click(function () {
                                let attr = $(this).attr("class");
                                let $children = $(this).parent("div").parent(".custom-control").children("label");
                                let text = $children.attr("data-text");
                                let array = JSON.parse($children.attr("data-array"))
                                if (attr.indexOf("primary")!=-1){
                                    array.push(id);
                                    $(this).attr("class","label label-success");
                                }else {
                                    $(this).attr("class","label label-primary");
                                    var array1=[]
                                    for (var i=0;i<array.length;i++){
                                        if (array[i]!=id){
                                            array1.push(array[i])
                                        }
                                    }
                                    array=array1
                                }
                                $children.attr("data-array",JSON.stringify(array));
                                text+="["
                                for (var i=0;i<array.length;i++){
                                    text+=array[i]+",";
                                }
                                if (array.length>0){
                                    text=text.substr(0,text.length-1);
                                }
                                $children.text(text+"]");
                            })
                        } else {
                            $("#product-select-" + id).empty();
                            let $children = $(this).parent(".custom-control").children("label");
                            $children.attr("data-array",JSON.stringify([]));
                            let text = $children.attr("data-text");
                            $children.text(text)
                        }

                    })
                }
                layer.open({
                    type: 1,
                    title: false,
                    fixed: true, //不固定
                    closeBtn: 1,
                    content: $('#add')
                });

            }
        })

    })
    $("#ajax-add").click(function () {
        alert("添加成功")
    })
</script>
<script>
    $("#table").bootstrapTable({ // 对应table标签的id
        url: "/accesskey/all", // 获取表格数据的url
        classes: "table table-hover",
        search: true,
        trimOnSearch: true,
        cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
        striped: true,  //表格显示条纹，默认为false
        pagination: true, // 在表格底部显示分页组件，默认false
        pageList: [10, 20], // 设置页面可以显示的数据条数
        pageSize: 10, // 页面数据条数
        pageNumber: 1, // 首页页码
        sidePagination: 'client', // 设置为服务器端分页
        sortName: 'id', // 要排序的字段
        sortOrder: 'desc', // 排序规则
        idField: "id",
        uniqueId: "id",
        toolbar: "#toolbar",
        columns: [
            {
                checkbox: true, // 显示一个勾选框
                align: 'center' // 居中显示
            }, {
                field: 'id',//域值
                title: '序号',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center' // 居中显示
                /* formatter :*/
            }, {
                field: 'accessKey',//域值
                title: '邀请码',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示
            }, {
                field: 'addPower',//域值
                title: '添加产品',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter: function (value) {
                    if (value == 1) {
                        return "可用"
                    }
                    return "不可用"
                }
            }, {
                field: 'omitPower',//域值
                title: '删除产品',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter: function (value) {
                    if (value == 1) {
                        return "可用"
                    }
                    return "不可用"
                }
            }, {
                field: 'managerPower',//域值
                title: '管理key',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter: function (value) {
                    if (value == 1) {
                        return "可用"
                    }
                    return "不可用"
                }
            }, {
                field: 'description',//域值
                title: '描述',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                /* formatter :*/
            }, {
                field: 'accessPower',//域值
                title: '访问权限',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter: function (value) {
                    if (!value) {
                        return "不可用"
                    } else if (value == "all") {
                        return "全部"
                    }
                    return "<button class=\"btn btn-primary btn-sm\" onclick=\"del(\\'' + row+ '\\')\">查看详情</button>"
                }
            }, {
                field: 'createTime',//域值
                title: '创建时间',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter: function (value) {

                    return dateFtt("yyyy-MM-dd", new Date(value));//直接调用公共JS里面的时间类处理的办法
                }
            }, {
                field: 'updateTime',//域值
                title: '更新时间',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter: function (value) {
                    return dateFtt("yyyy-MM-dd", new Date(value));//直接调用公共JS里面的时间类处理的办法
                }
            }, {
                field: 'dataStatus',//域值
                title: '状态',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter: function (value, row, index) {
                    if (value == 1) {
                        return "<button class=\"btn btn-danger  btn-sm\" onclick='isStatus(" + JSON.stringify(row) + "," + index + ")'>可用</button>"
                    } else {
                        return "<button class=\"btn btn-success  btn-sm\" onclick='isStatus(" + JSON.stringify(row) + "," + index + ")'>不可用</button>"

                    }

                }
            }, {
                title: "操作",
                align: 'center',
                valign: 'middle'
                ,
                width: 160, // 定义列的宽度，单位为像素px
                formatter: function (value, row, index) {
                    return "<button class=\"btn  btn-primary btn-sm\" onclick=\"del(\\'' + row.stdId + '\\')\">编辑</button>"

                }
            }

        ],
        onLoadSuccess: function () {  //加载成功时执行
            console.info("加载成功");
        },
        onLoadError: function () {  //加载失败时执行
            console.info("加载数据失败");
        }

    })

    function dateFtt(fmt, date) { //author: meizz
        var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds(),                 //秒
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度
            "S": date.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    $("#remove").click(function () {
        var select = $("#table").bootstrapTable('getSelections');
        deleteIds = "";
        arrayIds = [];
        if (select.length <= 0) {
            return;
        }
        for (var i = 0; i < select.length; i++) {
            deleteIds += select[i].id + ","
            arrayIds.push(select[i].id);
        }
        deleteIds = deleteIds.substr(0, deleteIds.length - 1)

        if (confirm("将为你删除序号为" + deleteIds)) {
            $.ajax({
                url: "/accesskey/delete",
                data: {
                    ids: arrayIds
                },
                success: function (result) {
                    if (result.code = 200) {
                        for (var i = 0; i < select.length; i++) {
                            $("#table").bootstrapTable('removeByUniqueId', select[i].id);
                        }
                    } else {
                        layer.msg('个别删除错误，请刷新页面确认');
                    }
                }
            })
        }

    })

    function isStatus(row, index) {
        var status = 1;
        if (row.dataStatus == 1) {
            status = 0;
        }
        $.ajax({
            url: "/accesskey/update/status",
            data: {
                id: row.id,
                status: status
            },
            success: function (result) {
                if (result.code = 200) {
                    layer.msg('修改成功');
                    var rows = {
                        index: index,  //更新列所在行的索引
                        field: "dataStatus", //要更新列的field
                        value: status //要更新列的数据
                    }//更新表格数据
                    $('#table').bootstrapTable("updateCell", rows);

                } else {
                    layer.msg('修改失败');
                }
            }
        })
    }
</script>
<script>
</script>
