<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static\bootstrap4\css\bootstrap.css"
    <link rel="stylesheet" href="/static\bootstraptable\css\bootstrap-table.min.css"
    <link href="/static/imageplug/style.css" type="text/css" rel="stylesheet">

    <title>邀请码列表</title>
    <style>
        .cter {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
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
        <div id="content">
            <div id="toolbar">
                <button id="remove" class="btn btn-danger btn-sm" >
                    <i class="glyphicon glyphicon-remove"></i>  删除
                </button>
                <button id="additem" class="btn btn-success btn-sm" >
                <i class="glyphicon glyphicon-remove"></i>  添加
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

</div>


</body>
<!-- Optional JavaScript -->
<script src="/static/bootstrap4/js/jquery.js"></script>
<script src="/static/bootstrap4/js/bootstrap.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table.min.js"></script>
<script src="/static/bootstraptable/js/bootstrap-table-zh-CN.min.js"></script>



</html>

<script>
    $("#table").bootstrapTable({ // 对应table标签的id
        url: "/accesskey/all", // 获取表格数据的url
        classes: "table table-hover",
        search:true,
        trimOnSearch:true,
        cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
        striped: true,  //表格显示条纹，默认为false
        pagination: true, // 在表格底部显示分页组件，默认false
        pageList: [10, 20], // 设置页面可以显示的数据条数
        pageSize: 10, // 页面数据条数
        pageNumber: 1, // 首页页码
        sidePagination: 'client', // 设置为服务器端分页
        sortName: 'id', // 要排序的字段
        sortOrder: 'desc', // 排序规则
        idField:"id",
        uniqueId:"id",
        toolbar:"#toolbar",
        columns: [
            {
                checkbox: true, // 显示一个勾选框
                align: 'center' // 居中显示
            },{
                field: 'id',//域值
                title: '序号',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center' // 居中显示
               /* formatter :*/
            },{
                field: 'accessKey',//域值
                title: '邀请码',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示
            },{
                field: 'addPower',//域值
                title: '添加产品',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter : function (value) {
                    if (value==1){
                        return "可用"
                    }
                    return "不可用"
                }
            },{
                field: 'omitPower',//域值
                title: '删除产品',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter : function (value) {
                    if (value==1){
                        return "可用"
                    }
                    return "不可用"
                }
            },{
                field: 'managerPower',//域值
                title: '管理key',//内容
                visible: true,//false表示不显示
                sortable: true,//启用排序
                align: 'center', // 居中显示,
                formatter : function (value) {
                    if (value==1){
                        return "可用"
                    }
                    return "不可用"
                }
            },{
                field: 'description',//域值
                title: '描述',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                /* formatter :*/
            },{
                field: 'accessPower',//域值
                title: '访问权限',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter : function (value) {
                    if (!value){
                        return "不可用"
                    }else if (value=="all") {
                        return "全部"
                    }
                    return "<button class=\"btn btn-primary btn-sm\" onclick=\"del(\\'' + row+ '\\')\">查看详情</button>"
                }
            },{
                field: 'createTime',//域值
                title: '创建时间',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter : function (value) {

                    return dateFtt("yyyy-MM-dd",new Date(value));//直接调用公共JS里面的时间类处理的办法
                }
            },{
                field: 'updateTime',//域值
                title: '更新时间',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter : function (value) {
                   return dateFtt("yyyy-MM-dd",new Date(value));//直接调用公共JS里面的时间类处理的办法
                }
            },{
                field: 'dataStatus',//域值
                title: '状态',//内容
                visible: true,//false表示不显示
                align: 'center', // 居中显示,
                sortable: true,//启用排序
                formatter : function (value) {
                    if (value==1){
                        return value+"<button class=\"btn  btn-danger btn-sm\" onclick=\"del(\\'' + row.stdId + '\\')\">不可用</button>"
                    }else {
                        return "<button class=\"btn  btn-success btn-sm\" onclick=\"del(\\'' + row.stdId + '\\')\">可用</button>"
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
        onLoadSuccess: function(){  //加载成功时执行
            console.info("加载成功");
        },
        onLoadError: function(){  //加载失败时执行
            console.info("加载数据失败");
        }

    })
    function del(value) {
        alert(value)
    }
    function dateFtt(fmt,date)
    { //author: meizz
        var o = {
            "M+" : date.getMonth()+1,                 //月份
            "d+" : date.getDate(),                    //日
            "h+" : date.getHours(),                   //小时
            "m+" : date.getMinutes(),                 //分
            "s+" : date.getSeconds(),                 //秒
            "q+" : Math.floor((date.getMonth()+3)/3), //季度
            "S"  : date.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

    $("#remove").click(function () {
        var select = $("#table").bootstrapTable('getSelections');
        deleteIds="";
        arrayIds=[];
        if (select.length<=0){
            return;
        }
        for (var i = 0; i < select.length; i++) {
            deleteIds+=select[i].id+","
            arrayIds.push(select[i].id);
        }
        deleteIds=deleteIds.substr(0,deleteIds.length-1)

        if (confirm("将为你删除序号为"+deleteIds)) {
            $.ajax({
                url: "/accesskey/delete",
                data: {
                    ids: arrayIds
                },
                success: function (result) {
                    if (result.error) {
                        for (var i = 0; i < select.length; i++) {
                            $("#table").bootstrapTable('removeByUniqueId', select[i].id);
                        }
                    } else {
                    }
                }
            })
        }

    })
</script>
