package com.ssm.model.dao;

import com.ssm.model.bean.SuccessKilled;
import org.apache.ibatis.annotations.Param;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:27
 **/
public interface SuccessKilledDao {

    /**
     * 插入购买明细，可以过滤重复
     * @param seckillId
     * @param email
     * @return 插入的行数及数量
     */
    public int insertSuccessKilled(@Param("seckillId") int seckillId, @Param("email") String email);

    /**
     * 根据id查询successkilled并携带秒杀商品列表
     * @param seckillId
     * @return
     */
    public SuccessKilled queryById(@Param("seckillId") int seckillId, @Param("email") String email);
}
