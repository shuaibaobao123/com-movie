package com.cn.hncj.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hncj.pojo.Pingjia;
import com.cn.hncj.service.PingjiaService;
/**
 * @ClassName: PingjiaController
 * @title: PingjiaController.class
 * @author: liulangzhizi 
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Controller
@RequestMapping("/pingjia")
public class PingjiaController{

	@Autowired
	private PingjiaService pingjiaService;

	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", pingjiaService.findPage( currentPage , pageSize ));
		return "pingjiaList";
	}
	

	@RequestMapping("/list")
	public String findList( Model model) {
		model.addAttribute("list", pingjiaService.findList());
		return "pingjiaList";
	}
	
	//   idType
	@RequestMapping("/findById")
	public String findById(int id , Model model) {
		model.addAttribute("pingjia", pingjiaService.findById(id));
		return "pingjia";
	}
	

	@RequestMapping("/edit")
	public String edit(Pingjia pingjia , Model model) {
		pingjiaService.updatePingjia(pingjia);
		return "redirect:/pingjia/pingjiaList";
	}
	

	@RequestMapping("/showEdit")
	public String showEdit(int id , Model model) {
		model.addAttribute("pingjia", pingjiaService.findById(id));
		return "redirect:/pingjia/pingjiaEdit";
	}
	

	@RequestMapping("/showAdd")
	public String showAdd() {
		return "pingjia/pingjiaAdd";
	}
	

	@RequestMapping("/save")
	public String insert(Pingjia pingjia , Model model) {
		pingjiaService.insertPingjia(pingjia);
		return "redirect:/pingjia/pingjiaList";
	}
	

	@RequestMapping("/delete")
	public String deleteById(int id , Model model) {
		pingjiaService.deleteById(id);
		return "redirect:/pingjia/pingjiaList";
	}
	

	@RequestMapping("/deletes")
	public String deletes(String ids , Model model) {
		pingjiaService.deletes(ids);
		return "redirect:/pingjia/pingjiaList";
	}

}
