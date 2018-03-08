package com.ef.video.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ef.video.dto.AjaxResult;
import com.ef.video.entity.Document;
import com.ef.video.entity.User;
import com.ef.video.service.DocumentService;
@Controller
@RequestMapping("upload")
public class UploadController {
	
	public final static String ATTACH_SAVE_PATH = "attach";
	@Autowired
    private DocumentService documentService;
	@RequestMapping("/ajax/upload_file")
	@ResponseBody
	public AjaxResult ajaxUploadFile(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		AjaxResult ajaxResult = new AjaxResult();
		ajaxResult.setSuccess(false);
		try {
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			MultipartFile multipartFile = null;
			String fileName = null;
			for (Map.Entry<String, MultipartFile> set : fileMap.entrySet()) {
				multipartFile = set.getValue();// 文件名
			}
			fileName = this.storeIOc(multipartRequest, multipartFile);
			System.out.println("ajaxUploadFile"+fileName);
			ajaxResult.setData(fileName);
			ajaxResult.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ajaxResult;
	}
	
	// 接受图片，返回文件地址
	private String storeIOc(HttpServletRequest request, MultipartFile file) {
		String result = "";
		String realPath = request.getSession().getServletContext().getRealPath("uploads");
		if (file == null) {
			return null;
		}
		String fileName = "";
		String logImageName = "";
		if (file.isEmpty()) {
			result = "文件未上传";
		} else {
			String _fileName = file.getOriginalFilename();
			String suffix = _fileName.substring(_fileName.lastIndexOf("."));
			if(StringUtils.isNotBlank(suffix)){
				if(suffix.equalsIgnoreCase(".txt") || suffix.equalsIgnoreCase(".xls") || suffix.equalsIgnoreCase(".xlsx") || suffix.equalsIgnoreCase(".txt")|| suffix.equalsIgnoreCase(".png")
						  || suffix.equalsIgnoreCase(".doc") || suffix.equalsIgnoreCase(".docx") || suffix.equalsIgnoreCase(".pdf") 
						  || suffix.equalsIgnoreCase(".ppt") || suffix.equalsIgnoreCase(".pptx")|| suffix.equalsIgnoreCase(".gif")
						  || suffix.equalsIgnoreCase(".jpg")|| suffix.equalsIgnoreCase(".jpeg")|| suffix.equalsIgnoreCase(".bmp")){
					// /**使用UUID生成文件名称**/
					
                    if(logImageName.equals(documentService.findDocumentByName(logImageName))){
                    	logImageName=logImageName+UUID.randomUUID()+suffix;
                    }else
                    	logImageName = _fileName;
					fileName = realPath + File.separator + ATTACH_SAVE_PATH + File.separator + logImageName;
					File restore = new File(fileName);//创建一个不存在内容的文件
					System.out.println(restore.exists()+"   "+restore.mkdirs()+" 真实的上传地址： "+restore.getPath());
					try {
						file.transferTo(restore);
						Document doc=new Document();
						doc.setCreateDate(new Date());
						doc.setUploadName(request.getParameter("user"));
						System.out.println(request.getSession().getAttribute("user"));
						doc.setName(logImageName);
						doc.setPath(restore.getPath());
						if(documentService.saveDocument(doc)){
							result="保存成功 ";
						}
						
						result = "/uploads/attach/" + logImageName;
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
				}else{
					result = "文件格式不对，只能上传txt、ppt、ptx、doc、docx、xls、xlsx、pdf、png、jpg、jpeg、gif、bmp格式";
				}
			}
		}
		return result;
	}

}
