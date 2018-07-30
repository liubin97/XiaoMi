package com.ssm.controller;

import com.ssm.model.bean.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

    @RequestMapping("purchaseImmediately")
    public ModelAndView purchaseImmediately(){
        ModelAndView mav = new ModelAndView();

        return mav;
    }
    @RequestMapping("settlementCart")
    public ModelAndView settlementCart(){
        ModelAndView mav = new ModelAndView();

        return mav;
    }


}
