package com.zhangyong.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Author: 张勇
 * @Blog: https://blog.csdn.net/zy13765287861
 * @Version: 1.0
 * @Date: 2020-06-07 21:42
 * @PS: 异常枚举
 */
@Getter
@AllArgsConstructor
public enum ResultEnum {
    /**
     * 用于微信商城一些错误以及访问异常信息
     */
    USER_ERROR(1, "用户不存在"),
    CTG_INFO(2,"分类不存在"),
    ;

    private Integer code;
    private String message;
}
