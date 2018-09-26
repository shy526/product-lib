<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/fileinput/css/fileinput.min.css">
    <link rel="stylesheet" type="text/css" href="/static/fileinput/css/bootstrap.min.css">
</head>
<body>
<form enctype="multipart/form-data" method="post">
    <input id="file-zh" name="file" type="file" multiple="multiple">
</form>
</body>
<script src="/static/fileinput/js/jquery.js"></script>
<script src="/static/fileinput/js/bootstrap.js"></script>
<script src="/static/fileinput/js/fileinput.min.js"></script>
<script src="/static/fileinput/js/zh.js"></script>

<script>
    $('#file-zh').fileinput({
        language: 'zh',
        uploadUrl: '/upload',
        allowedFileExtensions : ['jpg', 'png','gif'],
        maxFileCount: 10, //表示允许同时上传的最大文件个数
        uploadAsync: false
    });
</script>

</html>