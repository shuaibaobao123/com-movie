package com.cn.hnust.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hnust.pojo.Hoby;
import com.cn.hnust.service.HobyService;
/**
 * @ClassName: HobyController
 * @title: HobyController.class
 * @author: liulangzhizi 
 * @Data: 2016-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Controller
@RequestMapping("/hoby")
public class HobyController{

	@Autowired
	private HobyService hobyService;
	

	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", hobyService.findPage( currentPage , pageSize ));
		return "hobyList";
	}
	

	@RequestMapping("/list")
	public String findList( Model model) {
//		model.addAttribute("list", hobyService.findList());
		return "hobyList";
	}
	
	//   idType
	@RequestMapping("/findById")
	public String findById(int id , Model model) {
		model.addAttribute("hoby", hobyService.findById(id));
		return "hoby";
	}
	

	@RequestMapping("/edit")
	public String edit(Hoby hoby , Model model) {
		hobyService.updateHoby(hoby);
		return "redirect:/hoby/hobyList";
	}
	

	@RequestMapping("/showEdit")
	public String showEdit(int id , Model model) {
		model.addAttribute("hoby", hobyService.findById(id));
		return "redirect:/hoby/hobyEdit";
	}
	

	@RequestMapping("/showAdd")
	public String showAdd() {
		return "hoby/hobyAdd";
	}
	

	@RequestMapping("/save")
	public String insert(Hoby hoby , Model model) {
		hobyService.insertHoby(hoby);
		return "redirect:/hoby/hobyList";
	}
	

	@RequestMapping("/delete")
	public String deleteById(int id , Model model) {
		hobyService.deleteById(id);
		return "redirect:/hoby/hobyList";
	}
	

	@RequestMapping("/deletes")
	public String deletes(String ids , Model model) {
		hobyService.deletes(ids);
		return "redirect:/hoby/hobyList";
	}

}
