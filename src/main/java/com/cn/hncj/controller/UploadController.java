package com.cn.hncj.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

@Controller  
@RequestMapping(value="/upload")  
public class UploadController {
	private final String JSON_JSP = "/jsondata";
	private String responseJson;
	public String getResponseJson() {
		return responseJson;
	}
	public void setResponseJson(String responseJson) {
		this.responseJson = responseJson;
	}
	 @RequestMapping(value="/uploadImg" ,method = RequestMethod.POST)  
	    public String upload(@RequestParam(value = "mainimgFile", required = false) MultipartFile file,@RequestParam(value = "img1File", required = false) MultipartFile file1,@RequestParam(value = "img2File", required = false) MultipartFile file2,@RequestParam(value = "readFree", required = false) MultipartFile file3, HttpServletRequest request, ModelMap model) {  
		System.out.println("&&&&&&&&&&&&&&&&&&&&�ϴ�&&&&&&&&&&&&&&&&&&&&&&&&7");
		 JSONObject jsonResult = new JSONObject(); 
		 String path = request.getSession().getServletContext().getRealPath("/upload/img");  
		 String fileName="";
		 MultipartFile fileXX=null;
		 if(file!= null&&StringUtils.hasText(file.getOriginalFilename())){
			  fileName = file.getOriginalFilename(); 
			  fileXX=file;
		 } 
		 if(file1 != null){
			 fileName = file1.getOriginalFilename(); 
			 fileXX=file1;
		 } 
		 if(file2 != null){
			  fileName = file2.getOriginalFilename(); 
			  fileXX=file2;
		 }
		 if(file3 != null){
			  fileName = file3.getOriginalFilename();   
			  fileXX=file3;
		 }
	        System.out.println(path); 
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  

	        try {  
	        	jsonResult.put("status", "success");
	        	jsonResult.put("message", "上次成功");
	        	fileXX.transferTo(targetFile);
	        } catch (Exception e) { 
	        	jsonResult.put("message", "上传失败，请重试");
	            e.printStackTrace();  
	        }  
	       // model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
	       responseJson = jsonResult.toString();
	       model.addAttribute("responseJson", responseJson);
	        return JSON_JSP; 
	    }  
	 
	 //上传电影模块
	 @RequestMapping(value="/uploadMovie" ,method = RequestMethod.POST)  
	    public String uploadMovie(@RequestParam(value = "moviesrcFile", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {  
		System.out.println("&&&&&&&&&&&&&&&&&&&&�ϴ�&&&&&&&&&&&&&&&&&&&&&&&&");
		 JSONObject jsonResult = new JSONObject(); 
		 String path = request.getSession().getServletContext().getRealPath("/upload/movie");  
		 String fileName="";
		 MultipartFile fileXX=null;
		 if(file!= null&&StringUtils.hasText(file.getOriginalFilename())){
			  fileName = file.getOriginalFilename(); 
			  fileXX=file;
		 } 
	        System.out.println(path); 
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  

	        try {  
	        	jsonResult.put("status", "success");
	        	jsonResult.put("message", "上传成功");
	        	fileXX.transferTo(targetFile);
	        } catch (Exception e) { 
	        	jsonResult.put("message", "上传失败请重新上传");
	            e.printStackTrace();  
	        }  
	       // model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
	       responseJson = jsonResult.toString();
	       model.addAttribute("responseJson", responseJson);
	        return JSON_JSP; 
	    }  
	 
	 
}
