package com.ssm.model.dao;

import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.SecKillInfo;

import java.util.List;

public interface MSecKillDAO {
	public void insertSecKill(SecKillInfo secKillInfo);

	public List<SecKillInfo> selectSecKill(SecKillInfo secKillInfo);

    public SecKillInfo selectEditMSecKillById(int seckill_id);

    public GoodsDetail selectGoodsDetailById(int goods_detail_id);

    public void updateMSecKill(SecKillInfo secKillInfo);

    public void deleteMSecKill(int seckill_id);

    void updateMGoodsDetailStock(SecKillInfo secKillInfo);

    int selectGoodsDetailStockById(int goods_detail_id);

    float selectGoodsDetailPriceById(int goods_detail_id);

    void updateMAddGoodsDetailStock(int seckill_id);
}
