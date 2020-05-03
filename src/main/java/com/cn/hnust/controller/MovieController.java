package com.cn.hnust.controller;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.cn.hnust.pojo.Country;
import com.cn.hnust.pojo.Movie;
import com.cn.hnust.pojo.Movieimg;
import com.cn.hnust.pojo.Mtype;
import com.cn.hnust.pojo.Pingjia;
import com.cn.hnust.service.CountryService;
import com.cn.hnust.service.MovieService;
import com.cn.hnust.service.MovieimgService;
import com.cn.hnust.service.MtypeService;
import com.cn.hnust.service.PingjiaService;
import com.cn.hnust.utils.PageBean;
import com.mysql.jdbc.StringUtils;

/**
 * @ClassName: MovieController
 * @title: MovieController.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:
 */
@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	private MovieService movieService;

	@Autowired
	private CountryService countryService;

	@Autowired
	private MovieimgService movieimgService;

	@Autowired
	private MtypeService mtypeService;

	@Autowired
	private PingjiaService pingjiaService;
	
	private static final String JSON_JSP = "user/jsondata";


	@RequestMapping("/pageList")
	public String findPage(@RequestParam(defaultValue = "1") int currentPage,
			               @RequestParam(defaultValue = "5") int pageSize, Model model, @RequestParam(defaultValue = "name") String name,
						   @RequestParam(defaultValue = "author") String author,@RequestParam(defaultValue = "publish")String publish,
						   @RequestParam(defaultValue = "0")int type,@RequestParam(defaultValue = "0")int subtype) throws UnsupportedEncodingException {
		Movie movie = new Movie();
		System.out.println("系统走到了这里");
		//System.out.println(System.getProperty("file.encoding"));
		//System.out.println(Charset.defaultCharset());
		name=new String(name.getBytes("ISO-8859-1"), "UTF-8");
		author=new String(author.getBytes("ISO-8859-1"), "UTF-8");
		publish=new String(publish.getBytes("ISO-8859-1"), "UTF-8");
		System.out.println("打印传输"+name);
        System.out.println("打印"+type);
		System.out.println("打印输出"+subtype);
		System.out.println("数字"+currentPage+"加上"+pageSize+"加上"+pageSize+"加上"+model.toString()+"加上");
		if(name.equals("name")&&author.equals("author")&&publish.equals("publish")&&type==0&&subtype==0){
			System.out.println("走到是第一步");
			model.addAttribute("pageBean",
				movieService.findPage(currentPage, pageSize, movie));}
		else{
			System.out.println("走到是第二步");
			String searchParam = "%"+name+"%";
			author = "%"+author+"%";
			publish = "%"+publish+"%";
			if (!StringUtils.isNullOrEmpty(searchParam)) {
				movie.setName(searchParam);
				movie.setDirector(author);
				movie.setMainact1(publish);
				movie.setMainact2(searchParam);
				movie.setTypeid(type);
				movie.setCountryid(subtype);
			}
			model.addAttribute("pageBean",
				movieService.findPageQuery1(currentPage, pageSize, movie));}
		List<Country> countryList = countryService.findList();
		List<Mtype> typeList = mtypeService.findList();
		model.addAttribute("countryList", countryList);
		model.addAttribute("typeList", typeList);
		return "movieList";
	}

	@RequestMapping("/addCount")
	public String addCount(int id,Model model) {
		JSONObject responseJson = new JSONObject();
		Movie movie=movieService.findById(id);
		movie.setCount(movie.getCount()+1);
		movieService.updateMovie(movie);
		return JSON_JSP;
	}


	@RequestMapping("/list")
	public String findList(Model model) {
		model.addAttribute("list", movieService.findList());
		return "movieList";
	}

	//  idType
	@RequestMapping("/findById")
	public String findById(int id, Model model) {
		Movie movie = movieService.findById(id);
		List<Mtype> typelist = mtypeService.findList();
		for (Mtype mtype : typelist) {
			if (movie.getTypeid().equals(mtype.getId())) {
				movie.setTypename(mtype.getTypename());
				break;
			}
		}
		List<Country> countrylist = countryService.findList();
		for (Country country : countrylist) {
			if (movie.getCountryid().equals(country.getId())) {
				movie.setCountryname(country.getCountryname());
				break;
			}
		}
		model.addAttribute("movie", movie);
		List<Movieimg> imageList = movieimgService.findByMovieId(id);
		model.addAttribute("imageList", imageList);
		return "movieDetial";
	}

	// idType
	@RequestMapping("/userfindById")
	public String userfindById(int id, Model model,HttpSession session) {
		String collectionResult=(String) session.getAttribute("collectionResult");
		if(!StringUtils.isNullOrEmpty(collectionResult)){
			session.removeAttribute("collectionResult");
			if("success".equals(collectionResult)){
				model.addAttribute("collectionResult", "收藏成功");
			}else{
				model.addAttribute("collectionResult", "收藏失败");
			}
		}
		Movie movie = movieService.findById(id);
		List<Mtype> typelist = mtypeService.findList();
		for (Mtype mtype : typelist) {
			if (movie.getTypeid().equals(mtype.getId())) {
				movie.setTypename(mtype.getTypename());
				break;
			}
		}
		List<Country> countrylist = countryService.findList();
		for (Country country : countrylist) {
			if (movie.getCountryid().equals(country.getId())) {
				movie.setCountryname(country.getCountryname());
				break;
			}
		}
		model.addAttribute("movie", movie);
		List<Movieimg> imageList = movieimgService.findByMovieId(id);
		model.addAttribute("imageList", imageList);
		// 获取评价列表
		List<Pingjia> allList = pingjiaService.findList();
		List<Pingjia> pinjiaList = new ArrayList<Pingjia>();
		for (Pingjia pingjia : allList) {
			if (id == pingjia.getMovieid()) {
				pinjiaList.add(pingjia);
			}
		}
		model.addAttribute("pinjiaList", pinjiaList);
		model.addAttribute("pinjiaCounts", pinjiaList.size());

		// 查找类型
		List<Mtype> typeList = mtypeService.findList();
		System.out.println("首页获取typeList.size()=" + typeList.size());
		model.addAttribute("typeList", typeList);

		List<Movie> allmovieList = movieService.findList();
		// 获取导演的其他作品 
		List<Movie> movieListOfDirect = new ArrayList<Movie>();
		// 获取主演的其他作品
		List<Movie> movieListOfActor = new ArrayList<Movie>();

		for (Movie movie2 : allmovieList) {
		if(movie2.getId().equals(movie.getId())){
				continue;
			}
       if(movie2.getDirector().equals(movie.getDirector())){
        	movieListOfDirect.add(movie2);
        }
        if(movie2.getMainact1().equals(movie.getMainact1())||movie2.getMainact1().equals(movie.getMainact2())||movie2.getMainact2().equals(movie.getMainact1())||movie2.getMainact2().equals(movie.getMainact2())){
        	movieListOfActor.add(movie2);
        }
		}
		UserController userController=new UserController();
		List<Movie> suggestDirectMovie=new ArrayList<Movie>();
		List<Movie> suggestActMovie=new ArrayList<Movie>();
		if(movieListOfDirect.size()>3){
			suggestDirectMovie=userController.getRandomMovieList(movieListOfDirect, 3);
		}else{
			suggestDirectMovie.addAll(movieListOfDirect);
		}
		
		if(movieListOfActor.size()>3){
			suggestActMovie=userController.getRandomMovieList(movieListOfActor, 3);
		}else{
			suggestActMovie.addAll(movieListOfActor);
		}
		//传递推荐电影到页面
		model.addAttribute("suggestDirectMovie", suggestDirectMovie);
		model.addAttribute("suggestActMovie", suggestActMovie);

		return "user/single";
	}


	@RequestMapping("/edit")
	public String edit(Movie movie) {
		System.out.println(movie);
		movieService.updateMovie(movie);
		return "redirect:/movie/pageList";
	}


	@RequestMapping("/showEdit")
	public String showEdit(int id, Model model) throws ParseException {
		List<Country> countryList = countryService.findList();
		model.addAttribute("countryList", countryList);
		List<Mtype> typeList = mtypeService.findList();
		model.addAttribute("typeList", typeList);
		Movie movie = movieService.findById(id);
		SimpleDateFormat sdf = new SimpleDateFormat(
				"EEE MMM dd HH:mm:ss z yyyy", Locale.US);
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(movie.getStartdate());
		System.out.println(format);
		List<String> list1 = new ArrayList<String>();
		list1.add(0, "非会员电影");
		list1.add(1, "会员电影");
		model.addAttribute("startdate", format);
		model.addAttribute("list1", list1);
		model.addAttribute("movie", movie);
		return "movieEdit";
	}


	@RequestMapping("/showAdd")
	public String showAdd(Model model) {
		List<Country> countryList = countryService.findList();
		model.addAttribute("countryList", countryList);
		List<Mtype> typeList = mtypeService.findList();
		model.addAttribute("typeList", typeList);
		return "movieAdd";
	}


	@RequestMapping("/save")
	public String insert(Movie movie, Model model, String[] detialImg,
			String[] detialDesc) throws ParseException {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		movie.setStartdate(format.parse(format.format(date)));
		int id = 0;
		movie.setCount(0);
		movie.setRank((double) 5);
		id = movieService.insertMovie(movie);
		System.out.println("看看返回的主键值：" + movie.getId());
		// 保存出错，返回添加页面
		if (id <= 0) {
			model.addAttribute("errMsg", "保存出错！");
			List<Country> countryList = countryService.findList();
			model.addAttribute("countryList", countryList);
			List<Mtype> typeList = mtypeService.findList();
			model.addAttribute("countryList", countryList);
			return "movieAdd";
		}
		for (int i = 0; i < detialDesc.length; i++) {
			System.out.println("第" + i + "个描述=" + detialDesc[i]);
		}
		for (int i = 0; i < detialImg.length; i++) {
			System.out.println("第" + i + "个图片=" + detialImg[i]);
			if (StringUtils.isNullOrEmpty(detialImg[i])) {
				continue;
			} else {
				Movieimg movieImg = new Movieimg();
				movieImg.setMovieid(movie.getId());
				movieImg.setImg(detialImg[i]);
				movieImg.setimgDesc(detialDesc[i]);
				movieimgService.insertMovieimg(movieImg);
			}
		}

		return "redirect:/movie/pageList";
	}


	@RequestMapping("/delete")
	public String deleteById(int id, Model model) {
		movieService.deleteById(id);
		return "redirect:/movie/pageList";
	}


	@RequestMapping("/deletes")
	public String deletes(String ids, Model model) {
		movieService.deletes(ids);
		return "redirect:/movie/movieList";
	}

	// ***************************以下位用户操作**************************************************

	@RequestMapping("/findByType")
	public String findByType(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "20") int pageSize, Model model,
			String typeId) {
		System.out.println("【测试根据type获取】");
		// 测试数据
		Movie movie = new Movie();
		movie.setTypeid(Integer.parseInt(typeId));
		System.out.println("movie复制type后：" + movie.getTypeid());
		PageBean page = movieService.findPage(currentPage, pageSize, movie);
		System.out.println("根据类型查找的结果：" + page.getRows());
		model.addAttribute("pageBean",movieService.findPage(currentPage, pageSize, movie));
		// 查找类型
		List<Mtype> typeList = mtypeService.findList();
		System.out.println("首页获取typeList.size()=" + typeList.size());
		model.addAttribute("typeList", typeList);
		return "user/search";
	}

	@RequestMapping("/movieQuery")
	public String movieQuery(@RequestParam(defaultValue = "1") int currentPage,	@RequestParam(defaultValue = "20") int pageSize, Model model,String searchParam) {
		System.out.println("【测试根据模糊查询】");
//		param ="绝地";
		System.out.println(searchParam);
		model.addAttribute("param", searchParam);
		// 测试数据
		searchParam = "%" + searchParam + "%";
		Movie movie = new Movie();
		if (!StringUtils.isNullOrEmpty(searchParam)) {
			movie.setName(searchParam);
			movie.setDirector(searchParam);
			movie.setMainact1(searchParam);
			movie.setMainact2(searchParam);
			movie.setIntroduce(searchParam);
		}
		// 测试数据
		PageBean page = movieService
				.findPageQuery(currentPage, pageSize, movie);
		System.out.println("模糊查询查找的结果：" + page.getRows());
		model.addAttribute("pageBean", page);

		// 查找类型
		List<Mtype> typeList = mtypeService.findList();
		System.out.println("首页获取typeList.size()=" + typeList.size());
		model.addAttribute("typeList", typeList);
		return "user/search";
	}
	
	@RequestMapping("/rank")
	public String rank(Model model,Pingjia pinjia) throws ParseException {
		JSONObject responseJson = new JSONObject();
		System.out.println("pinjia.getMovieid()="+pinjia.getMovieid());
		Movie movie=movieService.findById(pinjia.getMovieid());
		double rank=(movie.getRank()+pinjia.getRank())/2;
		movie.setRank(rank);
		movieService.updateMovie(movie);
		Date date=new Date();
	    DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time=format.parse(format.format(date));
		pinjia.setPjdate(time);
		pingjiaService.insertPingjia(pinjia);
		responseJson.put("rankResult", "success");
		responseJson.put("rankResultMsg", "评论成功！");
		System.out.println("responseJson="+responseJson.toString());
		model.addAttribute("responseJson", responseJson);
		return JSON_JSP;
	}

}
