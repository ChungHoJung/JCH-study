package kr.or.nextit.common.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;



public class CookieBox {
	
	private Map<String, Cookie> cookieMap = new HashMap<String,Cookie>();
//	private HashMap<String, Cookie> cookieMap = new HashMap<String,Cookie>();
	private static String charType = "utf-8";
	
	/**
	 * 쿠키(Cookie) request 객체에서 가지고와서 cookieMap 객체에 주
	 * @param request
	 */
	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(),cookie);
			}
		}
	}
	
	//cookiemap 객체에서 name에 해당되는 값을 Cookie값으로 반환
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	
	
	
	// 쿠키에 들어 있는 값을 URLDecoder.decode() 메소드로 값을 반환
	public String getValue(String name) throws IOException{
		Cookie cookie = cookieMap.get(name);
		if(cookie == null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "utf-8");
	}
	
	
	// 등록된 쿠키명이 있는지 없는지 확인
	public boolean exists(String name) {
		return cookieMap.containsKey(name);
	}
	
	
	// 쿠키 생성시 기본 설정 생성될 쿠키명과 값
	public static Cookie createCookie(
		String name,
		String value
	) throws IOException{
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, charType));
		cookie.setPath("/");
		return cookie;
	}
	
	public static Cookie createCookie(
			String name,
			String value,
			String path
		) throws IOException{
			Cookie cookie = new Cookie(name, URLEncoder.encode(value, charType));
			cookie.setPath(path);
			return cookie;
		}
	
	
	public static Cookie createCookie(
			String name,
			String value,
			String path,
			int maxAge
		) throws IOException{
			Cookie cookie = new Cookie(name, URLEncoder.encode(value, charType));
			cookie.setPath(path);
			cookie.setMaxAge(maxAge);
			return cookie;
		}
	
	
	public static Cookie createCookie(
			String name,
			String value,
			String path,
			int maxAge,
			String domain
		) throws IOException{
			Cookie cookie = new Cookie(name, URLEncoder.encode(value,charType));
			cookie.setPath(path);
			cookie.setMaxAge(maxAge);
			cookie.setDomain(domain);
			return cookie;
		}
	
	
	
	
	
	
}
