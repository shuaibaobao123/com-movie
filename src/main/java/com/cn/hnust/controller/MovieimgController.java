package com.cn.hnust.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hnust.pojo.Movieimg;
import com.cn.hnust.service.MovieimgService;
/**
 * @ClassName: MovieimgController
 * @title: MovieimgController.class
 * @author: liulangzhizi 
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Controller
@RequestMapping("/movieimg")
public class MovieimgController{

	@Autowired
	private MovieimgService movieimgService;
	

	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", movieimgService.findPage( currentPage , pageSize ));
		return "movieimgList";
	}
	

	@RequestMapping("/list")
	public String findList( Model model) {
		model.addAttribute("list", movieimgService.findList());
		return "movieimgList";
	}
	
	//   idType
	@RequestMapping("/findById")
	public String findById(int id , Model model) {
		model.addAttribute("movieimg", movieimgService.findById(id));
		return "movieimg";
	}
	

	@RequestMapping("/edit")
	public String edit(Movieimg movieimg , Model model) {
		movieimgService.updateMovieimg(movieimg);
		return "redirect:/movieimg/movieimgList";
	}

	@RequestMapping("/showEdit")
	public String showEdit(int id , Model model) {
		model.addAttribute("movieimg", movieimgService.findById(id));
		return "redirect:/movieimg/movieimgEdit";
	}
	

	@RequestMapping("/showAdd")
	public String showAdd() {
		return "movieimg/movieimgAdd";
	}
	

	@RequestMapping("/save")
	public String insert(Movieimg movieimg , Model model) {
		movieimgService.insertMovieimg(movieimg);
		return "redirect:/movieimg/movieimgList";
	}
	

	@RequestMapping("/delete")
	public String deleteById(int id , Model model) {
		movieimgService.deleteById(id);
		return "redirect:/movieimg/movieimgList";
	}
	

	@RequestMapping("/deletes")
	public String deletes(String ids , Model model) {
		movieimgService.deletes(ids);
		return "redirect:/movieimg/movieimgList";
	}

}
