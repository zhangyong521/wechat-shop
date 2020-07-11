package com.zhangyong.controller;

import com.zhangyong.bean.YqAdmin;
import com.zhangyong.enums.ResultEnum;
import com.zhangyong.exception.ShopException;
import com.zhangyong.service.AdminService;
import com.zhangyong.utils.MD5Util;
import com.zhangyong.vo.Msg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 */
@Controller
@RequestMapping("/admin/")
@Slf4j
public class YqAdminCtrl {

    @Autowired
    private AdminService adminService;

    Map<String, Object> map = new HashMap<>();

    /**
     * 判断用户是否存在（用于登录）
     *
     * @param username
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "isExist.action",method = RequestMethod.POST)
    public Msg isExist(String username, String password, HttpSession session) throws Exception {
        map.put("username", username);
        map.put("password", MD5Util.MD5Encode(password));
        YqAdmin admin = adminService.isExist(map);
        if (admin != null) {
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("admin", admin);

            return Msg.success().add("admin",admin);
        } else {
            log.error("【登录信息】admin={}",username);
            return Msg.fail().add("1000","用户名或密码错误");
        }
    }

    /**
     * 更新用户信息（用户更改密码）
     *
     * @param password
     * @param password2
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "update.action")
    public String update(String password, String password2, HttpSession session) throws Exception {
        int adminId = 0;
        if (session.getAttribute("admin") != null) {
            YqAdmin admin = (YqAdmin) session.getAttribute("admin");
            adminId = admin.getAdminId();
        }
        map.put("adminId", adminId);
        String pwd = adminService.listById(map);
        String rs = "0";
        if (MD5Util.MD5Encode(password).equals(pwd)) {
            map.put("password", MD5Util.MD5Encode(password2));
            rs = adminService.update(map);
        }
        return rs;
    }

    /**
     * 退出系统清空当前session
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "loginOut.action", method =RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("清除缓存");
        return "login";
    }
}
