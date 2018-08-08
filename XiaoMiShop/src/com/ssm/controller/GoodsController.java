package com.ssm.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.model.bean.Goods;
import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.service.GoodsService;
import com.ssm.utils.CheckUtil;
import com.ssm.utils.FileUtil;

@Controller
public class GoodsController {
	//文件绝对路径
	//final String PATH = "C:/Users/ttc/Desktop/XiaoMiShop/WebContent/";
	@Autowired
	private GoodsService goodsService;
	@RequestMapping("insertGoods")
	public String insertGoods(Goods goods,HttpServletRequest request, @RequestParam MultipartFile goodsVideo,@RequestParam MultipartFile profilePic,@RequestParam MultipartFile goodsIntroductionPic,@RequestParam MultipartFile[] goodsPic) throws IOException{
		//服务器文件根路径
		String savePath = request.getServletContext().getRealPath("/"); 
		//文件相对路径
		String picPath = "goods/"+goods.getGoods_code()+"/picture/";
		String videoPath = "goods/"+goods.getGoods_code()+"/video/";
		//记录文件名称
		String name = "";
		try {
			//记录video
			//获取储存文件名
			name = FileUtil.updateFile(goodsVideo, savePath+videoPath);
			//记录url
			if(!"".equals(name)){
				goods.setVideo_set_url(videoPath+name);
			}
			
			
			//记录profile picture
			//获取储存文件名
			name = FileUtil.updateFile(profilePic, savePath+picPath);
			//记录url
			if(!"".equals(name)){
				goods.setGoods_pic_url(picPath+name);
			}
			
			
			//记录商品介绍图片
			//获取储存文件名
			name = FileUtil.updateFile(goodsIntroductionPic, savePath+picPath);
			//记录url
			if(!"".equals(name)){
				goods.setGoods_desc_pic_url(picPath+name);
			}
			
			
			//记录picture
			List<GoodsPreviewPicture> previewPictureList = new ArrayList<GoodsPreviewPicture>();
			goods.setGoodsPreviewPictureList(previewPictureList);
			for(MultipartFile picFile : goodsPic){
				//获取储存文件名
				name = FileUtil.updateFile(picFile,savePath+picPath);
				//记录url
				if(!"".equals(name)){
					GoodsPreviewPicture picture = new GoodsPreviewPicture();
					picture.setGoods_url(picPath+name);				
					goods.getGoodsPreviewPictureList().add(picture);
				}
				
			}
			goodsService.insertGoods(goods);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "add_new_goods";
	}
	@RequestMapping("insertDetail")
	public String insertDetail(GoodsDetail goodsDetail,Integer goods_id,HttpServletRequest request,@RequestParam MultipartFile[] goodsPic) throws IOException{
		Goods newGoods = goodsService.getGoodsByGoodsId(goods_id);
		//服务器文件根路径
		String savePath = request.getServletContext().getRealPath("/"); 
		//文件相对路径
		String picPath = "goods/"+newGoods.getGoods_code()+"/picture/";
		
		try {
			//记录储存文件名
			String name = "";
			List<GoodsPicture> goodsPictureList = new ArrayList<GoodsPicture>();
			goodsDetail.setGoodsPictureList(goodsPictureList);
			for(MultipartFile picFile : goodsPic){
				//获取储存文件名
				name = FileUtil.updateFile(picFile, savePath+picPath);
				if(!name.equals("")){
					//记录url
					GoodsPicture picture = new GoodsPicture();
					picture.setPicture_set_url(picPath+name);
					goodsDetail.getGoodsPictureList().add(picture);
				}
				
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
	@RequestMapping("getAllColorBygoodsIdAndKind")
	public @ResponseBody List<GoodsDetail> getAllColorBygoodsIdAndKind(@RequestBody GoodsDetail goodsDetail){
		List<GoodsDetail> datailList = goodsService.getAllColorBygoodsIdAndKind(goodsDetail);
		return datailList;		
	}
	@RequestMapping("getGoodsByGoodsId")
	public @ResponseBody Goods getGoodsByGoodsId(Integer goodsId){
		Goods goods = goodsService.getGoodsByGoodsId(goodsId);
		return goods;
	}
	@RequestMapping("getGoodsPicByGoodsId")
	public @ResponseBody List<GoodsPreviewPicture> getGoodsPicByGoodsId(Integer goodsId){
		List<GoodsPreviewPicture> picList = goodsService.getGoodsPicByGoodsId(goodsId);
		return picList;
	}
	@RequestMapping("getAllStockByGoodsId")
	public @ResponseBody Map<String,Object> getAllStockByGoodsId(Integer goodsId,Integer pageNum){

		return goodsService.getAllStockByGoodsId(goodsId,pageNum);
		
	}
	@RequestMapping("getAllDetailByGoodsId")
	public @ResponseBody Map<String,Object> getAllDetailByGoodsId(Integer goodsId,Integer pageNum){
		
		return goodsService.getAllDetailByGoodsId(goodsId,pageNum);
		
	}
	@RequestMapping("getAttributesByGoodsId")
	public @ResponseBody List<GoodsAttribute> getAttributesByGoodsId(Integer goodsId){
		List<GoodsAttribute> attributeList = goodsService.getAttributesByGoodsId(goodsId);
		return attributeList;
	}
	@RequestMapping("getDetailPicByDetailId")
	public @ResponseBody List<GoodsPicture> getDetailPicByDetailId(Integer detailId){
		List<GoodsPicture> detailPicList = goodsService.getDetailPicByDetailId(detailId);
		return detailPicList;
	}
	
	@RequestMapping("updateStockAdd")
	public String updateStockAdd(GoodsDetail goodsDetail){
		goodsService.updateStockAdd(goodsDetail);
		return "add_goods_stock";
	}
	@RequestMapping("updateStockChange")
	public @ResponseBody String updateStockChange(GoodsDetail goodsDetail){
		goodsService.updateStockChange(goodsDetail);
		return "true";
	}
	@RequestMapping("updateAllStockChange")
	public @ResponseBody String updateAllStockChange(@RequestBody List<GoodsDetail> goodsDetail){
		goodsService.updateAllStockChange(goodsDetail);
		return "true";
	}
	@RequestMapping("updateGoods")
	public void updateGoods(Goods goods,HttpServletRequest request,@RequestParam MultipartFile goodsVideo,@RequestParam MultipartFile profilePic,@RequestParam MultipartFile goodsIntroductionPic){
		//服务器文件根路径
		String savePath = request.getServletContext().getRealPath("/"); 
		//文件相对路径
		String picPath = "goods/"+goods.getGoods_code()+"/picture/";
		String videoPath = "goods/"+goods.getGoods_code()+"/video/";
		//记录文件名称
		String name = "";
		try {
			//记录video
			//获取储存文件名
			name = FileUtil.updateFile(goodsVideo, savePath+videoPath);
			//记录url
			if(!name.equals("")){
				goods.setVideo_set_url(videoPath+name);
			}
				
			//记录profile picture
			//获取储存文件名
			name = FileUtil.updateFile(profilePic, savePath+picPath);
			//记录url
			if(!name.equals("")){
				goods.setGoods_pic_url(picPath+name);
			}

			//记录商品介绍图片
			//获取储存文件名
			name = FileUtil.updateFile(goodsIntroductionPic, savePath+picPath);
			//记录url
			if(!name.equals("")){
				goods.setGoods_desc_pic_url(picPath+name);
			}

			goodsService.updateGoods(goods);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	@RequestMapping("updateGoodsPic")
	public void updateGoodsPic(Goods goods,Integer goodsId,HttpServletRequest request,@RequestParam MultipartFile[] goodsPic){
		Goods newGoods = goodsService.getGoodsByGoodsId(goodsId);
		goods.setGoods_id(goodsId);
		//服务器文件根路径
		String savePath = request.getServletContext().getRealPath("/"); 
		//文件相对路径
		String picPath = "goods/"+newGoods.getGoods_code()+"/picture/";
		String name="";
		int i = 0;
		for(MultipartFile picFile : goodsPic){
			//获取储存文件名
			name = FileUtil.updateFile(picFile,savePath+picPath);
			//记录url
			if(!name.equals("")){
				for(int j=i;j<goods.getGoodsPreviewPictureList().size();j++){
					i++;
					if(goods.getGoodsPreviewPictureList().get(j).getGoods_pre_pic_status()==1){
						goods.getGoodsPreviewPictureList().get(j).setGoods_url(picPath+name);	
						
						break;
					}
					
				}
			}
			
			
		}
		goodsService.updateGoodsPic(goods);
	}
	@RequestMapping("updateAttribute")
	public void updateAttribute(@RequestBody List<GoodsAttribute> attributeList){
		if(attributeList==null){
			return;
		}
		
		goodsService.updateAttribute(attributeList);
	}
	@RequestMapping("updateDetail")
	public @ResponseBody String updateDetail(@RequestBody GoodsDetail goodsDetail){
		goodsService.updateDetail(goodsDetail);
		return "true";
	}	
	@RequestMapping("updateDetailPic")
	public @ResponseBody String updateDetailPic(GoodsDetail goodsDetail,Integer detailId,HttpServletRequest request,@RequestParam MultipartFile[] detailPic){
		
		GoodsDetail newGoodsDetail = goodsService.getDetailByDetailId(detailId);
		goodsDetail.setGoods_detail_id(detailId);
		Goods newGoods = goodsService.getGoodsByGoodsId(newGoodsDetail.getGoods_id());
		//服务器文件根路径
		String savePath = request.getServletContext().getRealPath("/");
		//文件相对路径
		String picPath = "goods/"+newGoods.getGoods_code()+"/picture/";
		String name="";
		int i = 0;
		for(MultipartFile picFile : detailPic){
			//获取储存文件名
			name = FileUtil.updateFile(picFile,savePath+picPath);
			if(!name.equals("")){
				//记录url
				for(int j=i;j<goodsDetail.getGoodsPictureList().size();j++){
					i++;
					if(goodsDetail.getGoodsPictureList().get(j).getPicture_set_status()==1){
						goodsDetail.getGoodsPictureList().get(j).setPicture_set_url(picPath+name);	
						
						break;
					}
					
				}
			}
			
			
		}
		goodsService.updateDetailPic(goodsDetail);
		return "true";
	} 
	
	@RequestMapping("deleteDetail")
	public @ResponseBody String deleteDetail(Integer goods_detail_id){
		goodsService.deleteDetail(goods_detail_id);
		return "true";
	}
	@RequestMapping("deleteGoodsByGoodsId")
	public @ResponseBody String deleteGoodsByGoodsId(Integer goodsId){
		goodsService.deleteGoodsByGoodsId(goodsId);
		return "true";
	}
	@RequestMapping("validateGoodsName")
	public @ResponseBody String validateGoodsName(@RequestBody Goods goods){
		String flag = "void";
		String goodsName = goods.getGoods_name();
		if(goodsName!=null&&!"".equals(goodsName)){
			flag = goodsService.validateGoods(goods);
		}
		return flag;
	}
	@RequestMapping("validateGoodsCode")
	public @ResponseBody String validateGoodsCode(Goods goods){
		String flag = "void";
		int goodsCode = goods.getGoods_code();
		if(goodsCode!=0){
			flag = goodsService.validateGoods(goods);
		}
		return flag;
	}
	
	@RequestMapping("validateGoodsDetailColor")
	public @ResponseBody String validateGoodsDetail(@RequestBody GoodsDetail goodsDetail){
		String flag = "void";
		String color = goodsDetail.getColor();
		if(color!=null&&!"".equals(color)){
			flag = goodsService.validateGoodsDetail(goodsDetail);
		}
		return flag;
	}
	@RequestMapping("validatePrice")
	public @ResponseBody String validatePrice(String price){
		String flag = "void";
		if(price!=null&&!"".equals(price)){
			flag = CheckUtil.TestPrice(price)?"true":"false";
		}
		return flag;
		
	}
}
