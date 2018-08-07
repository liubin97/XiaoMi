package com.ssm.model.dao.cache;

import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.dao.SeckillDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 21:58
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml"})
//告诉junit spring配置文件
public class RedisDaoTest {

    private int id = 11;
    @Autowired
    private RedisDao redisDao;

    @Autowired
    private SeckillDao seckillDao;

    @Test
    public void testSeckill() throws Exception{

        //测试get and put
        SeckillDetail seckillDetail = redisDao.getSeckill(id);
        if(seckillDetail == null){
            //从数据库里面去取
            seckillDetail = seckillDao.queryById(id);
            if(seckillDetail != null){
                String result = redisDao.putSeckill(seckillDetail);
                System.out.println(result);

                seckillDetail = redisDao.getSeckill(id);
                System.out.println(seckillDetail );

            }
        }else {

            System.out.println("Get seckillDetail from redis directly");
            System.out.println(seckillDetail );

        }

    }
}