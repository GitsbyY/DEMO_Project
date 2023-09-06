package com.demo.util;

import java.util.UUID;

public class CommonUtils {
	//같은 이름이 있더라도 사용 할 수 있게 만들어준다
	public static String getRandomString() {
			//유니크아이디로 만들어준다.
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
