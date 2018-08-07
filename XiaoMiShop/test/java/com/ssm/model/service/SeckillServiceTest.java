package com.ssm.model.service;

import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.dto.CloseSeckill;
import com.ssm.model.dto.Exposer;
import com.ssm.model.dto.Remind;
import com.ssm.model.dto.SeckillExecution;
import com.ssm.model.exception.RepeatKillException;
import com.ssm.model.exception.SecKillCloseException;
import com.ssm.model.vo.DateList;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 22:30
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml", "classpath:applicationContext-transaction.xml"})
public class SeckillServiceTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;


    @Test
    public void getSeckillList() {

        List<SeckillDetail> seckillDetails = seckillService.getSeckillList();
        for(SeckillDetail sd:seckillDetails){
            System.out.println(sd);
            System.out.println();
        }
    }

    @Test
    public void  getKillTimeList() {

        List<DateList> dateLists = seckillService.getKillTimeList();
        System.out.println("-----------------------------开始打印------------------------------");
        for (DateList l:dateLists){
            System.out.println(l.toString());
        }

    }


    @Test
    public void getById() {

        int id =11;
        SeckillDetail seckillDetail = seckillService.getById(id);
        System.out.println("-----------------------------开始打印------------------------------");

        System.out.print(seckillDetail.toString());
    }

        @Test
    public void exportSeckillUrl() {

        //exposer=Exposer{
        // exposed=true,
        // md5='18b75a2535068cc89cafbf1596acfbe3',
        // seckillId=1,
        // now=0, start=0, end=0}
        int id = 1;
        Exposer exposer = seckillService.exportSeckillUrl(id);
//        logger.info("exposer={}",exposer );
            System.out.println("----------------------------------------------------");
            System.out.println(exposer.toString());


    }

    //集成测试代码完整逻辑，可以重复测试
    @Test
    public void SeckillLogic() {

//   MD5:     18b75a2535068cc89cafbf1596acfbe3
        int id = 1;
        Exposer exposer = seckillService.exportSeckillUrl(id);
//        logger.info("exposer={}",exposer );
        System.out.println("----------------------------------------------------");
        System.out.println(exposer.toString());
        //已经开启秒杀
        if(exposer.isExposed()){
            String email = "792143814@qq.com";
            String md5 = exposer.getMd5();
            try{
                SeckillExecution seckillExecution = seckillService.executeSeckill(id,email,md5);
                logger.info("seckillExecution={}",seckillExecution  );
            }catch (RepeatKillException e){
                logger.error(e.getMessage());
            }catch (SecKillCloseException e){
                logger.error(e.getMessage());
            }

        }else {
            //秒杀未开启
            logger.warn("exposer={}",exposer );
        }

    }
    @Test
    public void  executeSeckillProcedure(){

        int seckillId = 11;
        String email = "123456789@neu.com";
        int addressId = 9;
        Exposer exposer = seckillService.exportSeckillUrl(seckillId);
        if(exposer.isExposed()){

            String md5 = exposer.getMd5();
            SeckillExecution seckillExecution = seckillService.executeSeckillProcedure(seckillId,email,addressId,md5);
            logger.info(seckillExecution.getStateInfo());
        }
        logger.info("exposer={}",exposer );

    }

    @Test
    public void closeSeckillProcedure(){

        System.out.println("------------------------------------------");
        CloseSeckill closeSeckill = seckillService.closeSeckillProcedure();
        System.out.println(closeSeckill.toString());
    }

    @Test
    public void addRemindProcedure(){

        int seckillId = 1;
        String email = "123456789@neu.com";
        Remind remind = seckillService.addRemind(seckillId,email);
        System.out.println("------------------------------------------");
        System.out.println(remind.toString());
    }


}