package com.zhangyong.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 张勇
 * @Blog: https://blog.csdn.net/zy13765287861
 * @Version: 1.0
 * @Date: 2020-06-16 11:29
 * @PS: vo表示返回给前端的数据格式
 */
@Getter
@Setter
public class Msg {
    /**
     * 状态码，200表示成功，100表示失败
     */
    private int code;
    /**
     * 返回提示信息
     */
    private String msg;
    /**
     * 将返回的浏览器的数据保存在map中
     */
    private Map<String,Object> extend = new HashMap<>();

    /**
     * 请求成功
     * @return
     */
    public static Msg success(){
        Msg result = new Msg ();
        result.setCode (200);
        result.setMsg ("处理成功");
        return result;
    }

    /**
     * 请求失败
     * @return
     */
    public static Msg fail(){
        Msg result = new Msg ();
        result.setCode (100);
        result.setMsg ("处理失败");
        return result;
    }

    /**
     * 把返回的值添加到map中
     * @param key
     * @param value
     * @return
     */
    public Msg add(String key, Object value) {
        this.getExtend ().put (key,value);
        return this;
    }
}