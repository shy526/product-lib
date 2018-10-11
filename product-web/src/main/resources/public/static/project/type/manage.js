var typeManage = {
    initTable: function () {
        $('#type-table').bootstrapTable({
            url: "/type/limit",
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
                field: 'name',
                title: '名称',
                align: 'center',
                valign: 'middle',
                halign: 'center',
                sortable: true,
                disabled: false
            }, {
                field: 'paren',
                title: '父类',
                align: 'center',
                valign: 'middle',
                halign: 'center',
                visible: false,
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
    ajax: {
        /**
         * 添加一个新分类
         * @param name
         * @param dataStatus
         * @param func
         */
        add: function (name, dataStatus, func) {
            $.ajax({
                url: "/type/add",
                type: "post",
                data: {
                    name: name,
                    dataStatus: dataStatus
                },
                success: func
            })
        },
        /**
         * 检查分类名是否重复
         * @param name
         * @param func
         */
        checkName: function (name, func) {
            $.ajax({
                url: "/type/check",
                type: "post",
                data: {
                    name: name,
                },
                success: func
            })
        },
        /**
         * 更新分类
         * @param data
         * @param func
         */
        update: function (data, func) {
            $.ajax({
                url: "/type/update",
                type: "post",
                data: data,
                success: func
            })
        },
        /**
         * 批量删除分类
         * @param ids
         * @param func
         */
        delete: function (ids, func) {
            $.ajax({
                url: "/type/delete",
                type: "post",
                data: {
                    ids: ids
                },
                success: func
            })
        },
        /**
         * 更新dataStatus字段
         * @param id
         * @param index
         * @param status
         */
        updateStatus:function (id, index, status) {
            $.ajax({
                url: "/type/update/status",
                type: "post",
                data: {
                    id: id,
                    status: status
                },
                success: function (result) {
                    if (result.code == 200) {
                        $("#type-table").bootstrapTable('updateCell', {
                            index: index,
                            field: "dataStatus",
                            value: status
                        });

                    } else {
                        alert("修改出错")
                    }
                }
            })
        }

    },
    binding:function () {
        /**
         * 工具栏添加按钮
         */
        $("#btn_add").click(function () {
            $("#myModalLabel").text("新增-表单");
            $('#myModal').modal('show')
            $("#d-name").attr("data-name", "");
            $("input[name='name']").val("");
            $("select[name='dataStatus']").find("option[value='0']").attr("selected", true);
            $("select[name='dataStatus']").attr("data-dataStatus", "");
            $("#ajax-add").show();
            $("#ajax-edit").hide();

        })

        /**
         * 工具栏 删除按钮
         */
        $("#btn_delete").click(function () {
            let selects = $("#type-table").bootstrapTable('getSelections');
            if (!selects || selects.length <= 0) {
                alert("还没有勾选要删除的分类")
                return;
            }
            let names = "";
            let ids = []
            for (let i = 0; i < selects.length; i++) {
                let select = selects[i];
                names += select.name + ",";
                ids.push(select.id)
            }
            names = names.substr(0, names.length - 1)
            if (confirm("将要删除的分类:" + names)) {
                typeManage.ajax.delete(ids, function (result) {
                    if (result.code == 200) {
                        for (let i = 0; i < ids.length; i++) {
                            $("#type-table").bootstrapTable('removeByUniqueId', ids[i]);
                        }
                    } else {
                        alert("删除异常,将为你刷新,请检查")
                    }
                })
            }
        })

        /**
         * 工具栏修改按钮
         */
        $("#btn_edit").click(function () {
            let selects = $("#type-table").bootstrapTable('getSelections');
            if (!selects || selects.length <= 0) {
                alert("还没有勾选要修改的分类")
                return;
            }
            if (selects.length > 1) {
                alert("修改操作只能单选")
                return;
            }
            $("input[name='id']").val(selects[0].id);
            $("input[name='name']").val(selects[0].name);
            $("select[name='dataStatus']").find("option[value='" + selects[0].dataStatus + "']").attr("selected", true);
            $("#d-name").attr("data-name", selects[0].name);
            $("select[name='dataStatus']").attr("data-dataStatus", selects[0].dataStatus);
            $("#myModalLabel").text("编辑-表单");
        /*    $('#myModal').modal({
                keyboard: false
            })*/
            $('#myModal').modal('show')
            $("#ajax-add").hide();
            $("#ajax-edit").show();

        })

        /**
         * 分类名 检查
         */

        $("input[name='name']").blur(function () {
            let name = $("input[name='name']").val();
            if (!name) {
                $("#d-name").removeClass("has-success");
                $("#d-name").addClass("has-error");
                alert("名称不能为空")
                return;
            }

            let attr = $("#d-name").attr("data-name");
            if (attr && attr == name) {
                //编辑模式 下 名字相同不做检查
                alert("你的名字没有做修改")
                return;
            }
            typeManage.ajax.checkName(name, function (result) {
                if (result.code == 200) {
                    if (result.data) {
                        $("#d-name").removeClass("has-error");
                        $("#d-name").addClass(" has-success");
                    } else {
                        $("#d-name").removeClass("has-success");
                        $("#d-name").addClass("has-error");
                        alert("该名称已被使用")
                    }
                } else {
                    alert("服务器错误")
                }
            })
        });

        /**
         * 新增体提交按钮
         */
        $("#ajax-add").click(function () {
            let name = $("input[name='name']").val();
            let dataStatus = $("select[name='dataStatus']").val();
            typeManage.ajax.add(name, dataStatus, function (result) {
                if (result.code == 200) {
                    $('#myModal').modal('hide')
                    $("#type-table").bootstrapTable('refresh', {silent: true});
                } else {
                    alert("新增类型失败");
                }
            })
        })
        /**
         * 修改提交按钮
         */
        $("#ajax-edit").click(function () {
            let id = $("input[name='id']").val();
            let name = $("input[name='name']").val();
            let dataStatus = $("select[name='dataStatus']").val();
            let name1 = $("#d-name").attr("data-name");
            let dataStatus1 = $("select[name='dataStatus']").attr("data-dataStatus");
            if (name == name1 && dataStatus == dataStatus1) {
                alert("没有做任何修改");
                return;
            }
            typeManage.ajax.update({id: id, name: name, dataStatus: dataStatus}, function (result) {
                if (result.code == 200) {
                    $('#myModal').modal('hide')
                    $("#type-table").bootstrapTable('refresh', {silent: true});
                } else {
                    alert("修改失败")
                }
            })
        })
    },
    init:function () {
        typeManage.initTable();
        typeManage.binding();
    }
}

$(function () {
    typeManage.init();
})













