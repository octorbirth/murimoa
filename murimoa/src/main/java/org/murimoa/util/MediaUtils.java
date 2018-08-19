package org.murimoa.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	
	private static Map<String, MediaType> map;
	
	static {
		map = new HashMap();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("GIF", MediaType.IMAGE_GIF);
		map.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType checkType(String type) {
		return map.get(type.toUpperCase());
	}
}
