package com.attitude.controller;

import com.attitude.common.utils.AsyncResponseJson;
import com.attitude.common.utils.HttpResponseUtil;
import com.attitude.common.utils.MapperServiceUtil;
import com.attitude.common.utils.ShiroUtil;
import com.attitude.dal.mybatis.entity.Address;
import com.attitude.dal.mybatis.entity.AddressExample;
import com.attitude.dal.mybatis.entity.User;
import com.attitude.dal.mybatis.entity.UserExample;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

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

    @RequestMapping(value = "/getDeliveries", method = RequestMethod.GET)
    public ModelAndView getDeliveries(Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            AddressExample addressExample = new AddressExample();
            addressExample.createCriteria().andUIdEqualTo(this.getUserID(ShiroUtil.getCurrLoginUserName()));

            List<Address> addresses = MapperServiceUtil.getAddressMapperService().selectByExample(addressExample);
            String shdzHtml = "";
            for(Address address : addresses){
                if((address.getConsignee() == null || address.getConsignee().isEmpty()) ||
                        (address.getAddress() == null || address.getAddress().isEmpty())){
                    continue;
                }
                String shdz = address.getProvinceCode() + address.getCityCode() + address.getDistrictCode() + address.getAddress();
                String html = "<div class=\"addmorebox\">\n" +
                        "                    <ul>\n" +
                        "                        <li><div>姓名：" + address.getConsignee() + "</div></li>\n" +
                        "                        <li>电话：" + address.getContractPhone() + "</li>\n" +
                        "                        <li>地址：" + shdz + "</li>\n" +
                        "                        <li>\n" +
                        "                            <a href=\"javascript:void(0);\" style=\"color:#A9CE2C;\" onclick=\"editShdz(" + address.getId() + ")\">编辑</a>\n" +
                        "                            &nbsp;&nbsp;&nbsp;\n" +
                        "                            <a href=\"javascript:void(0);\" style=\"color:#A9CE2C;\" onclick=\"deleteShdz(" + address.getId() + ")\">删除</a>\n" +
                        "                        </li>\n" +
                        "                    </ul>\n" +
                        "                </div>";

                shdzHtml += html;
            }

            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, shdzHtml));
        }catch (Exception ex){
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, ex.getMessage()));
        }

        return null;
    }

    @RequestMapping(value = "/addDelivery", method = RequestMethod.POST)
    public ModelAndView addDelivery(Model model, HttpServletRequest request, HttpServletResponse response) {

        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String area = request.getParameter("area");
        String consignee = request.getParameter("consignee");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        try {
            if(null == consignee || consignee.isEmpty()){
                throw new Exception("请填写收货人");
            }
            if(null == phone || phone.isEmpty()){
                throw new Exception("请填写收货人手机号码");
            }
            if(null == province || province.isEmpty() || province.equals("-1") || province.equals("请选择")){
                throw new Exception("请选择收货地址所在的省");
            }
            if(null == city || city.isEmpty() || city.equals("-1") || city.equals("请选择")){
                throw new Exception("请选择收货地址所在的城市");
            }
            if(null == area || area.isEmpty() || area.equals("-1") || area.equals("请选择")){
                throw new Exception("请选择收货地址所在的地区");
            }
            if(null == address || address.isEmpty()){
                throw new Exception("请填写具体收货地址");
            }

            Address tAddress = new Address();
            tAddress.setConsignee(consignee);
            tAddress.setContractPhone(phone);
            tAddress.setProvinceCode(province);
            tAddress.setCityCode(city);
            tAddress.setDistrictCode(area);
            tAddress.setAddress(address);
            tAddress.setIsDefault(false);

            int userID = this.getUserID(ShiroUtil.getCurrLoginUserName());
            tAddress.setuId(userID);

            tAddress.setUpdateDate(new Date());
            tAddress.setCreateDate(new Date());
            MapperServiceUtil.getAddressMapperService().insert(tAddress);

            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, "添加收货地址成功"));
        }catch (Exception ex){
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, ex.getMessage()));
        }

        return null;
    }

    @RequestMapping(value = "/editDelivery", method = RequestMethod.POST)
    public ModelAndView editDelivery(Model model, HttpServletRequest request, HttpServletResponse response) {

        return null;
    }

    @RequestMapping(value = "/deleteDelivery", method = RequestMethod.POST)
    public ModelAndView deleteDelivery(Model model, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        try {
            if(null == id || id.isEmpty()){
                throw new Exception("删除的收货地址ID为空");
            }

            MapperServiceUtil.getAddressMapperService().deleteByPrimaryKey(Integer.parseInt(id));
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(true, "删除收货地址成功"));
        }catch (Exception ex){
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, ex.getMessage()));
        }
        return null;
    }

    private int getUserID(String userName) throws Exception{
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(ShiroUtil.getCurrLoginUserName());
        List<User> users = MapperServiceUtil.getUserMapperService().selectByExample(userExample);
        if(users.size() == 1){
            return users.get(0).getId();
        }else{
            throw new Exception(String.format("未查询到用户%s的信息", ShiroUtil.getCurrLoginUserName()));
        }
    }
}
