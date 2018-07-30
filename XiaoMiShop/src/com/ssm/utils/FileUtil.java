package com.ssm.utils;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	//文件上传
	public static String updateFile(MultipartFile file,String path){
		if(file.getSize()==0){
			return "";
		}
		//获取原文件名
		String oldName = file.getOriginalFilename();
		//构建新文件名
		String newName = System.currentTimeMillis() + oldName.substring(oldName.indexOf("."));
		File newFile = new File(path,newName);
		if(!newFile.exists()){
			newFile.mkdirs();
		}
		//上传
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newName;
	}
}
