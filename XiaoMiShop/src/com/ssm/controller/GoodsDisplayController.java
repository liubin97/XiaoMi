package com.ssm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.ssm.model.bean.GoodsAttribute;
import com.ssm.model.bean.GoodsDetail;
import com.ssm.model.bean.GoodsPicture;
import com.ssm.model.bean.GoodsPreviewPicture;
import com.ssm.model.service.GoodsDisplayService;
import com.ssm.model.service.GoodsService;
import com.ssm.utils.FileUtil;

@Controller
public class GoodsDisplayController {
	@Autowired
	private GoodsDisplayService goodsDisplayService;
	
	@RequestMapping("getRevisedGoodsAttributes")
	public @ResponseBody List<GoodsAttribute> getRevisedGoodsAttributes(Integer goodsId){
		List<GoodsAttribute> attributeList = goodsDisplayService.getRevisedGoodsAttributes(goodsId);
		return attributeList;
	}

	
	@RequestMapping("getGoodsSpecPictures")
	public @ResponseBody List<GoodsPreviewPicture> getGoodsSpecPictures(Integer goodsId){
		List<GoodsPreviewPicture> picList = goodsDisplayService.getGoodsPictures(goodsId);
		return picList;
	}

}
