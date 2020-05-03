package com.cn.hnust.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.cn.hnust.pojo.Country;
import com.cn.hnust.pojo.Hoby;
import com.cn.hnust.pojo.Movie;
import com.cn.hnust.pojo.Mtype;
import com.cn.hnust.pojo.Mycollection;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.CountryService;
import com.cn.hnust.service.HobyService;
import com.cn.hnust.service.MovieService;
import com.cn.hnust.service.MtypeService;
import com.cn.hnust.service.MycollectionService;
import com.cn.hnust.service.UserService;
import com.mysql.jdbc.StringUtils;

/**
 * @ClassName: UserController
 * @title: UserController.class
 * @author: liulangzhizi
 * @Data: 2020年-03月-04日 23:57:01
 * @Version: V1.0.0
 * @description:
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MycollectionService mycollectionService;
	
	@Autowired
	private HobyService hobyService;
	
	@Autowired
	private MtypeService mtypeService;
	
	@Autowired
	private CountryService countryService;
	
	private static final String JSON_JSP = "user/jsondata";
	

	/**
	 * 查找用户首页显示信息
	 * 1.查找类型
	 * 1.最新上映 
	 * 2.热播排行
	 * 3.智能推荐
	 * @param currentPage
	 * @param pageSize
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model,
			HttpSession session) {
		// 先判断用户是否登录 然后进行推荐
		User user = null;
		user = (User) session.getAttribute("userNow");
		List<Movie> suggestList=null;
		if (user == null) {
			// 此条件为用户未登录 此时根据 评分+播放量（热播）
		    suggestList=getSuggestNoLogin();
			model.addAttribute("suggestList", suggestList);
			
		} else {
			// 此条件为用户已登录
			/**
			 * 然后判断是否有收藏
			 * if 没有收藏  根据注册时候填填写的喜欢的组合+好评+播放量推荐
			 * if 有收藏  根据注册时候填写的喜欢的组合+收藏(导演+明星)推荐
			 */
			int userId=user.getId();
			List<Mycollection> collectionList=new  ArrayList<Mycollection>();
			collectionList=mycollectionService.findByUserId(userId);
			if(collectionList.size()>0){
			//此条件为用户已经有收藏电影
				List<Movie> allSuggestList=new ArrayList<Movie>();
				List<Movie> regeistGroutList=getRegeistGroupMovieList(userId);
				List<Movie> collectionSuggestList=getCollectionSuggestList(userId);
				allSuggestList.addAll(regeistGroutList);
				allSuggestList.addAll(collectionSuggestList);
				suggestList=getRandomMovieList(allSuggestList, 6);
				System.out.println("【登录+收藏】即将返回的记录条数="+suggestList.size());
			}else{
			//此条件为用户没有收藏电影
				List<Movie> allSuggestList=new ArrayList<Movie>();
				allSuggestList=getSuggestNoLogin();
				 List<Movie> regeistGroutList=getRegeistGroupMovieList(userId);
				 allSuggestList.addAll(regeistGroutList);
				 suggestList=getRandomMovieList(allSuggestList, 6);
				 System.out.println("【登录+未收藏】即将返回的记录条数="+suggestList.size());
			}
		}
		for (Movie movie : suggestList) {
			System.out.println("for循环输出的到的推荐电影名字"+movie.getName());
		}
        
		//查找类型
		List<Mtype> typeList=mtypeService.findList();
		System.out.println("首页获取typeList.size()="+typeList.size());
		model.addAttribute("typeList",typeList);
		
		//查找类型
		List<Country> countryList=countryService.findList();
		System.out.println("首页获取countryList.size()="+countryList.size());
		session.setAttribute("countryList", countryList);
		
		//查找最新
		List<Movie> newMovieList=movieService.findListNewMovie();
		System.out.println("首页获取newMovieList.size()="+newMovieList.size());
		model.addAttribute("newMovieList",newMovieList);
		
		//查找最热
		List<Movie> hotMovieList=movieService.findListByCounts();
		System.out.println("首页获取hotMovieList.size()="+hotMovieList.size());
		model.addAttribute("hotMovieList",hotMovieList);
		model.addAttribute("suggestList", suggestList);
		return "user/index";
	}

	/**
	 * 根据评分和热播各查找前15条记录，然后从总体30条记录（若不足30条记录就从当前记录中随机取出）6条返回 若查询到的记录小于6条直接返回
	 * 
	 * * @return suggestList
	 */
	public List<Movie> getSuggestNoLogin() {
		List<Movie> suggestList = new ArrayList<Movie>();
		List<Movie> topRankList = movieService.findListByrank();
		List<Movie> topCountList = movieService.findListByCounts();
		List<Movie> allCountRankList = new ArrayList<Movie>();
		allCountRankList.addAll(topRankList);
		allCountRankList.addAll(topCountList);
		System.out.println("未登录用户根据rank+count查询到所有记录="+ allCountRankList.size());
		suggestList=getRandomMovieList(allCountRankList, 6);
		System.out.println("根据好评率和播放量筛选的结果如下："+suggestList.size());
		return suggestList;
	}
	/**
	 * 从候选list 中获取6条记录返回
	 * @return
	 */
	public List<Movie> getRandomMovieList(List<Movie> allCountsList,int counts) {
		List<Movie> suggestList = new ArrayList<Movie>();
		//判断如果小于6条记录，直接返回list
				if(allCountsList.size()<=counts){
					suggestList=allCountsList;
					return suggestList;
				}
				int[] number=getRandom(counts, allCountsList.size());
				for (int i = 0; i < number.length; i++) {
					for (int j=0;j<allCountsList.size();j++) {
						if(number[i]==j){
							suggestList.add(allCountsList.get(j));
							break;
						}
					}
				}
				return suggestList;
	}
	/**
	 * 有收藏  根据注册时候填写的喜欢的组合+收藏(导演+明星)推荐
	 * @return
	 */
	public List<Movie> getSuggestLoginAndCollection() {
		List<Movie> suggestList = new ArrayList<Movie>();
		List<Movie> topRankList = movieService.findListByrank();
		List<Movie> topCountList = movieService.findListByCounts();
		List<Movie> allCountRankList = new ArrayList<Movie>();
		allCountRankList.addAll(topRankList);
		allCountRankList.addAll(topCountList);
		System.out.println("登录用户根据rank+count查询到所有记录="+ allCountRankList.size());
		//判断如果小于6条记录，直接返回list
		if(allCountRankList.size()<=6){
			suggestList=allCountRankList;
			return suggestList;
		}
		int[] number=getRandom(6, allCountRankList.size());
		for (int i = 0; i < number.length; i++) {
			for (int j=0;j<allCountRankList.size();j++) {
				if(number[i]==j){
					suggestList.add(allCountRankList.get(j));
					System.out.println("登录用户筛选的电影名称="+allCountRankList.get(j).getName());
					break;
				}
			}
		}
		System.out.println("根据好评率和播放量筛选的结果如下："+suggestList.size());
		return suggestList;
	}
	/**
	 * 没有收藏  根据注册时候填填写的喜欢的组合+好评+播放量推荐
	 * @return
	 */
	public List<Movie> getSuggestLoginAndNoCollection() {
		List<Movie> suggestList = new ArrayList<Movie>();
		List<Movie> topRankList = movieService.findListByrank();
		List<Movie> topCountList = movieService.findListByCounts();
		List<Movie> allCountRankList = new ArrayList<Movie>();
		allCountRankList.addAll(topRankList);
		allCountRankList.addAll(topCountList);
		System.out.println("未登录用户根据rank+count查询到所有记录="+ allCountRankList.size());
		//判断如果小于6条记录，直接返回list
		if(allCountRankList.size()<=6){
			suggestList=allCountRankList;
			return suggestList;
		}
		int[] number=getRandom(6, allCountRankList.size());
		for (int i = 0; i < number.length; i++) {
			for (int j=0;j<allCountRankList.size();j++) {
				if(number[i]==j){
					suggestList.add(allCountRankList.get(j));
					System.out.println("未登录用户筛选的电影名称="+allCountRankList.get(j).getName());
					break;
				}
			}
		}
		System.out.println("根据好评率和播放量筛选的结果如下："+suggestList.size());
		return suggestList;
	}
	
	/**
	 * 获取根据注册时候填写的电影组合获取最接近的15条组合
	 * @param userId
	 * @return
	 */
	public List<Movie> getRegeistGroupMovieList(int userId) {
		List<Movie> suggestList = new ArrayList<Movie>();
		List<Hoby> hobyList=hobyService.findList(userId);
		if(hobyList.size()==1){
			//判断如果1条收藏记录
			suggestList=movieService.findHobyList(hobyList.get(0).getCountryid(), hobyList.get(0).getTypeid(), 15);
		}else if(hobyList.size()==2){
			//判断如果2条收藏记录
			suggestList.addAll(movieService.findHobyList(hobyList.get(0).getCountryid(), hobyList.get(0).getTypeid(), 7));
			suggestList.addAll(movieService.findHobyList(hobyList.get(1).getCountryid(), hobyList.get(1).getTypeid(), 8));
			
		}else if(hobyList.size()==3){
			//判断如果3条收藏记录
			suggestList.addAll(movieService.findHobyList(hobyList.get(0).getCountryid(), hobyList.get(0).getTypeid(), 5));
			suggestList.addAll(movieService.findHobyList(hobyList.get(1).getCountryid(), hobyList.get(1).getTypeid(), 5));
			suggestList.addAll(movieService.findHobyList(hobyList.get(2).getCountryid(), hobyList.get(2).getTypeid(), 5));
		}
		System.out.println("根据注册时候填写的电影组合获取的记录条数："+suggestList.size());
		return suggestList;
	}
	
	/**
	 * 收藏(导演+明星)推荐 15条组合
	 * @param userId
	 * @return
	 */
	public List<Movie> getCollectionSuggestList(int userId) {
		List<Movie> suggestList = new ArrayList<Movie>();
		List<String> act1List=new ArrayList<String>();
		List<String> act2List=new ArrayList<String>();
		List<String> directorList=new ArrayList<String>();
		List<Mycollection> collectionList=mycollectionService.findByUserId(userId);
		for (Mycollection mycollection : collectionList) {
			act1List.add(mycollection.getMainact1());
			act2List.add(mycollection.getMainact2());
			directorList.add(mycollection.getDirector());
		}
		List<String> allActList=new ArrayList<String>();
		allActList.addAll(act1List);
		allActList.addAll(act2List);
		suggestList=movieService.findCollectionList(allActList, allActList, directorList);
		System.out.println("根据个人收藏获取的结果条数："+suggestList.size());
		return suggestList;
	}



	public int[] getRandom(int size, int range) {
		if (size == 0) {
			size = 6;
		}
		int[] number = new int[size];
		for (int j = 0; j < size; j++) {
			boolean had = false;
			int r = (int) (Math.random() * range);
			for (int i = 0; i < number.length; i++) {
				if (r == number[i]) {
					had = true;
					break;
				}
			}
			if(!had){
				number[j]=r;
			}else{
				j=j-1;
			}
		}
		for (int i = 0; i < number.length; i++) {
			System.out.println(number[i]);
		}
		return number;
	}

	// 分页查询
	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "30") int pageSize, Model model) {
		model.addAttribute("page", userService.findPage(currentPage, pageSize));
		return "userList";
	}

	// 查询所有
	@RequestMapping("/list")
	public String findList(Model model) {
		model.addAttribute("list", userService.findList(false, "", ""));
		return "userList";
	}

	// 根据id查询
	@RequestMapping("/findById")
	public String findById(int id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "user";
	}

	// 修改
	@RequestMapping("/edit")
	public String edit(User user, Model model) {
		userService.updateUser(user);
		return "redirect:/user/userList";
	}

	// 跳转到修改页面
	@RequestMapping(value = "/toEdit", method = RequestMethod.POST)
	public String showEdit(int id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "redirect:/user/userEdit";
	}

	// 跳转到添加页面
	@RequestMapping("/toAdd")
	public String showAdd() {
		return "user/userAdd";
	}

	// 添加
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String insert(User user, Model model) {
		userService.insertUser(user);
		return "redirect:/user/userList";
	}

	// 根据id删除
	@RequestMapping("/delete")
	public String deleteById(int id, Model model) {
		userService.deleteById(id);
		return "redirect:/user/userList";
	}

	// 批量删除
	@RequestMapping("/deletes")
	public String deletes(String ids, Model model) {
		userService.deletes(ids);
		return "redirect:/user/userList";
	}
	
	// 测试推荐功能
		@RequestMapping("/testSuggest")
		public String testSuggest(HttpSession session) {
//			User user=userService.findById(2);
//			session.setAttribute("userLogin", user);
			return "redirect:/movie/findByType";
		}
		/**
		 * 收藏电影
		 * @param session
		 * @return
		 */
		@RequestMapping("/addCollection")
		public String addCollection(HttpSession session,int movieId,Model model) {
			User user=new User();
			user=(User) session.getAttribute("userNow");
			Movie movie=movieService.findById(movieId);
			Mycollection collection =new Mycollection();
			collection.setMovieid(movie.getId());
			collection.setUserid(user.getId());
			collection.setMainact1(movie.getMainact1());
			collection.setMainact2(movie.getMainact2());
			collection.setDirector(movie.getDirector());
			try {
				mycollectionService.insertMycollection(collection);
				session.setAttribute("collectionResult", "success");
			} catch (Exception e) {
				session.setAttribute("collectionResult", "fail");
			}
			
			return "redirect:/movie/userfindById?id="+movieId;
		}
		
		/**
		 * 登录
		 * @param session
		 * @return
		 */
		@RequestMapping("/login")
		public String login(HttpSession session,Model model,User user) {
			JSONObject responseJson = new JSONObject();
			String uname=user.getUname();
			System.out.println("【登录】uname="+uname);
			List<User> userlist=userService.findList(true, "uName", uname);
			if(userlist.size()==1){
				if(userlist.get(0).getUpassword().equals(user.getUpassword())){
					responseJson.put("loginResult", "success");
					responseJson.put("loginResultMsg", "登录成功");
					session.setAttribute("userNow", userlist.get(0));
				}else{
					responseJson.put("loginResult", "fail");
					responseJson.put("loginResultMsg", "密码错误");
				}
			}else{
				responseJson.put("loginResult", "fail");
				responseJson.put("loginResultMsg", "用户不存在！");
			}
			System.out.println("responseJson="+responseJson.toString());
			model.addAttribute("responseJson", responseJson);
			return JSON_JSP;
		}
		
		/**
		 * 登录
		 * @param session
		 * @return
		 */
		@RequestMapping("/logout")
		public String logout(HttpSession session,Model model,User user) {
			JSONObject responseJson = new JSONObject();
			System.out.println("【登出】");
			responseJson.put("logoutResultMsg", "登出成功！");
			session.removeAttribute("userNow");
			model.addAttribute("responseJson", responseJson);
			return JSON_JSP;
		}
		
		/**
		 * 开通会员
		 * @param session
		 * @return
		 * @throws ParseException 
		 */
		@RequestMapping("/openMember")
		public String openMember(HttpSession session,Model model,int id) {
			JSONObject responseJson = new JSONObject();
			try {
				User user=userService.findById(id);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				user.setEndtime(df.parse(df.format(new Date())));
				user.setIsmember("1");
				userService.updateUser(user);
				session.setAttribute("userNow", user);
				responseJson.put("result", "success");
				responseJson.put("resultMsg", "会员开通成功");
				model.addAttribute("responseJson", responseJson);
				return JSON_JSP;
			} catch (Exception e) {
				responseJson.put("result", "fail");
				responseJson.put("resultMsg", "会员开通失败，请联系管理员");
				model.addAttribute("responseJson", responseJson);
				return JSON_JSP;
			}
			
		}
		
		/**
		 * 注册
		 * @param session
		 * @return
		 */
		@RequestMapping("/regeist")
		public String regeist(HttpSession session,Model model,User user,String zuhecountyr1,String zuhecountyr2,String zuhetype1,String zuhetype2) {
			JSONObject responseJson = new JSONObject();
            if(StringUtils.isNullOrEmpty(user.getUname())||StringUtils.isNullOrEmpty(user.getUpassword())){
            	responseJson.put("result","fail" );
				responseJson.put("resultMsg","用户名或密码为空！" );
				model.addAttribute("responseJson", responseJson);
				return JSON_JSP;	
            }
			System.out.println("【注册】名称："+user.getUname());
			List<User> userList=userService.findList(true, "uName", user.getUname());
			
			if(userList.size()>1){
				responseJson.put("result","fail" );
				responseJson.put("resultMsg","用户名已经存在！" );
				model.addAttribute("responseJson", responseJson);
				return JSON_JSP;	
			}else{
				user.setIsmember("0");
				int id=userService.insertUser(user);
				System.out.println("user.Id="+user.getId());
			}
			System.out.println("【注册】："+user.getUname()+"zucetype1="+zuhetype1);
			Hoby hoby1=new Hoby();
			Hoby hoby2=new Hoby();
			if(!StringUtils.isNullOrEmpty(zuhetype1)||!StringUtils.isNullOrEmpty(zuhecountyr1)){
				hoby1.setTypeid(StringUtils.isNullOrEmpty(zuhetype1)?0:Integer.parseInt(zuhetype1));
				hoby1.setCountryid(StringUtils.isNullOrEmpty(zuhecountyr1)?0:Integer.parseInt(zuhecountyr1));
				hoby1.setUserid(user.getId());
				System.out.println("保存组合1");
				hobyService.insertHoby(hoby1);
			}
			if(!StringUtils.isNullOrEmpty(zuhetype2)||!StringUtils.isNullOrEmpty(zuhecountyr2)){
				hoby2.setTypeid(StringUtils.isNullOrEmpty(zuhetype2)?0:Integer.parseInt(zuhetype2));
				hoby2.setCountryid(StringUtils.isNullOrEmpty(zuhecountyr2)?0:Integer.parseInt(zuhecountyr2));
				hoby2.setUserid(user.getId());
				hobyService.insertHoby(hoby2);
				System.out.println("保存组合2");
			}
			
			responseJson.put("result","success" );
			responseJson.put("resultMsg","注册成功，请登录！" );
			model.addAttribute("responseJson", responseJson);
			return JSON_JSP;
		}
		
		
		public static void main(String args[]){
			User user=new User();
			System.out.println(user.getId());
		}

}
