<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
<#--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">-->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static\bootstrap4\css\bootstrap.css" >

</head>
<body>
<body>

<div class="container mt-3">
    <h3>输入框组</h3>
    <p> .input-group .input-group 类来向表单输入框中添加更多的样式，如图标、文本或者按钮，.input-group-prepend 类添加在前面，.input-group-append 添加在后面。</p>
    <p>使用 .input-group-text 类来设置文本的样式。</p>

    <form action="/action_page.php">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">@</span>
            </div>
            <input type="text" class="form-control" placeholder="Username" id="usr" name="username">
        </div>

        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Your Email" id="mail" name="email">
            <div class="input-group-append">
                <span class="input-group-text">@runoob.com</span>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="static\bootstrap4\js\jquery.js" />

<script src="static\bootstrap4\js\bootstrap.min.js" />
</body>

</html>