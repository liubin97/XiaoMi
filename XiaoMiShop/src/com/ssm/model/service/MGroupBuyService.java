package com.ssm.model.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.dao.MGroupBuyDAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MGroupBuyService {
	
	@Autowired
	private MGroupBuyDAO mGroupBuyDAO;
	
	public void addGroupBuy(GroupBuyInfo groupBuyInfo) {
		mGroupBuyDAO.insertGroupBuy(groupBuyInfo);
		
	}
	public List<Goods> getAllGoods(){
		List<Goods> list = mGroupBuyDAO.getAllGoods();
		return list;
	}

	public List<GoodsDetail> getAllGoodsDetail() {
		List<GoodsDetail> list = mGroupBuyDAO.getAllGoodsDetail();
		return list;
	}

	public List<GoodsDetail> selectGoodsDetailByGoodsId(int goods_id) {
		List<GoodsDetail> list = mGroupBuyDAO.selectGoodsDetailByGoodsId(goods_id);
		return list;
	}

	public Map<String,Object> selectGroupBuyInfo(GroupBuyInfo groupBuyInfo, int pageSize, int pageNum) {
		int maxPageNum=0;

		Page<GroupBuyInfo> page = PageHelper.startPage(pageSize, pageNum);
		mGroupBuyDAO.selectGroupBuyInfo(groupBuyInfo);
		int pagecount = (int)page.getTotal();
		if(pagecount%5==0){
			maxPageNum=pagecount/5;
		}else {
			maxPageNum=pagecount/5+1;
		}
		List<GroupBuyInfo> list = page.getResult();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("maxPageNum",maxPageNum);
		map.put("list",list);
		return map;
	}

	public void updateGroupBuyInfo(GroupBuyInfo groupBuyInfo) {
		mGroupBuyDAO.updateGroupBuyInfo(groupBuyInfo);
		Date date = new Date();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format0.format(date);
		List<String> list = mGroupBuyDAO.selectEditMessgeUser(groupBuyInfo.getGroup_buy_info_id());//获取被修改的团购信息的用户
		for(String u : list){
			Message m = new Message();
			m.setMessage_text("您购买的团购商品信息已修改");
			m.setMessage_title("重要消息");
			m.setMessage_type(0);
			m.setRead_flag(0);
			m.setUser_email(u);
			m.setSend_date(time);
			mGroupBuyDAO.insertEditMessage(m);
		}

	}

	public GroupBuyInfo selectEditGroupBuy(int group_buy_info_id) {
		GroupBuyInfo groupBuyInfo = mGroupBuyDAO.selectEditGroupBuy(group_buy_info_id);

		return  groupBuyInfo;
	}

	public GoodsDetail selectGoodsDetailById(int goods_detail_id) {
		GoodsDetail goodsDetail = mGroupBuyDAO.selectGoodsDetailById(goods_detail_id);
		return goodsDetail;
	}

	public void deleteGroupBuyingTwo(int group_buy_info_id) {
		int sum_goods = 0 ;//总共需要返回库存的商品数
		Map<String,Integer> map = new HashMap<>();
		GroupBuyInfo groupBuyInfo = mGroupBuyDAO.selectGroupBuyInfoById(group_buy_info_id);
		mGroupBuyDAO.deleteGroupBuying(group_buy_info_id);//删除团购
		//查询未完成的团购列表
		List<GroupBuyList> groupBuyList = mGroupBuyDAO.selectGroupListByGroupBuyId(group_buy_info_id);

			sum_goods = groupBuyList.size()*groupBuyInfo.getGroup_num();

		map.put("group_buy_info_id",group_buy_info_id);
		map.put("sum_goods",sum_goods);
		//返还库存
		mGroupBuyDAO.updateGroupBuyGoodsStock(map);
		//修改团购列表状态
		mGroupBuyDAO.updateGroupBuyingList(group_buy_info_id);
		//修改订单状态
		mGroupBuyDAO.updateGroupBuyingOrder(group_buy_info_id);

		//给用户发送消息
		Date date = new Date();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format0.format(date);
		List<String> list = mGroupBuyDAO.selectEditMessgeUser(group_buy_info_id);
		for(String u : list){
			Message m = new Message();
			m.setMessage_text("您购买的团购商品已删除");
			m.setMessage_title("重要消息");
			m.setMessage_type(0);
			m.setRead_flag(0);
			m.setUser_email(u);
			m.setSend_date(time);
			mGroupBuyDAO.insertEditMessage(m);
		}

	}

	public void deleteGroupBuyingOne(int group_buy_info_id) {
		mGroupBuyDAO.deleteGroupBuying(group_buy_info_id);
	}

	public int validateGroupBuyPrice(float group_buy_price, int goods_detail_id) {
		float prime_price = mGroupBuyDAO.selectGoodsDetailPriceById(goods_detail_id);//获取详细商品原价
		int result = 0;
		if(prime_price>group_buy_price){
			result=0;//原价大于团购价，满足校验，返回0
		}else {
			result=1;
		}
		return result;
	}

	public int validateGroupNum(int group_num, int goods_detail_id) {
		int stock = mGroupBuyDAO.selectGoodsDetailStockById(goods_detail_id);//获取团购商品库存
		int result = 0;
		if(stock>=group_num){
			result=0;//库存大于等于团购所需人数，满足校验，返回0
		}else {
			result=1;
		}
		return result;
	}
}
