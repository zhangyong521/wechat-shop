package com.zhangyong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Administrator
 */
@Controller
@RequestMapping("/")
public class YqIndexCtrl {
    /**
     * 首页控制器
     * @return
     */
    @RequestMapping(value = "main/main.action")
    public ModelAndView mainIndex() {
        return new ModelAndView("index");
    }

}
