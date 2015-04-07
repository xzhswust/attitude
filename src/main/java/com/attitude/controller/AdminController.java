package com.attitude.controller;

import com.attitude.common.utils.*;
import com.attitude.dal.mybatis.dao.*;
import com.attitude.dal.mybatis.dao.service.StaticService;
import com.attitude.dal.mybatis.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Smomo on 2015/3/11.
 */

@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
    @Autowired
    private UserCommentMapper userCommentMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Autowired
    private QAMapper qaMapper;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String Admin(Model model, HttpServletRequest request) {

        return "manage/admin";
    }

    //===========================评论管理===========================

    @RequestMapping(value = "/CommentMng", method = RequestMethod.GET)
    public String CommentMng(Model model, HttpServletRequest request) {

        return "manage/commentManage";
    }

    @RequestMapping(value = "/SubmitComment", method = RequestMethod.POST)
    public String SubmitComment(HttpServletRequest request, HttpServletResponse response
            , @RequestParam MultipartFile[] pic) {
        String name = request.getParameter("userName");
        String comment = request.getParameter("comment");
        MultipartFile file = pic[0];
        if (!name.isEmpty() && !comment.isEmpty() && file != null) {
            if (file.getSize() == 0) return "manage/commentManage";
            UserComment userComment = new UserComment();
            userComment.setUsername(name);
            userComment.setComment(comment);
            try {
                userComment.setPic(file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
            userCommentMapper.insert(userComment);
        }
        return "redirect:/Admin/CommentMng";
    }

    @RequestMapping(value = "/GetCommentList", method = RequestMethod.GET)
    public ModelAndView GetCommentList(Model model, HttpServletRequest request, HttpServletResponse response) {
        UserCommentExample example = new UserCommentExample();
        example.setOrderByClause("ID DESC");
        List<UserComment> list = userCommentMapper.selectByExample(example);
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }

    @RequestMapping(value = "/UpdateComment", method = RequestMethod.POST)
    public ModelAndView UpdateComment(Model model, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String userName = request.getParameter("username");
        String comment = request.getParameter("comment");
        UserCommentExample example = new UserCommentExample();
        example.createCriteria().andIdEqualTo(Integer.valueOf(id));
        UserComment userComment = new UserComment();
        userComment.setId(Integer.valueOf(id));
        userComment.setUsername(userName);
        userComment.setComment(comment);
        int ret = userCommentMapper.updateByExampleSelective(userComment, example);
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "更新评论成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "更新评论失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/DeleteComment", method = RequestMethod.POST)
    public ModelAndView DeleteComment(Model model, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        int ret = userCommentMapper.deleteByPrimaryKey(Integer.valueOf(id));
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "删除评论成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "删除评论失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/ViewCommentImg", method = RequestMethod.GET)
    public ModelAndView ViewCommentImg(Model model, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        UserCommentExample example = new UserCommentExample();
        example.createCriteria().andIdEqualTo(Integer.valueOf(id));
        List<UserComment> list = userCommentMapper.selectByExampleWithBLOBs(example);
        if (null != list && list.size() > 0) {
            HttpResponseUtil.writeImageToResponse(response, list.get(0).getPic());
        }
        return null;
    }

    //===========================用户管理===========================

    @RequestMapping(value = "/UserMng", method = RequestMethod.GET)
    public String UserMng(Model model, HttpServletRequest request) {

        return "manage/userManage";
    }

    @RequestMapping(value = "/GetUserList", method = RequestMethod.GET)
    public ModelAndView GetUserList(Model model, HttpServletRequest request, HttpServletResponse response) {
        UserExample example = new UserExample();
        example.setOrderByClause("Create_Date DESC");
        List<User> list = userMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            for (User user : list) {
                if (user.getBirthday() != null) {
                    user.setBirthdayStr(sdf.format(user.getBirthday()));
                }
                user.setCreateDateStr(sdf.format(user.getCreateDate()));
            }
        }
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }

    //重置密码
    @RequestMapping(value = "/ResetPwd", method = RequestMethod.GET)
    public ModelAndView ResetPwd(Model model, HttpServletRequest request, HttpServletResponse response) {
        String uid = request.getParameter("uid");
        User user = new User();
        user.setPassword(Md5Util.getMd5Password("12345678"));
        user.setId(Integer.valueOf(uid));
        try {
            int ret = userMapper.updateByPrimaryKeySelective(user);

            if (ret != 1) {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "重置密码失败。"));
            } else {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "重置密码成功。"));
            }
        } catch (Exception e) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "重置密码失败。"));
        }
        return null;
    }

    //===========================订单管理===========================

    @RequestMapping(value = "/OrderMng", method = RequestMethod.GET)
    public String OrderMng(Model model, HttpServletRequest request) {

        return "manage/orderManage";
    }

    @RequestMapping(value = "/GetOrderList", method = RequestMethod.GET)
    public ModelAndView GetOrderList(Model model, HttpServletRequest request, HttpServletResponse response) {
        OrderExample example = new OrderExample();
        example.setOrderByClause("Create_Date Desc");
        List<Order> list = orderMapper.selectByExample(example);
        StaticService staticService = CommonUtil.GetStaticService();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (Order order : list) {
            User user = userMapper.selectByPrimaryKey(order.getuId());
            order.setUserAccount(user.getUserName());
            order.setProductName(staticService.GetProduct(order.getpId()).getpName());
            order.setStateStr(staticService.GetDicName(1, order.getState()));
            order.setBegindateStr(sdf1.format(order.getBegindate()));
            order.setCreateDateStr(sdf2.format(order.getCreateDate()));
        }
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }

    //发货
    @RequestMapping(value = "/Deliver", method = RequestMethod.GET)
    public ModelAndView Deliver(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("oid");
        Order order = orderMapper.selectByPrimaryKey(Integer.valueOf(id));
        if (order.getState().equals("2")) {//支付才可发货
            order = new Order();
            order.setId(Integer.valueOf(id));
            order.setState("3");
            int ret = orderMapper.updateByPrimaryKeySelective(order);
            if (ret == 1) {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(true, "已成功发货。"));
            } else {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "发货操作失败。"));
            }
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "已支付的订单才允许发货。"));
        }
        return null;
    }

    //完成
    @RequestMapping(value = "/Finish", method = RequestMethod.GET)
    public ModelAndView Finish(Model model, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("oid");
        Order order = orderMapper.selectByPrimaryKey(Integer.valueOf(id));
        if (order.getState().equals("3")) {//配送中的订单才可完成
            order = new Order();
            order.setId(Integer.valueOf(id));
            order.setState("9");
            int ret = orderMapper.updateByPrimaryKeySelective(order);
            if (ret == 1) {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(true, "订单完成成功。"));
            } else {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "订单完成失败。"));
            }
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "配送中的订单才允许完成。"));
        }
        return null;
    }

    //===========================产品管理===========================

    @RequestMapping(value = "/ProductMng", method = RequestMethod.GET)
    public String ProductMng(Model model, HttpServletRequest request) {

        return "manage/productManage";
    }

    @RequestMapping(value = "/GetProductList", method = RequestMethod.GET)
    public ModelAndView GetProductList(HttpServletRequest request, HttpServletResponse response) {
        ProductExample example = new ProductExample();
        example.setOrderByClause("Create_Date Desc");
        List<Product> list = productMapper.selectByExample(example);
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }

    @RequestMapping(value = "/ViewProductImg", method = RequestMethod.GET)
    public ModelAndView ViewProductImg(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        ProductExample example = new ProductExample();
        example.createCriteria().andIdEqualTo(Integer.valueOf(id));
        List<Product> list = productMapper.selectByExampleWithBLOBs(example);
        if (null != list && list.size() > 0) {
            HttpResponseUtil.writeImageToResponse(response, list.get(0).getPic());
        }
        return null;
    }

    @RequestMapping(value = "/SubmitProduct", method = RequestMethod.POST)
    public String SubmitProduct(HttpServletRequest request, HttpServletResponse response
            , @RequestParam MultipartFile[] pic) {
        String pName = request.getParameter("pName");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String memberPrice = request.getParameter("memberPrice");
        MultipartFile file = pic[0];
        if (!pName.isEmpty() && !price.isEmpty() && file != null) {
            if (file.getSize() == 0) return "manage/productManage";
            Product product = new Product();
            product.setCreateDate(new Date());
            product.setpName(pName);
            product.setDescription(description);
            product.setPrice(BigDecimal.valueOf(Double.valueOf(price)));
            if (!memberPrice.isEmpty()) {
                product.setMemberPrice(BigDecimal.valueOf(Double.valueOf(memberPrice)));
            }
            try {
                product.setPic(file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
            productMapper.insert(product);
        }
        return "redirect:/Admin/ProductMng";
    }

    @RequestMapping(value = "/UpdateProduct", method = RequestMethod.POST)
    public ModelAndView UpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String pName = request.getParameter("pName");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String memberPrice = request.getParameter("memberPrice");

        ProductExample example = new ProductExample();
        example.createCriteria().andIdEqualTo(Integer.valueOf(id));
        Product product = new Product();
        product.setId(Integer.valueOf(id));
        product.setUpdateDate(new Date());
        product.setpName(pName);
        product.setDescription(description);
        product.setPrice(BigDecimal.valueOf(Double.valueOf(price)));
        if (!memberPrice.isEmpty()) {
            product.setMemberPrice(BigDecimal.valueOf(Double.valueOf(memberPrice)));
        }
        int ret = productMapper.updateByExampleSelective(product, example);
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "更新产品信息成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "更新产品信息失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/DeleteProduct", method = RequestMethod.POST)
    public ModelAndView DeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        int ret = productMapper.deleteByPrimaryKey(Integer.valueOf(id));
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "删除产品信息成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "删除产品信息失败。"));
        }
        return null;
    }

    //===========================问题管理===========================

    @RequestMapping(value = "/QAMng", method = RequestMethod.GET)
    public String QAMng(Model model, HttpServletRequest request) {

        return "manage/qaManage";
    }

    @RequestMapping(value = "/GetQATypeList", method = RequestMethod.GET)
    public ModelAndView GetQATypeList(HttpServletRequest request, HttpServletResponse response) {
        DictionaryExample example = new DictionaryExample();
        example.createCriteria().andDicTypeIdEqualTo(2);
        List<Dictionary> list = dictionaryMapper.selectByExample(example);
        List<ComboboxDictionary> comboboxDictionaries = DictionaryConvert.convertToComboboxDictionarys(list, false);
        String json = JsonUtil.toJson(comboboxDictionaries);
        HttpResponseUtil.writeTextToResponse(response, json);
        return null;
    }

    @RequestMapping(value = "/AddQAType", method = RequestMethod.POST)
    public ModelAndView AddQAType(HttpServletRequest request, HttpServletResponse response) {
        Dictionary dictionary = new Dictionary();
        dictionary.setDicCode(request.getParameter("typeID"));
        dictionary.setDicName(request.getParameter("typeName"));
        dictionary.setDicLevel(1);
        dictionary.setDicTypeId(2);
        try {
            int ret = dictionaryMapper.insert(dictionary);
            if (ret == 1) {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(true, "添加问题类型成功。"));
            } else {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "添加问题类型失败。"));
            }
        } catch (DuplicateKeyException e) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "类型ID重复，请重新输入。"));
        } catch (Exception e) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "添加问题类型失败:" + e.getMessage()));
        }
        return null;
    }

    @RequestMapping(value = "/DeleteQAType", method = RequestMethod.POST)
    public ModelAndView DeleteQAType(HttpServletRequest request, HttpServletResponse response) {
        String idStr = request.getParameter("qaType");
        if (!idStr.isEmpty()) {
            try {
                String[] ids = idStr.split(",");
                for (String id : ids) {
                    QAExample qaExample = new QAExample();
                    qaExample.createCriteria().andTypeIdEqualTo(id);
                    qaMapper.deleteByExample(qaExample);

                    dictionaryMapper.deleteByPrimaryKey(id);
                }
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(true, "删除问题类型成功。"));
            } catch (Exception e) {
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                        new AsyncResponseJson(false, "删除问题类型失败:" + e.getMessage()));
            }
        }
        return null;
    }

    @RequestMapping(value = "/SubmitQA", method = RequestMethod.POST)
    public String SubmitProduct(HttpServletRequest request, HttpServletResponse response) {
        String qaType = request.getParameter("qaType");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        QA qa = new QA();
        qa.setTypeId(qaType);
        qa.setQuestion(question);
        qa.setAnswer(answer);
        qaMapper.insert(qa);

        return "redirect:/Admin/QAMng";
    }

    @RequestMapping(value = "/GetQAList", method = RequestMethod.GET)
    public ModelAndView GetQAList(HttpServletRequest request, HttpServletResponse response) {
        QAExample example = new QAExample();
        String typeID = request.getParameter("typeID");
        if(typeID != null && !typeID.isEmpty()){
            example.createCriteria().andTypeIdEqualTo(typeID);
        }
        example.setOrderByClause("ID Desc");
        List<QA> list = qaMapper.selectByExample(example);
        for(QA qa : list){
            qa.setTypeStr(CommonUtil.GetStaticService().GetDicName(2,qa.getTypeId()));
        }
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }

    @RequestMapping(value = "/UpdateQA", method = RequestMethod.POST)
    public ModelAndView UpdateQA(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        QA qa = new QA();
        qa.setId(Integer.valueOf(id));
        qa.setQuestion(question);
        qa.setAnswer(answer);
        int ret = qaMapper.updateByPrimaryKeySelective(qa);
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "更新问题信息成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "更新问题信息失败。"));
        }
        return null;
    }

    @RequestMapping(value = "/DeleteQA", method = RequestMethod.POST)
    public ModelAndView DeleteQA(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        int ret = qaMapper.deleteByPrimaryKey(Integer.valueOf(id));
        if (ret == 1) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(true, "删除问题信息成功。"));
        } else {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response,
                    new AsyncResponseJson(false, "删除问题信息失败。"));
        }
        return null;
    }
}
