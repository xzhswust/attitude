package com.attitude.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zh.xu on 2015/1/13.
 */
@Controller
@RequestMapping(value = "/Delivery")
public class DeliveryController {
    @RequestMapping(value = "/DeliveryAddrMan", method = RequestMethod.GET)
    public String delivery(Model model, HttpServletRequest request) {

        return "delivery/DeliveryAddrMan";
    }
}
