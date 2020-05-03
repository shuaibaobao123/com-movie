package com.cn.hnust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.hnust.pojo.Manager;
import com.cn.hnust.pojo.Movie;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.ManagerService;
import com.cn.hnust.service.MovieService;
import com.cn.hnust.service.UserService;
import com.cn.hnust.utils.MD5Utils;

/**
 * @ClassName: ManagerController
 * @title: ManagerController.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private UserService userService;
	@Autowired
	private MovieService movieService;


	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page",
				managerService.findPage(currentPage, pageSize));
		return "managerList";
	}


	@RequestMapping("/list")
	public String findList(Model model) {
		model.addAttribute("list", managerService.findList());
		return "managerList";
	}


	@RequestMapping("/findById")
	public String findById(int id, Model model) {
		model.addAttribute("manager", managerService.findById(id));
		return "manager";
	}


	@RequestMapping("/edit")
	public String edit(Manager manager, Model model) {
		String password = MD5Utils.md5(manager.getPassword());
		manager.setPassword(password);
		managerService.updateManager(manager);
		return "redirect:/manager/toedit";
	}

	@RequestMapping("/toedit")
	public String toedit(Manager manager, Model model) {

		return "passwordEdit";
	}


	@RequestMapping("/showEdit")
	public String showEdit(int id, Model model) {
		model.addAttribute("manager", managerService.findById(id));
		return "redirect:/manager/managerEdit";
	}


	@RequestMapping("/showAdd")
	public String showAdd() {
		return "manager/managerAdd";
	}


	@RequestMapping("/save")
	public String insert(Manager manager, Model model) {
		managerService.insertManager(manager);
		return "redirect:/manager/managerList";
	}


	@RequestMapping("/delete")
	public String deleteById(int id, Model model) {
		managerService.deleteById(id);
		return "redirect:/manager/managerList";
	}


	@RequestMapping("/deletes")
	public String deletes(String ids, Model model) {
		managerService.deletes(ids);
		return "redirect:/manager/managerList";
	}

	// 跳转到登录
	@RequestMapping("/toLogin")
	public String goLogin() {
		return "login";
	}

	// 跳转到登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String password, String name,
			HttpServletRequest request, HttpSession session, Model model) {
		String oriPassword = password;
		password = MD5Utils.md5(password);
		System.out.println(name + password);
		Manager manager = this.managerService.checkLogin(name, password);
		if (null == manager) {
			System.out.println("查询结果为空");
			model.addAttribute("error", "1");
			return "/login";
		}
		manager.setPassword(oriPassword);
		session.setAttribute("manager", manager);
		return "redirect:/manager/toIndex";
	}

	// 登出
	@RequestMapping("/logout")
	public String loginOut(HttpServletRequest request, HttpSession session) {
		session.setAttribute("manager", null);
		return "redirect:/manager/toLogin";
	}

	// 登出
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request, Model model,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "20") int pageSize) {
		// 查询本月开通会员和所有会员数量
		int monthNum = 0;
		int allNum = 0;
		updateIsMember();
		List<User> alllist = userService.findList(true, "isPay", "");
		for (User user : alllist) {
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM");
			String thisMOnth = dateFormat.format(date);
			int month = user.getEndtime().getMonth() + 1;
			System.out.println("thisMOnth=" + thisMOnth + "|month=" + month);
			if (month == Integer.parseInt(thisMOnth)) {
				monthNum = monthNum + 1;
			}
		}
		allNum = alllist.size();
		double monthMoney = monthNum * 30;
		double allMoney = allNum * 30;
		model.addAttribute("monthNum", monthNum);
		model.addAttribute("allNum", allNum);
		model.addAttribute("monthMoney", monthMoney);
		model.addAttribute("allMoney", allMoney);

		// 查询热播排行
		List<Movie> countList = movieService.findListByCounts();
		System.out.println("countList.size()=" + countList.size());
		for (Movie movie : countList) {
			System.out.println("counts:" + movie.getCount());
		}
		model.addAttribute("countList", countList);
		// 查询好评排行
		List<Movie> rankList = movieService.findListByrank();
		System.out.println("rankList.size()=" + rankList.size());
		for (Movie movie : rankList) {
			System.out.println("rank:" + movie.getRank());
		}
		model.addAttribute("rankList", rankList);

		model.addAttribute("pageBean",
				userService.findPage(currentPage, pageSize));

		return "/count";
	}

	// 跳转到登录
	@RequestMapping(value = "/toLogin", method = RequestMethod.POST)
	public String toLogin(String password, String name,
			HttpServletRequest request) {
		return "/pages/login";
	}

	@RequestMapping("/passwordSave")
	public String passwordSave(HttpServletRequest request, Model model,
			Manager manager, HttpSession session) throws ParseException {
		// 删除登录者session信息
		System.out.println("保存密码=" + manager.getPassword() + "id="
				+ manager.getId());
		String password = MD5Utils.md5(manager.getPassword());
		manager.setPassword(password);
		int status = managerService.updateManager(manager);
		if (status == 1) {
			model.addAttribute("passwordEditInfo", "修改成功，下次请通过新密码登录！");
			model.addAttribute("color", "green");
		} else {
			model.addAttribute("passwordEditInfo", "修改失败,请重试！");
			model.addAttribute("color", "red");
		}
		return "passwordEdit";
	}

	public void updateIsMember() {
		List<User> alllist = userService.findList(true, "isPay", "");
		for (User user : alllist) {
			Date date = new Date();
			long dataMs = date.getTime();
			long memberDateMs = user.getEndtime().getTime();
			long intervalMs = dataMs - memberDateMs;
			// 计算两个日期之间的差值大于30天则修改数据库是否为会员
			int days = (int) (intervalMs / (1000 * 86400));
			if (days > 30) {
				user.setIsmember("0");
				user.setEndtime(null);
				userService.updateUser(user);
			}
		}
	}

}
