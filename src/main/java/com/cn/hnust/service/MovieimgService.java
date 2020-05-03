package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Movieimg;
import java.util.List;
/**
 * @ClassName: MovieimgService
 * @title: MovieimgService.class
 * @author: liulangzhizi
 * @Data: 2020-04-11 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface MovieimgService{

	public PageBean findPage(int currentPage , int pageSize);

	public Movieimg findById(int id);

	public List<Movieimg> findList();
	
	public List<Movieimg> findByMovieId(int movieId);

	public int insertMovieimg(Movieimg entity);

	public int updateMovieimg(Movieimg entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
