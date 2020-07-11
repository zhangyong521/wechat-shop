package com.zhangyong.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


/**
 * Jedis工具类
 *
 * @author 17616
 */
public final class JedisUtil {
    private static String host = "192.168.153.150";
    private static int port = 6379;
    private static String password = "123456";
    private static Integer db = 0;
    private static int timeout = 30000;
    private static int maxWaitMillis = 20000;

    private volatile static JedisPool pool = null;

    private JedisUtil() {
    }

    public static JedisPool getJedisPool() {
        if (pool == null) {
            synchronized (JedisUtil.class) {
                JedisPoolConfig cfg = new JedisPoolConfig();
                //连接池中最多连接数
                cfg.setMaxTotal(20);
                //连接池中连接最大空闲数
                cfg.setMaxIdle(5);

                cfg.setMaxWaitMillis(maxWaitMillis);
                //创建连接池对象
                if (pool == null) {
                    pool = new JedisPool(cfg, host, port, timeout);
                }
            }
        }
        return pool;
    }

    public static Jedis getJedis() {
        Jedis jedis = getJedisPool().getResource();
        if (password != null) {
            jedis.auth(password);
        }
        if (db != null) {
            jedis.select(db);
        }
        //从连接池中取一个Jedis对象
        return jedis;
    }

    public static void release(Jedis jedis) {
        if (jedis != null) {
            jedis.close();//将jedis放回连接池
        }
    }

    public static void main(String[] args) {
        Jedis jedis = getJedis();
        System.out.println(jedis);
        System.out.println(jedis.hget("userlist", "1"));
        jedis.close();
    }
}
