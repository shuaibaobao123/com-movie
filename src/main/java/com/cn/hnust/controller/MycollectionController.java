package com.cn.hnust.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hnust.pojo.Mycollection;
import com.cn.hnust.service.MycollectionService;
/**
 * @ClassName: MycollectionController
 * @title: MycollectionController.class
 * @author: liulangzhizi 
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Controller
@RequestMapping("/mycollection")
public class MycollectionController{

	@Autowired
	private MycollectionService mycollectionService;

	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", mycollectionService.findPage( currentPage , pageSize ));
		return "mycollectionList";
	}
	

	@RequestMapping("/list")
	public String findList( Model model) {
		model.addAttribute("list", mycollectionService.findList());
		return "mycollectionList";
	}
	
	//    idType
	@RequestMapping("/findById")
	public String findById(int id , Model model) {
		model.addAttribute("mycollection", mycollectionService.findById(id));
		return "mycollection";
	}
	

	@RequestMapping("/edit")
	public String edit(Mycollection mycollection , Model model) {
		mycollectionService.updateMycollection(mycollection);
		return "redirect:/mycollection/mycollectionList";
	}
	

	@RequestMapping("/showEdit")
	public String showEdit(int id , Model model) {
		model.addAttribute("mycollection", mycollectionService.findById(id));
		return "redirect:/mycollection/mycollectionEdit";
	}
	

	@RequestMapping("/showAdd")
	public String showAdd() {
		return "mycollection/mycollectionAdd";
	}
	

	@RequestMapping("/save")
	public String insert(Mycollection mycollection , Model model) {
		mycollectionService.insertMycollection(mycollection);
		return "redirect:/mycollection/mycollectionList";
	}
	

	@RequestMapping("/delete")
	public String deleteById(int id , Model model) {
		mycollectionService.deleteById(id);
		return "redirect:/mycollection/mycollectionList";
	}
	

	@RequestMapping("/deletes")
	public String deletes(String ids , Model model) {
		mycollectionService.deletes(ids);
		return "redirect:/mycollection/mycollectionList";
	}

}
