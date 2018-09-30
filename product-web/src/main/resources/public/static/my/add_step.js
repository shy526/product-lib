/**
 * 控制哪一步显示或关闭
 * @param index
 */

$(function () {

    function stepShow(index) {
        $(".step-0").hide()
        $(".step-1").hide()
        $(".step-2").hide()
        $(".step-3").hide()
        if (index == 2) {
            $(".step-0").show()
            $(".step-1").show()
        }
        $(".step-" + index).show()
    }

    var $step = $("#step");
    var stepFlag = true;
    $step.step({
        index: 0,
        time: 500,
        title: ["填写基本信息", "上传商品图片", "待确认", "添加成功"]
    });
    $("#nextBtn").on("click", function () {
        $step.nextStep();
        console.log("下一步:" + $step.index)
        stepShow($step.index)
        if ($step.index != 0) {
            $("#prevBtn").show();
        }
        if ($step.index == 2) {
            $("#nextBtn").hide()
        }
    });
    $("#prevBtn").on("click", function () {
        console.log("上一步:" + $step.index)
        $step.prevStep();
        stepShow($step.index)
        if ($step.index == 0) {
            $("#prevBtn").hide();
        }
        if ($step.index != 2) {
            $("#nextBtn").show()
        }
    });

    $("#home").click(function () {
        window.location.href = '/';
    })
    $("#continue").click(function () {

        window.location.href = '/product/page/add';
    })

    //多文件列表示例
    var demoListView = $('#demoList')
        , uploadListIns = layui.upload.render({
        elem: '#testList'
        , url: '/product/add/'
        , accept: 'images'
        , multiple: true
        , auto: false
        , bindAction: '#testListAction'
        , choose: function (obj) {
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function (index, file, result) {
                var tr = $(['<tr id="upload-' + index + '">'
                    , '<td>' + file.name + '</td>'
                    , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                    , '<td>等待上传</td>'
                    , '<td>'
                    , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                    , '</td>'
                    , '</tr>'].join(''));
                //删除
                tr.find('.demo-delete').on('click', function () {
                    delete files[index]; //删除对应的文件
                    tr.remove();
                    uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                });

                demoListView.append(tr);
            });
        }
        , done: function (res, index, upload) {
            if (res.code == 200) { //上传成功
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                tds.eq(3).html(''); //清空操作
                $step.nextStep()
                stepShow($step.index);
                $("#prevBtn").hide();
                return delete this.files[index]; //删除文件队列已经上传成功的文件
            }
            this.error(index, upload);
        }
        , error: function (index, upload) {
            var tr = demoListView.find('tr#upload-' + index)
                , tds = tr.children();
            tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
        }, data: {
            //额外参数获取
            name: function () {
                return $('input[name="name"]').val();
            },
            typeId : function () {
                 return $("select[name='typeId']").val()
            }

        }
    });

    function createCate(msg) {
        $("select[name='typeId']").empty()
        $.ajax({
            url: "/product/type/all",
            success: function (result) {
                if (!result) {
                    layer.msg('类目加载异常');
                    return;
                }
                for (let i = 0; i < result.length; i++) {
                    let html = "<option value='" + result[i].id + "'>" + result[i].name + "</option>"
                    $("select[name='typeId']").append(html);
                }
                if (msg) {
                    layer.msg(msg);
                }
            }
        })
    }
    createCate();
    $("#refresh-cate").click(function () {
        createCate("刷新成功");
    })
})
