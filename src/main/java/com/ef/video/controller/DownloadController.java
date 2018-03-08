package com.ef.video.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ef.video.dto.AjaxResult;
import com.ef.video.entity.Document;
import com.ef.video.service.DocumentService;
@RequiresPermissions("*:download")
@Controller
@RequestMapping("/download")
public class DownloadController {
	@Autowired
	private DocumentService documentService;
	
     public List<Document> findAllDocuments(){
    	 return documentService.findAllDocumentByPage();
    	
     }
     @RequestMapping("/showfile")
	public ModelAndView showFile(){
		List<Document> docs=findAllDocuments();
		ModelAndView mav=new ModelAndView();
	    mav.addObject("docs", docs);
	    mav.setViewName("web/admin/downloads/documentList");
		return  mav;
				}
     @RequestMapping("/deleteDocument")
 	public  AjaxResult deleteDocument(HttpServletRequest request,HttpServletResponse response ) throws IOException {
	   AjaxResult ajaxResult=new AjaxResult();
	   ajaxResult.setSuccess(false);
	   
	   return ajaxResult;
		 }
     public static void  downLoadFromUrl(String urlStr,String fileName,String savePath) throws IOException{  
	        URL url = new URL(urlStr);    
	        HttpURLConnection conn = (HttpURLConnection)url.openConnection();    
	                //设置超时间为3秒  
	        conn.setConnectTimeout(3*1000);  
	        //防止屏蔽程序抓取而返回403错误  
	        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");  

	        //得到输入流  
	        InputStream inputStream = conn.getInputStream();    
	        //获取自己数组  

	        byte[] getData = readInputStream(inputStream);

	        //文件保存位置  
	        File saveDir = new File(savePath);  
	        if(!saveDir.exists()){  
	            saveDir.mkdir();  
	        }  
	        if(!saveDir.exists()){  
	            saveDir.mkdir();  
	        } 
	        File file = new File(saveDir+fileName);  

            try{
	        if(!file.exists()){  
	            file.createNewFile();  
	        } 
	         
            }catch(Exception e){
            	e.printStackTrace();
            }
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
	        System.out.println("=========readInputStream");
	        ByteArrayOutputStream bos = new ByteArrayOutputStream();    
	        while((len = inputStream.read(buffer)) != -1) {    
	            bos.write(buffer, 0, len);    
	        }    
	        bos.close();    
	        return bos.toByteArray();    
	    }    
@RequestMapping("/downfile")
@ResponseBody
public AjaxResult downFile(HttpServletRequest request,HttpServletResponse response ) throws IOException {
   String url=request.getParameter("path");
   String name=url.substring(url.lastIndexOf("."));
   response.setHeader("Content-disposition","attachment;filename="+name);
	AjaxResult ajaxResult=new AjaxResult();
	ajaxResult.setSuccess(false);
    System.out.println("name:"+name);
    name=UUID.randomUUID().toString()+name;
    String path="C:\\download\\";
    downLoadFromUrl(url,"a15c29c1e1db39b9de9771859173be82.jpg",path);
/*	if(download(url,path)){
		ajaxResult.setMsg("ok");
	ajaxResult.setSuccess(true);
	System.out.println("ok   下载成功");
	}
	else {
		System.out.println("下载失败");
		ajaxResult.setMsg("下载失败");
	ajaxResult.setSuccess(false);
		
	}*/
    ajaxResult.setSuccess(true);
    return  ajaxResult;
			
}
 	 public  boolean download(String url, String path)   throws IOException {  
         System.out.println("下载中...");  
         InputStream inputStream = null;  
         RandomAccessFile randomAccessFile = null; 
         try {  
             HttpURLConnection urlConnection = (HttpURLConnection) new URL(url).openConnection();  
  	       System.out.println("path 1"+path);

             urlConnection.setRequestMethod("GET");
  	       System.out.println("path 2"+path);

             urlConnection.setConnectTimeout(10 * 1000); 
  	       System.out.println("path 3"+path);

             File file = new File(path);  
             //文件夹是否存在  
  	      System.out.println("path 4"+path);

           /*   if (!file.getParentFile().exists())  {
            	file.getParentFile().mkdir();  
           System.out.println("!file.getParentFile().exists()"+file.getParentFile().getName());

             }*/
         /*    if (file.exists()) {
            	 System.out.println("file.exists() :"+file.getName());
                 file.delete();  
             }
             file.createNewFile(); 
             System.out.println("file crearte:"+file.getName());
  	       System.out.println("path 5"+path);
*/
             int responseCode = urlConnection.getResponseCode();  
             if (responseCode >= 200 && responseCode < 300) {  
      	       System.out.println("path 6"+path);

                 inputStream = urlConnection.getInputStream();  
                 System.out.println("inputStream:"+inputStream);
                 int len = 0;  
                 byte[] data = new byte[4096];  
                 //用于保存当前进度（具体进度）  
                 int progres = 0;  
                 //获取文件长度  
                 int maxProgres = urlConnection.getContentLength();  
                 System.out.println("p=========maxProgres:"+maxProgres);

                 randomAccessFile = new RandomAccessFile(file, "rwd");  
                 System.out.println("p=========randomAccessFile:"+randomAccessFile.toString());

                 //设置文件大小  
                 randomAccessFile.setLength(maxProgres);  
                 //将文件大小分成100分，每一分的大小为unit  
                 int unit = maxProgres / 100;  
                 //用于保存当前进度(1~100%)  
                 int unitProgress = 0; 
                 System.out.println("p=========maxProgres:"+maxProgres);
        	       System.out.println("path 7:"+(len = inputStream.read(data)));
                 while (-1 != (len = inputStream.read(data))) {  
                     randomAccessFile.write(data, 0, len);  
                     progres += len;//保存当前具体进度  
                     int temp = progres / unit; //计算当前百分比进度  
                     if (temp >= 1 && temp > unitProgress) {//如果下载过程出现百分比变化  
                         unitProgress = temp;//保存当前百分比  
                         System.out.println("正在下载中..." + unitProgress + "%");  
                     }
                 System.out.println("path 8:");
                 }  
                 inputStream.close();  
                 System.out.println("下载完成...");  
                 return true;
             } else {  
                 System.out.println("服务器异常...");
                 return false;
             }  
         } finally {  
             if (null != inputStream) {  
                 inputStream.close();  
             }  
             if (null != randomAccessFile) {  
                 randomAccessFile.close();  
             }  
         }  
     }  
 	public static boolean createDir(String destDirName) {  
        File dir = new File(destDirName);  
        if (dir.exists()) {  
            System.out.println("创建目录" + destDirName + "失败，目标目录已经存在");  
            return false;  
        } /* 
        if (!destDirName.endsWith(File.separator)) {  
            destDirName = destDirName + File.separator;  
        }  */
        //创建目录  
        if (dir.mkdirs()) {  
            System.out.println("创建目录" + destDirName + "成功！");  
            return true;  
        } else {  
            System.out.println("创建目录" + destDirName + "失败！");  
            return false;  
        }  
    }  
}
