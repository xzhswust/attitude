package com.attitude.controller;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.alipay.util.httpClient.HttpResponse;
import com.attitude.common.utils.AsyncResponseJson;
import com.attitude.common.utils.DateTimeUtils;
import com.attitude.common.utils.HttpResponseUtil;
import com.attitude.common.utils.ShiroUtil;
import com.attitude.dal.mybatis.dao.OrderMapper;
import com.attitude.dal.mybatis.dao.ProductMapper;
import com.attitude.dal.mybatis.entity.Order;
import com.attitude.dal.mybatis.entity.OrderExample;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by Smomo on 14-11-20.
 */
@Controller
@RequestMapping(value = "/Order")
public class OrderController {
    Logger logger = Logger.getLogger(OrderController.class);
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ProductMapper productMapper;

    @RequestMapping(value = "/AddReceiver", method = RequestMethod.GET)
    public String AddReceiver(Model model, HttpServletRequest request) {

        return "indexold";
    }

    @RequestMapping(value = "/GetAddrList", method = RequestMethod.GET)
    public String GetAddrList(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/SubmitOrder", method = RequestMethod.POST)
    public ModelAndView SubmitOrder(Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            logger.info("提交订单--------------");
            Order order = new Order();
            if(ShiroUtil.getCurrLoginUserID() == null){
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, "请先登录后提交订单。"));
                return null;
            }
            order.setuId(Integer.valueOf(ShiroUtil.getCurrLoginUserID()));
            order.setProvince(request.getParameter("province"));
            order.setCity(request.getParameter("city"));
            order.setDistrict(request.getParameter("area"));
            order.setConsignee(request.getParameter("name"));
            order.setMobile(request.getParameter("mobile"));
            order.setAddress(request.getParameter("address"));
            order.setBegindate(DateTimeUtils.toDate(request.getParameter("beginDate")));
            order.setPayment(request.getParameter("fkway"));
            order.setCount(Integer.valueOf(request.getParameter("count")));
            BigDecimal bg = new BigDecimal(request.getParameter("amount"));
            bg.setScale(2);
            order.setAmount(bg);
            order.setCreateDate(new Date());
            order.setRemark(request.getParameter("remark"));
            order.setState("1");
            order.setpId(Integer.valueOf(request.getParameter("pid")));
            int ret = orderMapper.insert(order);
            if (ret == 1) {
                OrderExample example = new OrderExample();
                example.createCriteria().andUIdEqualTo(Integer.valueOf(ShiroUtil.getCurrLoginUserID()));
                example.setOrderByClause("Create_Date Desc");//创建时间倒序
                List<Order> l = orderMapper.selectByExample(example);
                if (l != null && l.size() > 0) {
                    String busID = l.get(0).getId().toString();
                    logger.info("提交订单成功");
                    HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, "订单提交成功。", busID));
                }
            }
        } catch (Exception e) {
            logger.error("提交订单异常", e);
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, "订单提交失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/OrderAndPay", method = RequestMethod.GET)
    public String OrderAndPay(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        String busID = request.getParameter("busID");
        if (ShiroUtil.getCurrLoginUserID() == null || ShiroUtil.getCurrLoginUserID().isEmpty()) {
            return "redirect:/Login";//未登录
        }
        Order order = orderMapper.selectByPrimaryKey(Integer.valueOf(busID));
        if (!ShiroUtil.getCurrLoginUserID().equals(order.getuId().toString())) {//非登录用户订单
            return "redirect:/Product";
        }
        //业务单保留12小时
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(order.getCreateDate());
        calendar.add(Calendar.HOUR, 12);
        model.addAttribute("remain", DateTimeUtils.convertToDateTimeString(calendar.getTime()));
        model.addAttribute("busID", order.getId());
        model.addAttribute("createDate", DateTimeUtils.convertToDateTimeString(order.getCreateDate()));
        if (order.getState().equals("2")) {
            model.addAttribute("status", "已支付");
        } else if (order.getState().equals("9")) {
            model.addAttribute("status", "已完成");
        } else {
            model.addAttribute("status", "未支付");//0
        }
        model.addAttribute("productName", productMapper.selectByPrimaryKey(order.getpId()).getpName());
        model.addAttribute("count", order.getCount());
        model.addAttribute("amount", order.getAmount());
        model.addAttribute("beginDate", DateTimeUtils.convertToDateString(order.getBegindate()));
        model.addAttribute("consignee", order.getConsignee());
        model.addAttribute("mobile", order.getMobile());
        model.addAttribute("address", order.getProvince() + order.getCity() +
                order.getDistrict() + order.getAddress());
        model.addAttribute("remark", order.getRemark());
        return "/product/submitAndPay";
    }

    @RequestMapping(value = "/PayOrder", method = RequestMethod.GET)
    public String PayOrder(Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            //支付类型
            String payment_type = "1";
            String seller_id = AlipayConfig.partner;
            //必填，不能修改
            //服务器异步通知页面路径
            //String notify_url = "http://www.yitaidiet.com/Order/OrderNotifyCallback";
            //需http://格式的完整路径，不能加?id=123这类自定义参数		//页面跳转同步通知页面路径
            //String return_url = "http://www.yitaidiet.com/Order/OrderCallback";
            //String error_notify_url = "http://www.yitaidiet.com/Order/OrderErrorCallback";

            //花生壳测试路径
            String notify_url = "http://fqq2005q.xicp.net/Order/OrderNotifyCallback";
            String return_url = "http://fqq2005q.xicp.net/Order/OrderCallback";
            String error_notify_url = "http://fqq2005q.xicp.net/Order/OrderErrorCallback";
            String show_url = "http://fqq2005q.xicp.net/Product";

            //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/		//卖家支付宝帐户
            //String seller_email = new String(request.getParameter("WIDseller_email").getBytes("ISO-8859-1"), "UTF-8");
            //String seller_email = AlipayConfig.sellerEmail;
            String seller_email = new String(AlipayConfig.sellerEmail.getBytes("ISO-8859-1"),"utf-8");
            Order order = orderMapper.selectByPrimaryKey(Integer.valueOf(request.getParameter("busID")));
            //必填		//商户订单号
            String out_trade_no = new String(request.getParameter("busID").getBytes("ISO-8859-1"), "utf-8");
            //商户网站订单系统中唯一订单号，必填		//订单名称
            String subject = productMapper.selectByPrimaryKey(order.getpId()).getpName();
//            subject = new String(subject.getBytes("utf-8"),"utf-8");
            //必填		//付款金额
            //String total_fee = order.getAmount().toString();
            String total_fee = "0.01";
            total_fee = new String(total_fee.getBytes("ISO-8859-1"),"utf-8");
            //必填		//订单描述		String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
            //商品展示地址
            //String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"), "UTF-8");
            //String show_url = "http://www.yitaidiet.com/Product";
            //需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html		//防钓鱼时间戳
            String anti_phishing_key = "";
            //若要使用请调用类文件submit中的query_timestamp函数		//客户端的IP地址
            String exter_invoke_ip = "";
            //非局域网的外网IP地址，如：221.0.0.1


            //////////////////////////////////////////////////////////////////////////////////

            //把请求参数打包成数组
            Map<String, String> sParaTemp = new HashMap<String, String>();
            sParaTemp.put("service", "create_direct_pay_by_user");
            sParaTemp.put("partner", AlipayConfig.partner);
            sParaTemp.put("_input_charset", AlipayConfig.input_charset);
            sParaTemp.put("payment_type", payment_type);
            sParaTemp.put("notify_url", notify_url);
            sParaTemp.put("error_notify_url", error_notify_url);
            sParaTemp.put("return_url", return_url);
            sParaTemp.put("seller_email", seller_email);
            sParaTemp.put("out_trade_no", out_trade_no);
            sParaTemp.put("subject", subject);
            sParaTemp.put("total_fee", total_fee);
            sParaTemp.put("seller_id",seller_id);
            //sParaTemp.put("body", body);
            sParaTemp.put("show_url", show_url);
            sParaTemp.put("anti_phishing_key", anti_phishing_key);
            sParaTemp.put("exter_invoke_ip", exter_invoke_ip);

            //建立请求
            //String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "post", "确认");
            //request.setAttribute("sHtmlText", sHtmlText);

            String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
            Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
            String s = gson.toJson(sHtmlText);
            model.addAttribute("sHtmlText", s);
            request.setAttribute("sHtmlText", s);
            //result = "{\"success\":true,\"msg\":\"跳转成功\"}";
            //StringUtil.writeToWeb(sHtmlText, "html", response);
            HttpResponseUtil.writeHtmlToResponse(response, sHtmlText);
        }catch (Exception ex){}
        return null;
    }

    @RequestMapping(value = "/OrderCallback", method = RequestMethod.GET)
    public String OrderCallback(Model model, HttpServletRequest request){
        ShiroUtil.setModelUserTitle(model);
//        String busID = request.getParameter("out_trade_no");
//        String status = request.getParameter("trade_status");
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]: valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //add by smomo 2015-6-21 !!!!
            try {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put(name, valueStr);
        }
        String tradeNo = request.getParameter("out_trade_no");
        String tradeStatus = request.getParameter("trade_status");
        //String notifyId = request.getParameter("notify_id");
        if(AlipayNotify.verify(params)){//验证成功
            if(tradeStatus.equals("TRADE_FINISHED") || tradeStatus.equals("TRADE_SUCCESS")) {
                //改变订单状态
                Order order = new Order();
                order.setId(Integer.valueOf(tradeNo));
                order.setState("2");//已支付
                orderMapper.updateByPrimaryKeySelective(order);
                //System.out.println(">>>>>充值成功" + tradeNo);
            }
            return "/product/orderOk";
        }else{//验证失败
            return "/product/orderError";
        }
    }

    @RequestMapping(value = "/OrderErrorCallback", method = RequestMethod.GET)
    public String OrderErrorCallback(Model model, HttpServletRequest request){
        ShiroUtil.setModelUserTitle(model);
        return "/product/orderError";
    }

    @RequestMapping(value="/OrderNotifyCallback",method = RequestMethod.GET)
    public String OrderNotifyCallback(HttpServletRequest request, HttpServletResponse response){
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]: valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        String tradeNo = request.getParameter("out_trade_no");
        String tradeStatus = request.getParameter("trade_status");
        //String notifyId = request.getParameter("notify_id");
        if(AlipayNotify.verify(params)){//验证成功
            if(tradeStatus.equals("TRADE_FINISHED") || tradeStatus.equals("TRADE_SUCCESS")) {
                //要写的逻辑。自己按自己的要求写
                //log.error("ok.......");
                System.out.println(">>>>>充值成功" + tradeNo);
            }
            return "/product/orderOk";
        }else{//验证失败
            return "/product/orderError";
        }

    }
}
