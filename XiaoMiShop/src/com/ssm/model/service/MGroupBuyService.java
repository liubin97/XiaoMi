package com.ssm.model.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.model.bean.GroupBuyInfo;
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
		mGroupBuyDAO.addGroupBuy(groupBuyInfo);
		
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
		Page<GroupBuyInfo> page = PageHelper.startPage(pageNum, pageSize);
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

	public void editGroupBuyInfo(GroupBuyInfo groupBuyInfo) {
		mGroupBuyDAO.editGroupBuyInfo(groupBuyInfo);
		Date date = new Date();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format0.format(date);
		List<String> list = mGroupBuyDAO.selectEditMessgeUser(groupBuyInfo.getGroup_buy_info_id());
		for(String u : list){
			Message m = new Message();
			m.setMessage_text("您购买的团购商品信息已修改");
			m.setMessage_title("重要消息");
			m.setMessage_type(0);
			m.setRead_flag(0);
			m.setUser_email(u);
			m.setSend_date(time);
			mGroupBuyDAO.addEditMessage(m);
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
}
