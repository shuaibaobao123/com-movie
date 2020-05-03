package com.cn.hncj.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PictureFileController {

	@RequestMapping(value = "/upFile")
	@ResponseBody
	public String editItemsSubmit(MultipartFile pictureFile) {
		try {
			if (pictureFile != null) {
				System.out.println(pictureFile.getOriginalFilename());
				// 原始图片名称
				String originalFilename = pictureFile.getOriginalFilename();
				// 如果没有图片名称，则上传不成功
				if (originalFilename != null && originalFilename.length() > 0) {
					// 存放图片的物理路径
					String picPath = "E:\\";
					// 新文件的名称
					String newFileName = UUID.randomUUID()
							+ originalFilename.substring(originalFilename.lastIndexOf("."));
					// 新的文件
					File newFile = new File(picPath + newFileName);
					// 把上传的文件保存成一个新的文件
					pictureFile.transferTo(newFile);
					return newFileName;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

}
