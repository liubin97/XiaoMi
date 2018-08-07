package com.ssm.model.dao;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.SeckillDetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 20:54
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml"})
public class SeckillDaoTest {

    //注入Dao实现类依赖
    @Resource
    private SeckillDao seckillDao;

    @Test
    public void queryById()throws Exception {
            int id = 2;
            SeckillDetail seckillDetail = seckillDao.queryById(id);
            System.out.println(seckillDetail.getGoods_name());
            System.out.println(seckillDetail.toString());

    }

    @Test
    public void getStartTimeList() {

       List<Date> killdate = seckillDao.getStartTimeList();
       System.out.println("---------------------------------------------------");
        System.out.println(killdate.toString());

    }

    @Test
    public void getById() {

       int id = 11;
       SeckillDetail seckillDetail =(SeckillDetail) seckillDao.getById(id);
       System.out.println("---------------------------------------------------");
        System.out.println(seckillDetail.toString());
    }

    @Test
    public void  getAddress() {

        String  email = "wzdhjw@neu.com";
        List<Address> addresses = seckillDao.getAddress(email);
        System.out.println("---------------------------------------------------");
        System.out.println(addresses.toString());
    }


    @Test
    public void getEndTimeList() {

        List<Date> killdate = seckillDao.getEndTimeList();
        System.out.println("---------------------------------------------------");
        System.out.println(killdate.toString());

    }

    @Test
    public void selectAll() {

        List<SeckillDetail> seckillDetails = seckillDao.selectAll();
        System.out.println("---------------------------------------------------");
        for(SeckillDetail sd:seckillDetails){
            System.out.println(sd);
        }

    }


    @Test
    public void getRecentSeckill(){

        List<SeckillDetail> seckillDetails = seckillDao.getRecentSeckill();
        System.out.println("---------------------------------------------------");
        for (SeckillDetail sd:seckillDetails){
            System.out.println(sd);
        }

    }
}