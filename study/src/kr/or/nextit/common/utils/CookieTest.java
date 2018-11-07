package kr.or.nextit.common.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieTest {
	
	HashMap<String, Cookie> cook = new HashMap<>();
	
	public CookieTest(HttpServletRequest request) {
		Cookie[] c = request.getCookies();
			for(Cookie inf : c) {
				cook.put(inf.getName(), inf);
		}
	}
	
	public Cookie CookgetName(String name) {
		
		return cook.get(name);
	}
	
	public String CookGetValue(String name) throws UnsupportedEncodingException {
		Cookie c = cook.get(name);
		
		return URLDecoder.decode(c.getValue(),"utf-8"); 
	}
	
	public boolean exitCook(String name) {
		return cook.containsKey(name);
	}
	
	public Cookie getCookie(String name, String value) throws UnsupportedEncodingException {
		Cookie ck = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		return ck;
	}
	
	public Cookie getCookie(String name, String value, String age) throws UnsupportedEncodingException {
		Cookie ck = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		ck.setMaxAge(3);
		return ck;
	}
	
	public Cookie getCookie(String name, String value, String age, String path) throws UnsupportedEncodingException {
		Cookie ck = new Cookie(name, URLEncoder.encode(value,"utf-8"));
		ck.setMaxAge(3);
		ck.setPath("/");
		return ck;
	}
	
	
	
}
