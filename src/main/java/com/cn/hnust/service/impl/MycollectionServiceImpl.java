package com.cn.hnust.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.MycollectionMapper;
import com.cn.hnust.pojo.Mycollection;
import com.cn.hnust.pojo.MycollectionExample;
import com.cn.hnust.pojo.MycollectionExample.Criteria;
import com.cn.hnust.service.MycollectionService;
import com.cn.hnust.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * @ClassName: MycollectionServiceImpl
 * @title: MycollectionServiceImpl.class
 * @author: liulangzhizi
 * @Data: 2016-03-21 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Service
public class MycollectionServiceImpl implements MycollectionService {

	@Resource
	private MycollectionMapper mycollectionmapper;


	@Override
	public PageBean findPage(int currentPage , int pageSize){
		PageBean pageBean = new PageBean();
		MycollectionExample example=new MycollectionExample();
		PageHelper.startPage(currentPage, pageSize);
		List<Mycollection> list = mycollectionmapper.selectByExample(example);
		PageInfo<Mycollection> info = new PageInfo<Mycollection>(list);
		long total = info.getTotal();
		int totalPage = (int) ((total + pageSize - 1) / pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotal(total);
		pageBean.setRows(list);
		pageBean.setCurrentPage(currentPage);
		return pageBean;
	}
	

	@Override
	public Mycollection findById(int id){
		return mycollectionmapper.selectByPrimaryKey(id);
	}
	

	@Override
	public List<Mycollection> findList(){
		MycollectionExample example=new MycollectionExample();
		return mycollectionmapper.selectByExample(example);
	}
	

	@Override
	public int insertMycollection(Mycollection entity){
		return mycollectionmapper.insert(entity);
	}
	

	@Override
	public int updateMycollection(Mycollection entity){
		return mycollectionmapper.updateByPrimaryKey(entity);
	}
	

	@Override
	public int deleteById(int id){
		return mycollectionmapper.deleteByPrimaryKey(id);
	}
	

	@Override
	public void deletes(String ids){
		String[] str=ids.split(",");
		for(String id : str){
			try {
				mycollectionmapper.deleteByPrimaryKey(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	public List<Mycollection> findByUserId(int id) {
		MycollectionExample example=new MycollectionExample();
		Criteria criteria= example.createCriteria();
		criteria.andUserIdEqualTo(id);
		return mycollectionmapper.selectByExample(example);
	}
}
