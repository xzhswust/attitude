package com.attitude.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Smomo on 14-11-20.
 */
@Controller
@RequestMapping(value = "/Order")
public class OrderController {
    @RequestMapping(value = "/AddReceiver", method = RequestMethod.GET)
    public String AddReceiver(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/GetAddrList", method = RequestMethod.GET)
    public String GetAddrList(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/SubmitOrder", method = RequestMethod.POST)
         public String SubmitOrder(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/PayOrder", method = RequestMethod.POST)
    public String PayOrder(Model model, HttpServletRequest request) {
        return "indexold";
    }
}
