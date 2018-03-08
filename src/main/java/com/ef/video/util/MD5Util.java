package com.ef.video.util;

import java.security.MessageDigest;

public class MD5Util {
	 //十六进制下数字到字符的映射
private final static String [] hexDigits={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"};
     //将inputString加密
	public static String generatePassword(String inputString){
		return encodeByMD5(inputString);
	}
	public static boolean validatePassword(String password,String inputString){
		if(password.equalsIgnoreCase(encodeByMD5(inputString))){
			return true;
		}
		else  return false;
	}
	/**
	 * 加密
	 * @param originString
	 * @return
	 */
	public static String encodeByMD5(String originString){
		if(originString !=null){
			try{
				MessageDigest md=MessageDigest.getInstance("MD5");
				byte[] results=md.digest(originString.getBytes());
				String resultString=byteArrayToHexString(results);
				return resultString.toUpperCase();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
	        return null;
	}
	/**
	 * 将一个字节数组转换为十六进制字符串
	 * @param results
	 * @return
	 */
	private static String byteArrayToHexString(byte[] results) {
		StringBuffer resultSb=new StringBuffer();
		for(int i=0;i<results.length;i++){
			resultSb.append(byteToHexString(results[i]));
		}
		return resultSb.toString();
	}
	/**
	 * 将字符转换为十六进制字符
	 * @param b
	 * @return
	 */
	public static String byteToHexString(byte b){
		int n=b;
		if(n<0)
			n=256+n;
		int d1=n/16;
		int d2=n%16;
		return hexDigits[d1]+hexDigits[d2];
	}
	public static void main(String []args){
		//简单测试
		System.out.println(MD5Util.validatePassword("454E908651395FB737E9B8048993C95D","zhangdanfeng" ));
	}
}
