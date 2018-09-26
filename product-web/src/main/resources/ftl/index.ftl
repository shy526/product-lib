<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>xx产品库</title>

    <link rel="stylesheet" type="text/css" href="static/index/css/demo.css">
    <link rel="stylesheet" href="static/index/css/main.css">
    <link rel="stylesheet" href="static/index/dist/sortable.min.css">
    <script type="text/javascript" src="static/index/dist/sortable.min.js"></script>
    <style>
        .seek_c{
            height: 36px;!important;
            float: left;
            border: 1px solid #b6b6b6;
            border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;
            background: #fff;
            display: inline-block;
            vertical-align: top;
            width: 539px;
            margin-right: 0;
            border-right-width: 0;
            border-color: #b8b8b8 transparent #ccc #b8b8b8;
            overflow: hidden;
        }
        .seek{
            height: 22px;
            line-height: 22px;
            margin: 6px 0 0 7px;
            padding: 0;
            background: transparent;
            border: 0;
            outline: 0;
            -webkit-appearance: none;
            top: 0px;
            right: 0px;
            display: block;
            width: 500px;
            font: 16px arial;
        }
        .seek_click{
            width: 100px;
            height: 36px;
            color: #fff;
            font-size: 15px;
            letter-spacing: 1px;
            background: #3385ff;
            border-bottom: 1px solid #2d78f4;
            outline: medium;
            *border-bottom: 0;
            -webkit-appearance: none;
            -webkit-border-radius: 0;
            border: 0;
            padding: 0;
        }
        .ytitle{
            color: #fff;
            padding-top: 10px;
            display: flex;
            justify-content: center;
            margin-top: 0;
        }
    </style>

</head>
<body>

<main class="sortable">

    <div class="container">
        <h1 class="ytitle">xxxx产品库</h1>
        <div class="sortable__nav nav" style="padding: 20px 0;">
                <span class="seek_c">
                    <input class="seek" >
                </span>
                <span style="float: left;">
                    <input class="seek_click" type="submit" value="搜索">
                </span>

        </div>
        <div class="wrapper" style="    padding: 10px 0;!important;">
            <ul class="sortable__nav nav">
                <li>
                    <a data-sjslink="all" class="nav__link">
                        所有
                    </a>
                </li>
                <li>
                    <a data-sjslink="flatty" class="nav__link">
                        扁平化
                    </a>
                </li>
                <li>
                    <a data-sjslink="funny" class="nav__link">
                        创意
                    </a>
                </li>
            </ul>
            <div id="sortable" class="sjs-default">
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-1.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 1</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, eius, asperiores.
                                Incidunt sapiente est quae iure...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-2.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 2</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum vitae necessitatibus,
                                dolorem similique vero explicabo...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="funny">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-3.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 3</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo, placeat voluptate, fuga
                                tenetur eos ducimus animi porro...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-4.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 4</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit doloremque quisquam,
                                obcaecati unde nam est quos...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-5.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 5</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse corporis hic minima nisi
                                reprehenderit...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="funny">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-1.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 6</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel voluptatibus, id, deserunt
                                inventore...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-2.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 7</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum enim beatae vero culpa,
                                fuga, magni sunt dolores nam...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="flatty">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-3.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 8</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae numquam,
                                blanditiis necessitatibus...
                            </p>
                        </div>
                    </div>
                </div>
                <div data-sjsel="funny">
                    <div class="card">
                        <img class="card__picture" src="static/index/images/item-4.png" alt="">
                        <div class="card-infos">
                            <h2 class="card__title">Example 9</h2>
                            <p class="card__text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur adipisci
                                voluptatum laborum officiis...
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript">
    document.querySelector('#sortable').sortablejs();
</script>


</body>
</html>