<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>填写订单</title>
</head>
<body>
<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/portal/css/jquery.inputbox.css"/>
<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>
<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>
<script src="/static/portal/js/common.js" type="application/javascript"></script>
<script src="/static/portal/js/jquery.inputbox.js" type="text/javascript"></script>
<script src="/static/portal/js/jquery.ganged.js" type="text/javascript"></script>
<script src="/static/portal/js/diqu.js" type="text/javascript"></script>

<div class="cnav"></div>
<div class="bodybox">
    <div class="bodymain2" style="height:auto;">
        <div class="usernav">
            <h1>立即购买</h1>
            <ul>
                <li><a href="#">选择套餐</a></li>
                <li class="on"><a href="#">填写订单</a></li>
                <li><a href="#">提交并支付</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="boxtop lv">
                <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/dingdantu.png" alt=""
                                                                  style="vertical-align: middle;"/>请填写收货信息</a></div>
            </div>
            <div class="boxcenter xiedingdan">
                <div id="sel3">
                    <div name="province" type="selectbox" style="margin-right: 11px;">
                        <div class="opts"></div>
                    </div>
                    <div name="city" type="selectbox" style="margin-right:5px;">
                        <div class="opts"></div>
                    </div>
                    <input class="real" name="gongsisuozaidi" type="hidden" value=""/>
                </div>
                <input type="text" name="site" value="" placeholder="请填写具体收货地址" class="inputtype2"
                       style="width:245px;margin-right:19px;"/><input type="text" name="site" value=""
                                                                      placeholder="收货人姓名" class="inputtype2"
                                                                      style="width:150px;margin-right:11px"/><input
                    type="text" name="site" value="" placeholder="收货人联系方式" class="inputtype2"
                    style="width:150px;"/><input type="text" name="site" value="" placeholder="邮编信息" class="inputtype2"
                                                 style="width:150px;margin-top:15px"/>
                <!--务必不要在input之间加入空格 回车-->
                <script>
                    $('#sel3').ganged({'data': data, 'width': 150, 'height': 32});
                </script>
                <div class="clear"></div>
                <div class="shtime">
                    收货时间
                </div>
                <div style="line-height:34px;height: 34px;font-size:12px;margin-top:17px;">
                    <div type="selectbox" id="sel4" style="margin-right: 11px;">
                        <div class="opts">
                            <a href="javascript:;" val="暂时只支持每周日晚开始配送">暂时只支持每周日晚开始配送</a>
                        </div>
                    </div>
                    <span style="color: darkgray">(暂时只支持每周日晚开始配送)</span>
                </div>
                <script>
                    $('#sel4').inputbox({
                        height: 24,
                        width: 225
                    });
                    ;
                    $('#sel4').find('.selected').text('请选择食用套餐的时期').css('left', '0');
                </script>
                <div style="font-size:12px;margin-top:13px;text-indent:45px;color: darkgray">
                    温馨提示：不建议女性在生理期，妊娠期，和哺乳期食用。
                </div>
                <div class="fkway">
                    付款方式
                </div>
                <ul class="fkselect">
                    <li><input type="radio" name="fkway" value="货到付款" disabled/>货到付款（即将开通）</li>
                    <li><input type="radio" name="fkway" value="在线支付"/>货到付款（支付宝）<img
                            src="/static/portal/images/lt.png"/></li>
                    <li style="text-indent:45px;color: darkgray">请您在24小时之内完成支付，否则订单会自动取消</li>
                </ul>
                <div class="clear"></div>
                <div style="margin-left:45px;font-size:12px;">确认订单信息</div>
                <div class="formtop"></div>
                <table class="ddform">
                    <tr>
                        <th width="200">套餐名称</th>
                        <th width="100">单价（元）</th>
                        <th width="220">数量（套）</th>
                        <th width="150">优惠信息</th>
                        <th width="100">小计</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>壹态纤体瘦身套餐（2周）</td>
                        <td>1380</td>
                        <td>1套</td>
                        <td>0</td>
                        <td>1380</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5">备注<input class="inputtype2" type="text" style="margin-left:40px;width:370px"/>
                        </td>
                        <td><input class="greenbtn" value="提交订单" type="submit"/></td>
                    </tr>


                </table>
                <div class="formbottom"></div>
            </div>

            <div class="boxbottom"></div>
        </div>
    </div>
</div>
<div class="mainbottom">
    <div class="bottombox"></div>
    <div class="footer">
        <div class="leftmenu">
            <ul>
                <li><a href="#"><img src="/static/portal/images/wx.png" alt=""/></a></li>
                <li><a href="#"><img src="/static/portal/images/qq.png" alt=""/></a></li>
                <li><a href="#"><img src="/static/portal/images/weibo.png" alt=""/></a></li>
            </ul>
        </div>
        <div class="rightdesc">
            <ul>
                <li>市场联络：SLKFDJLSKFJS</li>
                <li>京ICP备149594940</li>
                <li>YITAIDIET@163.COM</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
