package com.attitude.controller;

import com.attitude.common.utils.*;
import com.attitude.dal.mybatis.dao.OrderMapper;
import com.attitude.dal.mybatis.dao.service.StaticService;
import com.attitude.dal.mybatis.entity.Order;
import com.attitude.dal.mybatis.entity.OrderExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Smomo on 2015/2/4.
 */

@Controller
@RequestMapping(value = "/Customer")
public class OrderManController {
    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping(value = "/MyOrder", method = RequestMethod.GET)
    public String MyOrder(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        String currUserName = ShiroUtil.getCurrLoginUserName();
        if (null == currUserName || currUserName.isEmpty()) {
            return "/login";
        }
        return "/myAttitude/myOrder";
    }

    @RequestMapping(value = "/GetMyOrder", method = RequestMethod.GET)
    public ModelAndView GetMyOrder(Model model, HttpServletRequest request, HttpServletResponse response) {
        String currUserID = ShiroUtil.getCurrLoginUserID();
        if (null == currUserID || currUserID.isEmpty()) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, "请先登录"));
        }
        OrderExample example = new OrderExample();
        example.createCriteria().andUIdEqualTo(Integer.valueOf(currUserID));
        example.setOrderByClause("Create_Date Desc");
        List<Order> list = orderMapper.selectByExample(example);
        if (list == null || list.size() == 0) return null;
        String shdzHtml = "";
        StaticService staticService = CommonUtil.GetStaticService();
        for (Order order : list) {
            //String shdz = order.getProvince() + order.getCity() + order.getDistrict() + order.getAddress();
            String html = "<div class=\"addmorebox\">\n" +
                    "                    <ul>\n" +
                    "                        <li>订单编号：<a href='/Order/OrderAndPay?busID=" + order.getId() + "'>" + order.getId() + "</a>     下单时间：" + DateTimeUtils.convertToDateTimeString(order.getCreateDate()) + "</li>\n" +
                    "                        <li>订单状态：" + staticService.GetDicName(1, order.getState()) + "</li>\n" +
                    "                        <li>商品信息：" + staticService.GetProduct(order.getpId()).getpName() + "     数量：" + order.getCount() + "</li>\n" +
                    "                        <li>订单金额：" + order.getAmount() + "</li>\n" +
                    "                    </ul>\n" +
                    "                </div>";

            shdzHtml += html;
        }
        HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, "加载订单成功", shdzHtml));
        return null;
    }
}
