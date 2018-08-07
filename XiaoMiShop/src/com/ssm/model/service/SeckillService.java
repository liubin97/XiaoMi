package com.ssm.model.service;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.bean.SeckillReminder;
import com.ssm.model.bean.SuccessKilled;
import com.ssm.model.dao.SeckillDao;
import com.ssm.model.dao.SeckillReminderDao;
import com.ssm.model.dao.SuccessKilledDao;
import com.ssm.model.dao.cache.RedisDao;
import com.ssm.model.dto.CloseSeckill;
import com.ssm.model.dto.Exposer;
import com.ssm.model.dto.Remind;
import com.ssm.model.dto.SeckillExecution;
import com.ssm.model.enums.CloseSeckillStateEnum;
import com.ssm.model.enums.RemindStateEnum;
import com.ssm.model.enums.SeckillStateEnum;
import com.ssm.model.exception.RepeatKillException;
import com.ssm.model.exception.SecKillCloseException;
import com.ssm.model.exception.SecKillException;
import com.ssm.model.vo.DateList;
import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.*;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 20:17
 **/
@Service
public class SeckillService implements com.ssm.model.service.serviceInterfce.SeckillService {


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    //注入service依赖  @Autowired//@Resource @Inect
    @Autowired
    private SeckillDao seckillDao;

    @Autowired
    private SuccessKilledDao successKilledDao;

    @Autowired
    private SeckillReminderDao seckillReminderDao;

    //注入Redis
    @Autowired
    private RedisDao redisDao;

    //加入混淆，不希望用户猜到
    //md5盐值字符串，用于混淆MD5
    public final String slat ="DWNEwsk!@#$%^16W89!@#$%^WDHWGDfeev#$%^&*snwqnsbk1!@#$%^&sdn*&^%$#@";


    //获取秒杀列表
    @Override
    public List<SeckillDetail> getSeckillList() {
        return seckillDao.selectAll();
    }

    //查询秒杀时间表
    @Override
    public List<DateList> getKillTimeList() {

        List<DateList> dateLists = new ArrayList<DateList>();
        List<Date> start = seckillDao.getStartTimeList();
        List<Date> end = seckillDao.getEndTimeList();
        for(int i=0;i<start.size();i++){
            DateList dateList = new DateList();
            dateList.setStart_time(start.get(i));
            dateList.setEnd_time(end.get(i));
            dateLists.add(dateList);
        }


        return dateLists;
    }


    //查询单个秒杀
    @Override
    public SeckillDetail getById(int seckillId) {

        //1、访问redis
        SeckillDetail seckillDetail = redisDao.getSeckill(seckillId);
        //2、访问数据库
        if(seckillDetail == null){
            seckillDetail = seckillDao.queryById(seckillId);

            //3.放入redis
            redisDao.putSeckill(seckillDetail);

        }


        return seckillDetail;
    }

    @Override
    public Exposer exportSeckillUrl(int seckillId) {
        //1、访问redis
        SeckillDetail seckillDetail = redisDao.getSeckill(seckillId);
        //2、访问数据库
        if(seckillDetail == null){
            seckillDetail = seckillDao.queryById(seckillId);
            //查不到活动
            if(seckillDetail == null){
                return new Exposer(false,seckillId);
            }else {
                //3.放入redis
                redisDao.putSeckill(seckillDetail);
            }
        }

        Date startTime = seckillDetail.getSeckill_starttime();
        Date endTime = seckillDetail.getSeckill_endtime();
        //系统当前时间
        //系统当前时间
        Date nowTime = new Date();
        // 开始时间大于现在的时候说明没有开始秒杀活动；秒杀活动结束时间小于现在的时间说明秒杀已经结束了
        if(nowTime.getTime() < startTime.getTime() || nowTime.getTime() > endTime.getTime()){
            return new Exposer(false,seckillId,nowTime.getTime(),startTime.getTime(),endTime.getTime());
        }
        //定义md5----转换特定字符串，不可逆
        String md5 = getMD5(seckillId);
        return new Exposer(true,md5,seckillId);
    }

