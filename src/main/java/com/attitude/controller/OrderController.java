package com.attitude.controller;

import com.attitude.common.utils.AsyncResponseJson;
import com.attitude.common.utils.DateTimeUtils;
import com.attitude.common.utils.HttpResponseUtil;
import com.attitude.common.utils.ShiroUtil;
import com.attitude.dal.mybatis.dao.OrderMapper;
import com.attitude.dal.mybatis.entity.Order;
import com.attitude.dal.mybatis.entity.OrderExample;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Smomo on 14-11-20.
 */
@Controller
@RequestMapping(value = "/Order")
public class OrderController {
    Logger logger = Logger.getLogger(OrderController.class);
    @Autowired
    private OrderMapper orderMapper;

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
            order.setState("0");
            order.setpId(1);
            int ret = orderMapper.insert(order);
            if (ret == 1) {
                OrderExample example = new OrderExample();
                example.createCriteria().andUIdEqualTo(Integer.valueOf(ShiroUtil.getCurrLoginUserID()));
                example.setOrderByClause("Create_Date Desc");//创建时间倒序
                List<Order> l =  orderMapper.selectByExample(example);
                if(l != null && l.size() > 0) {
                    String busID = l.get(0).getId().toString();
                    logger.info("提交订单成功");
                    HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, "订单提交成功。", busID));
                }
            }
        } catch (Exception e) {
            logger.error("提交订单异常",e);
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, "订单提交失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/OrderAndPay", method = RequestMethod.GET)
    public String OrderAndPay(Model model, HttpServletRequest request) {
        return "/product/submitAndPay";
    }

    @RequestMapping(value = "/PayOrder", method = RequestMethod.POST)
    public String PayOrder(Model model, HttpServletRequest request) {
        return "indexold";
    }
}
