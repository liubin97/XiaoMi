package com.ssm.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.service.GoodsService;
import com.ssm.utils.FileUtil;

@Controller
public class GoodsController {
	//文件绝对路径
	final String PATH = "C:/Users/ttc/Desktop/XiaoMiShop/WebContent/";
	@Autowired
	private GoodsService goodsService;
	@RequestMapping("insertGoods")
	public String insertGoods(Goods goods,HttpServletRequest request,@RequestParam MultipartFile goodsVideo,@RequestParam MultipartFile profilePic,@RequestParam MultipartFile goodsIntroductionPic,@RequestParam MultipartFile[] goodsPic) throws IOException{
		//文件相对路径
		String picPath = "goods/"+goods.getGoods_code()+"/picture/";
		String videoPath = "goods/"+goods.getGoods_code()+"/video/";
		//记录文件名称
		String name = "";
		try {
			//记录video
			//获取储存文件名
			name = FileUtil.updateFile(goodsVideo, PATH+videoPath);
			//记录url
			goods.setVideo_set_url(videoPath+name);
			
			//记录profile picture
			//获取储存文件名
			name = FileUtil.updateFile(profilePic, PATH+picPath);
			//记录url
			goods.setGoods_pic_url(picPath+name);
			
			//记录商品介绍图片
			//获取储存文件名
			name = FileUtil.updateFile(goodsIntroductionPic, PATH+picPath);
			//记录url
			goods.setGoods_desc_pic_url(picPath+name);
			
			//记录picture
			List<GoodsPreviewPicture> previewPictureList = new ArrayList<GoodsPreviewPicture>();
			goods.setPreviewPictureList(previewPictureList);
			for(MultipartFile picFile : goodsPic){
				//获取储存文件名
				name = FileUtil.updateFile(picFile,PATH+picPath);
				//记录url
				GoodsPreviewPicture picture = new GoodsPreviewPicture();
				picture.setGoods_url(picPath+name);				
				goods.getPreviewPictureList().add(picture);
			}
			goodsService.insertGoods(goods);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "add_new_goods";
	}
	@RequestMapping("insertDetail")
	public String insertDetail(GoodsDetail goodsDetail,String goodsName,@RequestParam MultipartFile[] goodsPic) throws IOException{
		//文件相对路径
		String picPath = "goods/"+goodsName+"/picture/";
		try {
			//记录储存文件名
			String name = "";
			List<GoodsPicture> goodsPictureList = new ArrayList<GoodsPicture>();
			goodsDetail.setGoodsPictureList(goodsPictureList);
			for(MultipartFile picFile : goodsPic){
				//获取储存文件名
				name = FileUtil.updateFile(picFile, PATH+picPath);
				
				//记录url
				GoodsPicture picture = new GoodsPicture();
				picture.setPicture_set_url(picPath+name);
				goodsDetail.getGoodsPictureList().add(picture);
			}
			goodsService.insertDetail(goodsDetail);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "add_new_kind";
	}
	@RequestMapping("getAllKindByGoodsId")
	public @ResponseBody String[] getAllKindByGoodsId(Integer goodsId){
		String[] kindList = goodsService.getAllKindByGoodsId(goodsId);
		return kindList;
	}
	@RequestMapping("getAllColorBygoodsIdAndcolor")
	public @ResponseBody List<GoodsDetail> getAllColor(GoodsDetail goodsDetail){
		List<GoodsDetail> datailList = goodsService.getAllColorBygoodsIdAndcolor(goodsDetail);
		return datailList;		
	}
	@RequestMapping("getGoodsByGoodsId")
	public @ResponseBody Goods getGoodsByGoodsId(Integer goodsId){
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		return goods;
	}
	@RequestMapping("updateStockAdd")
	public String updateStockAdd(GoodsDetail goodsDetail){
		goodsService.updateStockAdd(goodsDetail);
		return "add_goods_stock";
	}
	@RequestMapping("updateStockChange")
	public @ResponseBody String updateStockChange(GoodsDetail goodsDetail){
		goodsService.updateStockChange(goodsDetail);
		return "change";
	}
	@RequestMapping("getAllStockByGoodsId")
	public @ResponseBody List<GoodsDetail> getAllStockByGoodsId(Integer goodsId){
		List<GoodsDetail> detailList = goodsService.getAllStockByGoodsId(goodsId);
		return detailList;
		
	}
	@RequestMapping("getAllDetailByGoodsId")
	public @ResponseBody List<GoodsDetail> getAllDetailByGoodsId(Integer goodsId){
		List<GoodsDetail> detailList = goodsService.getAllDetailByGoodsId(goodsId);
		return detailList;
		
	}
}
