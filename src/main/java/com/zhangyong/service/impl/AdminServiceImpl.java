package com.zhangyong.service.impl;

import com.zhangyong.bean.YqAdmin;
import com.zhangyong.dao.AdminDao;
import com.zhangyong.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public YqAdmin isExist(Map<String, Object> map) {
        return adminDao.isExist(map);
    }

    @Override
    public String listById(Map<String, Object> map) {
        return adminDao.listById(map);
    }

    @Override
    public String update(Map<String, Object> map) {
        try {
            return adminDao.update(map)+"";
        } catch (Exception e) {
            log.info("【更新用户信息】:" + e.getMessage());
            return "-1";
        }
    }

}
