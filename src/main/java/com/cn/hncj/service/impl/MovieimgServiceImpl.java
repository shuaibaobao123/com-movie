package com.cn.hncj.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hncj.dao.MovieimgMapper;
import com.cn.hncj.pojo.Movieimg;
import com.cn.hncj.pojo.MovieimgExample;
import com.cn.hncj.pojo.MovieimgExample.Criteria;
import com.cn.hncj.service.MovieimgService;
import com.cn.hncj.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * @ClassName: MovieimgServiceImpl
 * @title: MovieimgServiceImpl.class
 * @author: liulangzhizi
 * @Data: 2020-03-12 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Service
public class MovieimgServiceImpl implements MovieimgService {

	@Resource
	private MovieimgMapper movieimgmapper;


	@Override
	public PageBean findPage(int currentPage , int pageSize){
		PageBean pageBean = new PageBean();
		MovieimgExample example=new MovieimgExample();
		PageHelper.startPage(currentPage, pageSize);
		List<Movieimg> list = movieimgmapper.selectByExampleWithBLOBs(example);
		PageInfo<Movieimg> info = new PageInfo<Movieimg>(list);
		long total = info.getTotal();
		int totalPage = (int) ((total + pageSize - 1) / pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotal(total);
		pageBean.setRows(list);
		pageBean.setCurrentPage(currentPage);
		return pageBean;
	}
	

	@Override
	public Movieimg findById(int id){
		return movieimgmapper.selectByPrimaryKey(id);
	}
	

	@Override
	public List<Movieimg> findList(){
		MovieimgExample example=new MovieimgExample();
		return movieimgmapper.selectByExample(example);
	}
	

	@Override
	public int insertMovieimg(Movieimg entity){
		return movieimgmapper.insert(entity);
	}
	

	@Override
	public int updateMovieimg(Movieimg entity){
		return movieimgmapper.updateByPrimaryKey(entity);
	}
	

	@Override
	public int deleteById(int id){
		return movieimgmapper.deleteByPrimaryKey(id);
	}
	

	@Override
	public void deletes(String ids){
		String[] str=ids.split(",");
		for(String id : str){
			try {
				movieimgmapper.deleteByPrimaryKey(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	public List<Movieimg> findByMovieId(int movieId) {
		MovieimgExample example=new MovieimgExample();
		Criteria criteria = example.createCriteria();
		criteria.andMovieidEqualTo(movieId);
		return this.movieimgmapper.selectByExampleWithBLOBs(example);
	}
}
