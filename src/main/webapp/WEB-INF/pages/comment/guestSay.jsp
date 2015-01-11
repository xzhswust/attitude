<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>顾客说</title>
    <%--<meta name="decorator" content="un-decorator-pages"/>--%>
    <%--<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">--%>
    <%--<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/common.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/blocksit.min.js"></script>--%>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $(window).load(function () {
            $('#container').BlocksIt({
                numOfCol: 4,
                offsetX: 8,
                offsetY: 8
            });
        });
    })
</script>
<div class="bodybox nobg">
    <div class="gukeshuo">
        <div id="container">
            <div class="block">
                <h2>效果很好,下次还会继续来买的</h2>

                <p>
                    <a>
                        <img src="/static/temp/img15.jpg" alt=""/>
                    </a>

                <div class="u_name">用户名</div>
                这里的卖的营养套餐真的很好吃
                </p>
            </div>
            <div class="block">
                <h2>效果很好,下次还会继续来买的</h2>

                <p>
                    <a>
                        <img src="/static/temp/img19.jpg" alt=""/>
                    </a>

                <div class="u_name">用户名</div>
                这里的卖的营养套餐真的很好吃
                </p>
            </div>
            <div class="block">
                <h2>效果很好,下次还会继续来买的</h2>

                <p>
                    <a>
                        <img src="/static/temp/img2.jpg" alt=""/>
                    </a>

                <div class="u_name">用户名</div>
                这里的卖的营养套餐真的很好吃
                </p>
            </div>
            <div class="block">
                <h2>感觉很不错</h2>

                <p>
                    <a>
                        <img src="/static/temp/img20.jpg" alt=""/>
                    </a>

                <div class="u_name">用户名</div>
                这里的卖的营养套餐真的很好吃
                </p>
            </div>
            <div class="block">
                <h2>这里是标题</h2>

                <p>
                    <a>
                        <img src="/static/temp/img25.jpg" alt=""/>
                    </a>

                <div class="u_name">用户名</div>
                这个是内容
                </p>
            </div>

        </div>

    </div>
</div>
<script>
    $('.wxgx').click(function(){
        $('.wxtc').fadeIn();
        return false;
    })
    $('.is_close').click(function(){
        $('.wxtc').fadeOut();
    })
</script>
</body>
</html>
