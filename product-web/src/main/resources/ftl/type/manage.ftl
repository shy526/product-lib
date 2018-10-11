<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--视口的设置，让网页能等比例的缩放到对应设备中-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--告诉ie浏览器用最新内核去渲染网页-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>类目-管理</title>
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
    $('#type-table').bootstrapTable({
         url:"/type/limit",
        toolbar: '#toolbar',
        method: 'post',
        queryParamsType:"",
        sidePagination:'server',
        //是否显示分页条
        pagination: true,
        //首页页码
        pageNumber:1,
        //每页可显示数量
        pageSize:20,
        //每页可显示数量选项
        pageList:[10,20,'all'],
        //刷新按钮
        showRefresh:true,
        //各行变色
        striped:true,
        //是否启用搜索框
        search: true,
        // 行唯一识别
        uniqueId: "id",
        //切换视图按钮
        showToggle:true,
        responseHandler:function(result){
             if (result.code==200){
                 return {rows:result.data.data,total:result.data.total}
             }
        },
        rowStyle: function (row, index) {
            //这里有5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
            if (row.dataStatus==1){
                return { classes: "danger" }
            }
            return { };
        },
        columns: [{
            checkbox: true,
            align:'center',
            valign:'middle',
            halign: 'center',
        },{
            field: 'id',
            title: 'id',
            align:'center',
            valign:'middle',
            halign: 'center',
            visible:false,
            cardVisible:false,
            sortable:true
        }, {
            field: 'name',
            title: '名称',
            align:'center',
            valign:'middle',
            halign: 'center',
            sortable:true,
            disabled:false
        }, {
            field: 'paren',
            title: '父类',
            align:'center',
            valign:'middle',
            halign: 'center',
            visible:false,
            cardVisible:false,
            sortable:true
        }, {
            field: 'dataStatus',
            title: '状态',
            align:'center',
            valign:'middle',
            halign: 'center',
            sortable:true
        }, {
            field: 'createTime',
            title: '创建时间',
            formatter: function (value, row, index) {
                let src="";
                if (value){
                    src+=new Date(value).Format("yyyy-MM-dd");
                }
                return src;
            },
            sortable:true
        }, {
            field: 'updateTime',
            title: '更新时间',
            formatter: function (value, row, index) {
                let src="";
                if (value){
                    src+=new Date(value).Format("yyyy-MM-dd");
                }
                return src;
            },
            sortable:true
        }]
    });

    $("#btn_add").click(function () {
        $("#myModalLabel").text("新增-表单");
        $('#myModal').modal({
            keyboard: false
        })
        $("#d-name").attr("data-name","");
        $("input[name='name']").val("");
        $("select[name='dataStatus']").find("option[value='0']").attr("selected",true);
        $("select[name='dataStatus']").attr("data-dataStatus",selects[0].dataStatus,"");
        $("#ajax-add").show();
        $("#ajax-edit").hide();

    })
    $("#btn_delete").click(function () {
        let selects= $("#type-table").bootstrapTable('getSelections');
        if (!selects||selects.length<=0){
            alert("还没有勾选要删除的分类")
            return;
        }
        let names="";
        let ids=[]
        for (let i=0;i<selects.length;i++){
            let select = selects[i];
            names+=select.name+",";
            ids.push(select.id)
        }
        names = names.substr(0, names.length - 1)
        if (confirm("将要删除的分类:" + names)){
            ajax_delete_type(ids,function (result) {
                if (result.code==200){
                    for (let i = 0; i < ids.length; i++) {
                        $("#type-table").bootstrapTable('removeByUniqueId',ids[i]);
                    }
                }else {
                    alert("删除异常,将为你刷新,请检查")
                }
            })
        }
    })

    $("input[name='name']").blur(function(){
        let name = $("input[name='name']").val();
        if (!name){
            $("#d-name").removeClass("has-success");
            $("#d-name").addClass("has-error");
            alert("名称不能为空")
            return;
        }

        let attr = $("#d-name").attr("data-name");
        if (attr&&attr==name){
            //编辑模式 下 名字相同不做检查
            alert("你的名字没有做修改")
            return;
        }
        ajax_check_name(name,function (result) {
            if (result.code==200){
                if (result.data){
                    $("#d-name").removeClass("has-error");
                    $("#d-name").addClass(" has-success");
                }else {
                    $("#d-name").removeClass("has-success");
                    $("#d-name").addClass("has-error");
                    alert("该名称已被使用")
                }
            }else {
                alert("服务器错误")
            }
        })
    });

    $("#ajax-edit").click(function () {
        let id = $("input[name='id']").val();
        let name = $("input[name='name']").val();
        let dataStatus = $("select[name='dataStatus']").val();
        let name1 = $("#d-name").attr("data-name");
        let dataStatus1 = $("select[name='dataStatus']").attr("data-dataStatus");
        if (name==name1&&dataStatus==dataStatus1){
            alert("没有做任何修改");
            return;
        }
        ajax_update_type({id:id,name:name,dataStatus:dataStatus},function (result) {
            if (result.code==200){

            }else {
                alert("修改失败")
            }
        })
    })
    $("#ajax-add").click(function () {
        let name = $("input[name='name']").val();
        let dataStatus = $("select[name='dataStatus']").val();
        ajax_add_type(name,dataStatus,function (result) {
            if (result.code==200){
                location.reload();
            }else {
                alert("新增类型失败");
            }
        })
    })

    $("#btn_edit").click(function () {
        let selects= $("#type-table").bootstrapTable('getSelections');
        if (!selects||selects.length<=0){
            alert("还没有勾选要修改的分类")
            return;
        }
        if (selects.length>1){
            alert("修改操作只能单选")
            return;
        }
        $("input[name='id']").val(selects[0].id);
        $("input[name='name']").val(selects[0].name);
        $("select[name='dataStatus']").find("option[value='"+selects[0].dataStatus+"']").attr("selected",true);
        $("#d-name").attr("data-name",selects[0].name);
        $("select[name='dataStatus']").attr("data-dataStatus",selects[0].dataStatus);
        $("#myModalLabel").text("编辑-表单");
        $('#myModal').modal({
            keyboard: false
        })
        $("#ajax-add").hide();
        $("#ajax-edit").show();

    })
    /**
     * 添加一个新类型
     */
    function ajax_add_type(name,dataStatus,func) {
        $.ajax({
            url: "/type/add",
            type: "post",
            data:{
                name:name,
                dataStatus:dataStatus
            },
            success:func
        })
    }

    /**
     * 检查type 是名字是否重复
     */
    function ajax_check_name(name,func) {
        $.ajax({
            url: "/type/check",
            type: "post",
            data:{
                name:name,
            },
            success:func
        })
    }

    /**
     * 删除 type
     * @param ids
     * @param func
     */
    function ajax_delete_type(ids,func) {
        $.ajax({
            url:"/type/delete",
            type:"post",
            data:{
                ids:ids
            },
            success:func
        })
    }

    function ajax_update_type(data,func) {
        $.ajax({
            url:"/type/update",
            type:"post",
            data:data,
            success:func
        })
    }

</script>
</body>
</html>
