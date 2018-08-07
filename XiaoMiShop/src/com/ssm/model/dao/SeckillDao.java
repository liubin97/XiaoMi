package com.ssm.model.dao;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.Seckill;
import com.ssm.model.bean.SeckillDetail;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:25
 **/
public interface SeckillDao {

    /**
     * 减库存
     * @param seckillId
     * @param killTime
     * @return 如果影响行数>1,表示更新的记录行数
     */
    public int reduceNumber(@Param("seckillId") int seckillId, @Param("killTime") Date killTime) ;

    /**
     * 查询秒杀
     * @param seckillId
     * @return
     */
    public SeckillDetail queryById(int seckillId);

    /**
     * 查询秒杀时间列表
     * @return
     */
    public List<Date> getStartTimeList();

    /**
     * 查询秒杀结束时间
     * @return
     */
    public List<Date> getEndTimeList();

    //    用于秒杀测试
    public SeckillDetail getById(int seckillId);


    /**
     * 使用存储过程
     * @param paramMap
     */
    public void killByProcedure(Map<String,Object> paramMap);

    /**
     * 关闭秒杀
     * @param paramMap
     */
    public void closeSeckill(Map<String,Object> paramMap);

    /**
     * 查询所有的有效的秒杀列表
     * @return
     */
    public List<SeckillDetail> selectAll();


    /**
     * 获取最近的秒杀
     * @return
     */
    public List<SeckillDetail> getRecentSeckill();

    //模块测试用查询地址
    public List<Address> getAddress(String email);





}
