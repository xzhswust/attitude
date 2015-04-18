<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>壹态Diet</title>
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
                offsetX: 5,
                offsetY: 5
            });
        });
    })
</script>
<div class="bodybox nobg" style="background:#f9fbf0 !important;">
    <div class="gukeshuo">
        <div id="container">
            <div class="block">

                <p>
                    <a>
                        <img src="/static/temp/1.jpg" alt=""/>
                    </a>

                <div class="u_name">机智的小瑾瑾</div>
                <div class="u_cont">早就听说效果很好 今天终于如愿以偿 期待ing[花心]@HeyJuiceCleanse</div>
                </p>
            </div>
            <div class="block">

                <p>
                    <a>
                        <img src="/static/temp/2.jpg" alt=""/>
                    </a>

                <div class="u_name">好孩子吴大眼同学</div>
                <div class="u_cont">第二次的三天@HeyJuiceCleanse 果汁排毒艰难结束。因为正值三天假期，陪家人的同时要不喝水不吃任何食物，压力比上一次大太多。体重减轻2KG，小腹平坦很多。关键是自己没有辜负答应自己的事，说到做到的感觉，很爽。 为了我的马甲线，配合锻炼，我会坚持下去～ #世界上最远的距离，是知道和做到的距离#</div>
                </p>
            </div>
            <div class="block">

                <p>
                    <a>
                        <img src="/static/temp/3.jpg" alt=""/>
                    </a>

                <div class="u_name">李依谦_Helen</div>
                <div class="u_cont">1号的味道就好喜欢呢@HeyJuiceCleanse</div>
                </p>
            </div>
            <div class="block">

                <p>
                    <a>
                        <img src="/static/temp/4.jpg" alt=""/>
                    </a>

                <div class="u_name">王恋Lynn</div>
                <div class="u_cont">一到泰国胖五斤，还附赠上火和爆痘。还好我早料到会出现这种情况，出行前就订了暖身清体系列。全面进入调整期，从@HeyJuiceCleanse 开始！</div>
                </p>
            </div>
            <div class="block">

                <p>
                    <a>
                        <img src="/static/temp/5.jpg" alt=""/>
                    </a>

                <div class="u_name">Miss沐夏</div>
                <div class="u_cont">暖暖午后来瓶Hey Juice用小兔子最爱的进口胡萝卜制成的纯纯的胡萝卜汁，连我这个从不吃胡萝卜的姑凉都觉得灰常不错～话说我做的小兔子的花园肿么样，有爱咩～今天，你清肠了么？</div>
                </p>
            </div>

        </div>

    </div>
</div>
<script>
    $(document).ready(function () {
        //$.messager.defaults = {ok: "确定", cancel: "取消"};
        $.ajax({
            url: '/Admin/GetCommentList',
            type: "get",
            async: false,
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                var html = '';
                if (data.noData) {
                    //$('#commentTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    //$('#commentTable').datagrid('loadData', data);
                    for(var i=0;i<data.length;i++){
                        html += '<div class=\"block\"><p><a href=\"#\" onclick=\"window.open(\'http://'+data[i].link+'\')\"><img src=\"/Admin/ViewCommentImg?id=' + data[i].id;
                        html += '\"/></a><div class=\"u_name\">' + data[i].username;
                        html += '</div><div class=\"u_cont\">' + data[i].comment;
                        html += '</div></p></div>';
                    }
                    $('#container').html(html);
                }
            }
        });
    });

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
