package com.zhangyong.utils;

import java.util.Random;

/**
 * @Author: 张勇
 * @Blog: https://blog.csdn.net/zy13765287861
 * @Version: 1.0
 * @Date: 2020-06-07 21:56
 * @PS: 生成随机数的工具
 */
public class KeyUtil {

    /**
     * 生成唯一的主键
     * 格式：时间+随机数
     *
     * @return
     */
    public static synchronized String genUniqueKey() {
        Random random = new Random();
        int number = random.nextInt(900000) + 100000;
        return System.currentTimeMillis() + String.valueOf(number);
    }

    /**
     * 测试
     * @param args
     */
    public static void main(String[] args) {
        String s = genUniqueKey();
        System.out.println(s);
    }
}
