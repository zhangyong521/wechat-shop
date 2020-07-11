package com.zhangyong.exception;

import com.zhangyong.enums.ResultEnum;

/**
 * @Author: 张勇
 * @Blog: https://blog.csdn.net/zy13765287861
 * @Version: 1.0
 * @Date: 2020-06-07 21:40
 * @PS: 异常类
 */
public class ShopException extends RuntimeException {
    /**
     * 异常码
     */
    private Integer code;


    public ShopException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());

        this.code = resultEnum.getCode();
    }

    public ShopException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}
