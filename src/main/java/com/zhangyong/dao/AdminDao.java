package com.zhangyong.dao;

import com.zhangyong.bean.YqAdmin;

import java.util.Map;

/**
 * @author Administrator
 */
public interface AdminDao {

    /**
     * 判断用户是否存在（用于登录）
     *
     * @param map
     * @return
     */
    YqAdmin isExist(Map<String, Object> map);

    /**
     * 根据Id查询密码（用户更改用户）
     *
     * @param map
     * @return
     */
    String listById(Map<String, Object> map);

    /**
     * 更新用户（用户更改用户）
     *
     * @param map
     * @return
     */
    int update(Map<String, Object> map);

}