    //生成md5
    private String getMD5(int seckillId){
        String base = seckillId+"/"+slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    //判断MD5是否被篡改
    @Override
    public Boolean IsMd5Rignt(int seckillId,String md5) {
        if(md5 == null || !md5.equals(getMD5(seckillId))){
            logger.error("秒杀数据被篡改");
            return false;
        }
        return true;
    }

    //关闭秒杀操作
    @Override
    public CloseSeckill closeSeckillProcedure() {

        Date nowTime = new Date();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("nowtime",nowTime);
        map.put("result",null);
        //执行存储过程，result被赋值
        try{

            seckillDao.closeSeckill(map);
            //获取result
            int result = MapUtils.getInteger(map,"result",-3);

            if(result == 1){
                //关闭成功
                return new CloseSeckill(true,CloseSeckillStateEnum.SUCCESS);
            }else {
                //关闭不成功
                return new CloseSeckill(false,CloseSeckillStateEnum.stateOf(result));
            }

        }catch (Exception e){
            logger.error(e.getMessage(),e);
            //出现异常
            return new CloseSeckill(false,CloseSeckillStateEnum.INNER_ERRO);

        }
    }

    //增加提醒
    @Override
    public Remind addRemind(int seckillId,String email) {

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("seckill_id",seckillId);
        map.put("email",email);
        map.put("result",null);

        //执行存储过程，result被赋值
        try{
            seckillReminderDao.addReminder(map);
            //获取result
            int result = MapUtils.getInteger(map,"result",-2);

            if(result == 1){
                //设置提醒成功
                return new Remind(true,RemindStateEnum.SUCCESS);
            }else {
                //插入不成功，自动匹配
                return new Remind(false,RemindStateEnum.stateOf(result));
            }

        }catch (Exception e){
            logger.error(e.getMessage(),e);
            //出现异常
            return new Remind(false,RemindStateEnum.INNER_ERRO);

        }

    }

    @Override
    public List<SeckillDetail> getRecentSeckill() {
        return seckillDao.getRecentSeckill();
    }

    //执行秒杀
    @Override
    public SeckillExecution executeSeckill(int seckillId, String email, String md5) throws SecKillException, RepeatKillException, SecKillCloseException {
        if(md5 == null || !md5.equals(getMD5(seckillId))){
            logger.error("秒杀数据被篡改");
            throw new SecKillException("seckill data rewrite");
        }

        //执行秒杀业务逻辑  减库存+记录购买行为（后续还要增加订单//TODO）
        Date nowTime = new Date();

        //WHY TRY CATCH
        //答：除了我们自定义的异常之外，还有可能存在去他的异常（比如说DB连接超时、DB连接断了）
        //同时为了方便接口使用方获知到底是什么异常，所以在抛出检查型异常前，先catch一下指定异常
        try {
            //减库存成功，记录购买行为
            int insertCount = successKilledDao.insertSuccessKilled(seckillId,email);
            //唯一：seckillId,email
            if(insertCount <=0){
                //重复秒杀
                throw new RepeatKillException("seckill repeated");
            }else {
                //减库存,热点商品的竞争
                int updateCount = seckillDao.reduceNumber(seckillId,nowTime);
                if(updateCount <= 0){
                    //没有更新到记录，秒杀结束，rollback
                    throw new SecKillCloseException("eckill had closed");
                }else {
                    //秒杀成功，commit
                    SuccessKilled successKilled = successKilledDao.queryById(seckillId,email);
                    return new SeckillExecution(seckillId,SeckillStateEnum.SUCCESS,successKilled);

                }

            }


        }catch (SecKillCloseException e1){
            throw e1;
        }
        catch (RepeatKillException e2){
            throw e2;
        }
        catch (Exception e){
            logger.error(e.getMessage(),e);
            //抛出业务异常，把所有的检查型异常(所有编译异常)转化为运行时异常
            throw new SecKillException("seckill inner erro："+e.getMessage());

        }
    }

    //执行秒杀--优化（运用存储过程）
    @Override
    public SeckillExecution executeSeckillProcedure(int seckillId, String email, int addressId, String md5) {
        if(md5 == null || !md5.equals(getMD5(seckillId))){
            logger.error("秒杀数据被篡改");
            return new SeckillExecution(seckillId,SeckillStateEnum.DATA_REWRITE);
        }
        //执行秒杀业务逻辑  减库存+记录购买行为（后续还要增加订单//TODO）
        Date killTime = new Date();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("seckillId",seckillId);
        map.put("email",email);
        map.put("addressId",addressId);
        map.put("killTime",killTime);
        map.put("result",null);
        //执行存储过程，result被赋值
        try{

            seckillDao.killByProcedure(map);
            //获取result
            int result = MapUtils.getInteger(map,"result",-2);
            if(result == 1){
                SuccessKilled sk = successKilledDao.queryById(seckillId,email);
                return new SeckillExecution(seckillId,SeckillStateEnum.SUCCESS,sk);
            }else {
                return new SeckillExecution(seckillId,SeckillStateEnum.stateOf(result));
            }

        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return new SeckillExecution(seckillId,SeckillStateEnum.INNER_ERRO);

        }
    }

    @Override
    public List<Address> getAddress(String email){
        return seckillDao.getAddress(email);
    }





}
