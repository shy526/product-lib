<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap.css">
    <link rel="stylesheet" href="/static\bootstraptable\css\bootstrap-table.min.css" >
    <link rel="stylesheet" href="/static\bootstartselect\css\bootstrap-select.min.css">
    <link href="/static/imageplug/style.css" type="text/css" rel="stylesheet">
    <link href="/static/layui/css/modules/layer/default/layer.css" type="text/css" rel="stylesheet">

    <title>产品类目列表</title>
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
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="cter">
            <h1>产品分类管理</h1>
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
            <div class="input-group ">
                <div class="input-group-prepend">
                    <span class="input-group-text">名称</span>
                </div>
                <input type="text" class="form-control" placeholder="分类名" name="name" id="name1">
            </div>
            <button id="ajax-add" class="btn btn-primary btn-sm cter">添加</button>
        </div>
    </div>
    <div class="row">
        <div id="updatepage" style="display: none;padding: 10px;">
            <div class="input-group ">
                <div class="input-group-prepend">
                    <span class="input-group-text">名称</span>
                </div>
                <input type="text" class="form-control" placeholder="分类名" name="name" id="name2">
                <input type="hidden" name="update-row">
                <input type="hidden" name="update-index">
            </div>
            <button id="ajax-update" class="btn btn-primary btn-sm cter">确认更改</button>
        </div>
    </div>

</div>


</body>
<!-- Optional JavaScript -->
<script src="/static/bootstrap4/js/jquery.js"></script>
<script src="/static/bootstrap4/js/bootstrap.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table.min.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="/static/bootstartselect/js/bootstrap-select.min.js"></script>
<script src="/static/bootstartselect/js/i18n/defaults-zh_CN.js"></script>
<script src="/static/layui/lay/modules/layer.js"></script>


</html>
<script>
    $("#additem").click(function () {
        layer.open({
            type: 1,
            title: false,
            fixed: true, //不固定
            closeBtn: 1,
            content: $('#add')
        });
    })
    $("#ajax-add").click(function () {
        let val = $("#name1").val();
        if (!val) {
            layer.msg('类目名称不能为空');
            return;
        }
        $.ajax({
            url: "/product/type/add",
            data: {
                name: val
            },
            success: function (result) {
                if (result.code == 200) {
                    layer.msg('类目添加成功');
                    window.location.href = '/product/type/page/list';
                } else {
                    layer.msg('个别删除错误，请刷新页面确认');
                }
            }
        })
    })
</script>
<script>
    $("#table").bootstrapTable({ // 对应table标签的id
        url: "/product/type/all", // 获取表格数据的url
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
                field: 'name',//域值
                title: '名称',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示
            }, {
                field: 'paren',//域值
                title: '父类目',//内容
                visible: false,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示
            }
            , {
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
                    return "<button class=\"btn  btn-primary btn-sm\" onclick='updateRow(" + JSON.stringify(row) + "," + index + ")'>编辑</button>"

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
                url: "/product/type/delete",
                data: {
                    ids: arrayIds
                },
                success: function (result) {
                    if (result.code == 200) {
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
            url: "/product/type/update/status",
            data: {
                id: row.id,
                status: status
            },
            success: function (result) {
                if (result.code == 200) {
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

    function updateRow(row, index) {
        $("#name2").val(row.name)
        $("input[name='update-row']").val(JSON.stringify(row))
        $("input[name='update-index']").val(index);
        layer.open({
            type: 1,
            title: false,
            fixed: true, //不固定
            closeBtn: 1,
            content: $('#updatepage')
        });
    }
    $("#ajax-update").click(function () {
        let name = $("#name2").val();
        if (!name){
            layer.msg('请检查类目名称');
            return;
        }
        let row = $("input[name='update-row']").val();
        if (!row){
            layer.msg('错误,请刷新页面');
            return;
        }
        row = JSON.parse(row);
        let index = $("input[name='update-index']").val();
        if (!index){
            layer.msg('错误,请刷新页面');
            return;
        }
        if (row.name==name){
            layer.msg('名称没有被修改');
            return;
        }
        row.name=name
        $.ajax({
            url: "/product/type/update",
            data: {
                id: row.id,
                name: name
            },
            success: function (result) {
                if (result.code == 200) {

                    //更新表格数据
                    $('#table').bootstrapTable("updateRow", {
                        index:index,
                        row:row
                    });
                    layer.msg('修改成功');
                    layer.closeAll('page'); //关闭所有页面层
                } else {
                    layer.msg('修改失败');
                }
                $("#name2").val("")
                $("input[name='update-row']").val("")
                $("input[name='update-index']").val("");
            }
        })

    })
</script>
