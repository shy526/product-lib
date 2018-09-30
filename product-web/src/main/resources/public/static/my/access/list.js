$(function () {

    /**
     *表格初始化
     */
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

    /**
     * 删除按钮
     */
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

    /**
     * 改变数据状态
     * @param row
     * @param index
     */
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

    /**
     * 打开新建页面
     */
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
                createProductType(result);
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

    /**
     * 创建产品分类
     */
    function createProductType(result) {
        for (var i = 0; i < result.length; i++) {
            let html = "<div class=\"custom-control custom-checkbox\">" +
                "<input type=\"checkbox\" class=\"custom-control-input\"  id=\"product-type-" + result[i].id + "\" name=\"example1\" value='" + result[i].id + "'>" +
                "<label data-text='" + result[i].name + "' data-array='[]' class=\"custom-control-label\" for=\"product-type-" + result[i].id + "\">" + result[i].name + "</label>" +
                "<div id=\"product-select-" + result[i].id + "\"></div>" +
                "</div>"
            $("#access_power").append(html);

            $("#product-type-" + result[i].id).click(function () {
                let id = $(this).val();
                //选中类型时候 生成 详细产品
                if ($(this).prop('checked')) {
                    createProduct(id);
                } else {
                    restoreLabel($(this),id);

                }
            })
        }
    }

    function createProduct(id) {
        let html = "<span class=\"label label-primary\" id='product-select-item-" + id + "'>1</span>"
        $("#product-select-" + id).append(html)

        //具体的那个产品
        $("#product-select-item-" + id).click(function () {
            let attr = $(this).attr("class");
            let $children = $(this).parent("div").parent(".custom-control").children("label");
            let text = $children.attr("data-text");
            let array = JSON.parse($children.attr("data-array"))
            if (attr.indexOf("primary") != -1) {
                array.push(id);
                $(this).attr("class", "label label-success");
            } else {
                $(this).attr("class", "label label-primary");
                let array1 = []
                for (var i = 0; i < array.length; i++) {
                    if (array[i] != id) {
                        array1.push(array[i])
                    }
                }
                array = array1
            }
            $children.attr("data-array", JSON.stringify(array));
            text += "["
            for (var i = 0; i < array.length; i++) {
                text += array[i] + ",";
            }
            if (array.length > 0) {
                text = text.substr(0, text.length - 1);
            }
            $children.text(text + "]");
        })
    }

    /**
     * 还原llabel 数据
     */
    function restoreLabel($target,id) {
        $("#product-select-" + id).empty();
        let $children = $target.parent(".custom-control").children("label");
        $children.attr("data-array", JSON.stringify([]));
        let text = $children.attr("data-text");
        $children.text(text)
    }
})

$("#ajax-add").click(function () {
    alert("添加成功")
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


