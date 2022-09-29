package com.ol.ex03.util;

import java.util.UUID;

public class MyFileUtils {
	
	// 파일명을 UUID로 변환
	public static String getUuidName(String filename) {
		String extension = null;
		String[] arr = filename.split("\\.");
		extension = arr[arr.length - 1];
		return UUID.randomUUID().toString().replaceAll("-", "") + "." + extension;
	}

}
