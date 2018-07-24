package com.ssm.controller;

import java.io.File;
import java.io.IOException;

public class FileTest {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		File f = new File("src","a");
		f.createNewFile();
		System.out.println(f.getAbsolutePath());
		File file = new File("src","res");
		
	}

}
