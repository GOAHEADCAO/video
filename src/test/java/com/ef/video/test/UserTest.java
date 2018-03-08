package com.ef.video.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import com.ef.video.service.UserService;

@RunWith(JUnit4.class)
public class UserTest {
	static UserService userService;
	@Before
	public void before(){
		userService=new UserService();
		System.out.println("userTest  before");
	}
	@After
	public void after(){
		System.out.println("userTest  after");
	}
	@Test
	public void testupdate(){
		
	}
	  public static void  downLoadFromUrl(String urlStr,String fileName,String savePath) throws IOException{  
	        URL url = new URL(urlStr);    
	        HttpURLConnection conn = (HttpURLConnection)url.openConnection();    
	                //设置超时间为3秒  
	        System.out.println("=========1");

	        conn.setConnectTimeout(3*1000);  
	        //防止屏蔽程序抓取而返回403错误  
	        System.out.println("=========2");

	        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");  
	        System.out.println("=========3");

	        //得到输入流  
	        InputStream inputStream = conn.getInputStream();    
	        //获取自己数组  
	        System.out.println("=========4");

	        byte[] getData = readInputStream(inputStream);      
	        System.out.println("=========5");

	        //文件保存位置  
	        File saveDir = new File(savePath);  
	        if(!saveDir.exists()){  
	            saveDir.mkdir();  
		        System.out.println("=========");

	        }  
	        System.out.println("=========");

	        File file = new File(saveDir+File.separator+fileName);      
	        FileOutputStream fos = new FileOutputStream(file);       
	        fos.write(getData);   
	        if(fos!=null){  
	            fos.close();    
	        }  
	        if(inputStream!=null){  
	            inputStream.close();  
	        }  
	        System.out.println("info:"+url+" download success");   
	  
	    }  
	  
	  
	  
	    /** 
	     * 从输入流中获取字节数组 
	     * @param inputStream 
	     * @return 
	     * @throws IOException 
	     */  
	    public static  byte[] readInputStream(InputStream inputStream) throws IOException {    
	        byte[] buffer = new byte[1024];    
	        int len = 0;    
	        System.out.println("=========");
	        ByteArrayOutputStream bos = new ByteArrayOutputStream();    
	        while((len = inputStream.read(buffer)) != -1) {    
	            bos.write(buffer, 0, len);    
	        }    
	        bos.close();    
	        return bos.toByteArray();    
	    }    
	  
	    public static void main(String[] args) {  
	        try{  
		        System.out.println("=========");
	            downLoadFromUrl("http://www.dowei.com/d/file/tuku/mingxing/20170911/a15c29c1e1db39b9de9771859173be82.jpg",  
	                    "百度.jpg","d://");  
	        }catch (Exception e) {  
	          e.printStackTrace();  
	        }  
	    } 
}
