package com.cn.hnust.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hnust.pojo.Mtype;
import com.cn.hnust.service.MtypeService;
/**
 * @ClassName: MtypeController
 * @title: MtypeController.class
 * @author: liulangzhizi 
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Controller
@RequestMapping("/mtype")
public class MtypeController{
    
	@Autowired
	private MtypeService mtypeService;
	

	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", mtypeService.findPage( currentPage , pageSize ));
		return "mtypeList";
	}
	

	@RequestMapping("/mtypeList")
	public String findList( Model model,@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "5") int pageSize) {
		List<Mtype> list=mtypeService.findList();
		System.out.println("list.size()="+list.size());
		model.addAttribute("pageBean", mtypeService.findPage(currentPage, pageSize));
		return "mtypeList";
	}
	
	//   idType
	@RequestMapping("/findById")
	public String findById(int id , Model model) {
		model.addAttribute("mtype", mtypeService.findById(id));
		return "mtypeEdit";
	}
	

	@RequestMapping("/edit")
	public String edit(Mtype mtype , Model model) {
		mtypeService.updateMtype(mtype);
		return "redirect:/mtype/mtypeList";
	}
	

	@RequestMapping("/showEdit")
	public String showEdit(int id , Model model) {
		model.addAttribute("mtype", mtypeService.findById(id));
		return "mtypeEdit";
	}
	

	@RequestMapping("/showAdd")
	public String showAdd() {
		return "/mtypeAdd";
	}
	

	@RequestMapping("/save")
	public String insert(Mtype mtype , Model model) {
		System.out.println("save:");
		mtypeService.insertMtype(mtype);
		return "redirect:/mtype/mtypeList";
	}
	

	@RequestMapping("/delete")
	public String deleteById(int id , Model model) {
		mtypeService.deleteById(id);
		return "redirect:/mtype/mtypeList";
	}
	

	@RequestMapping("/deletes")
	public String deletes(String ids , Model model) {
		mtypeService.deletes(ids);
		return "redirect:/mtype/mtypeList";
	}

}
