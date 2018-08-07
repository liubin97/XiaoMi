package com.ssm.model.service.serviceInterfce;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.Seckill;
import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.dto.CloseSeckill;
import com.ssm.model.dto.Exposer;
import com.ssm.model.dto.Remind;
import com.ssm.model.dto.SeckillExecution;
import com.ssm.model.exception.RepeatKillException;
import com.ssm.model.exception.SecKillCloseException;
import com.ssm.model.exception.SecKillException;
import com.ssm.model.vo.DateList;

import java.util.Date;
import java.util.List;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 15:23
 **/
public interface SeckillService {


    /**
     * 查询所有秒杀记录
     *
     * @return
     */
    public List<SeckillDetail> getSeckillList();

    /**
     * 查询秒杀时间表
     * @return
     */
    public List<DateList> getKillTimeList();


    /**
     * 查询单个秒杀记录
     *
     * @param seckillId
     * @return
     */
    public SeckillDetail getById(int seckillId);

    /**
     * 秒杀开启时输出秒杀接口的地址
     * 否则输出输出系统时间和秒杀时间
     * @param seckillId
     */
    public Exposer exportSeckillUrl(int seckillId);

    /**
     *执行秒杀操作
     * @param seckillId
     * @param email
     * @param md5
     *  由exportSeckillUrl得到的md5值和内部的md5生成规则做对比，
     *  如果md5值变了说明以后url被篡改了，此时拒绝执行秒杀
     */
    public SeckillExecution executeSeckill(int seckillId, String email, String md5)
            throws SecKillException,RepeatKillException,SecKillCloseException;


    /**
     * 执行秒杀操作by存储过程
     * @param seckillId
     * @param email
     * @param addressId
     * @param md5
     * @return
     *
     * 由exportSeckillUrl得到的md5值和内部的md5生成规则做对比，
     * 如果md5值变了说明以后url被篡改了，此时拒绝执行秒杀
     */
    public SeckillExecution executeSeckillProcedure(int seckillId, String email, int addressId,String md5);

    /**
     * 在下单前判断md5是否正确为
     * @param seckillId
     * @return
     */
    public Boolean IsMd5Rignt(int seckillId,String md5);

    /**
     * 关闭为完成的秒杀
     * @return
     */
    public CloseSeckill closeSeckillProcedure();

    /**
     * 增加提醒
     * @return
     */
    public Remind addRemind(int seckillId,String email);

    /**
     * 获取最近的秒杀
     * @return
     */
    public List<SeckillDetail> getRecentSeckill();


    public List<Address> getAddress(String email);


}
