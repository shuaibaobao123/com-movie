package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Movie;

import java.util.List;
/**
 * @ClassName: MovieService
 * @title: MovieService.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface MovieService{

	public PageBean findPage(int currentPage , int pageSize,Movie movie);
	
	public PageBean findPageQuery(int currentPage , int pageSize,Movie movie);

	public PageBean findPageQuery1(int currentPage , int pageSize,Movie movie);

	public Movie findById(int id);

	public List<Movie> findList();
	
	public List<Movie> findCollectionList(List<String> act1List,List<String> act2List,List<String> directorList);
	
	public List<Movie> findHobyList(int countryId,int typeId,int counts);
	

	public int insertMovie(Movie entity);

	public int updateMovie(Movie entity);

	public int deleteById(int id);

	public void deletes(String ids);
	
	public List<Movie> findListByCounts();
	
	public List<Movie> findListNewMovie();
	
	public List<Movie> findListByrank();
}
