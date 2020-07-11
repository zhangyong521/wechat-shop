package com.zhangyong.service;

import com.zhangyong.bean.YqAdmin;

import java.util.Map;

/**
 * @author Administrator
 */
public interface AdminService {

    /**
     * 验证用户是否存在
     * @param map
     * @return
     */
    YqAdmin isExist(Map<String, Object> map);

    /**
     * 根据ID查询
     * @param map
     * @return
     */
    String listById(Map<String, Object> map);

    /**
     * 修改用户
     * @param map
     * @return
     */
    String update(Map<String, Object> map);

}