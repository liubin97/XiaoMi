package com.ssm.model.dao;

import com.ssm.model.bean.SuccessKilled;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 21:31
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml"})
public class SuccessKilledDaoTest {

    //注入Dao实现类依赖
    @Resource
    private SuccessKilledDao successKilledDao;


    @Test
    public void insertSuccessKilled() {
        int id=1;
        String email = "xdmango@icloud.com";
        int insertCount = successKilledDao.insertSuccessKilled(id,email);
        System.out.println("insertCount="+insertCount);

    }

    @Test
    public void queryById() {

        int id = 1;
        String email = "xdmango@icloud.com";
        SuccessKilled successKilled = successKilledDao.queryById(id,email);
        System.out.println(successKilled.toString());
        System.out.println(successKilled.getSeckillDetail());
    }
}