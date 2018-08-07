package com.ssm.model.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.GoodsDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.SecKillInfo;
import com.ssm.model.dao.MSecKillDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MSecKillService {
	@Autowired
	private MSecKillDAO mSecKillDAO;
	
	public void addSecKill(SecKillInfo secKillInfo) {
		mSecKillDAO.insertSecKill(secKillInfo);
		mSecKillDAO.updateMGoodsDetailStock(secKillInfo);
	}

    public Map<String, Object> selectSecKill(SecKillInfo secKillInfo, int pageSize, int pagenum) {

		Page<SecKillInfo> page = PageHelper.startPage(pagenum,pageSize);
		mSecKillDAO.selectSecKill(secKillInfo);
		int maxPageNum = page.getPages();
		List<SecKillInfo> list = page.getResult();
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		map.put("maxPageNum",maxPageNum);
		return map;
	}

	public SecKillInfo selectEditMSecKillById(int seckill_id) {
		SecKillInfo secKillInfo = mSecKillDAO.selectEditMSecKillById(seckill_id);
		return secKillInfo;
	}

	public GoodsDetail selectGoodsDetailById(int goods_detail_id) {
		GoodsDetail goodsDetail = mSecKillDAO.selectGoodsDetailById(goods_detail_id);
		return  goodsDetail;
	}

	public void updateMSecKill(SecKillInfo secKillInfo,int seckill_num_ref) {
		int seckill_num = secKillInfo.getSeckill_num()-seckill_num_ref;
		SecKillInfo secKillInfo_ref = new SecKillInfo();
		secKillInfo_ref.setGoods_detail_id(secKillInfo.getGoods_detail_id());
		secKillInfo_ref.setSeckill_num(seckill_num);
		mSecKillDAO.updateMGoodsDetailStock(secKillInfo_ref);//更新库存，若为负数则添加，正数则减少
		mSecKillDAO.updateMSecKill(secKillInfo);

	}

	public void deleteMSecKill(int seckill_id) {
		mSecKillDAO.deleteMSecKill(seckill_id);
		mSecKillDAO.updateMAddGoodsDetailStock(seckill_id);
	}

	public int validateSecKillNum(int seckill_num, int goods_detail_id) {
		int stock = mSecKillDAO.selectGoodsDetailStockById(goods_detail_id);
		int result = 0;
		if(stock>=seckill_num){
			result = 0;
		}else {
			result = 1;
		}
		return result;
	}

	public int validateSecKillMoney(float seckill_money, int goods_detail_id) {
		float prime_price = mSecKillDAO.selectGoodsDetailPriceById(goods_detail_id);
		int result = 1;
		if (prime_price>seckill_money){
			result = 0;
		}else {
			result = 1;
		}
		return result;
	}
}
