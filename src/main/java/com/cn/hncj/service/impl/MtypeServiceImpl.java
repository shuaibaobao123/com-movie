package com.cn.hncj.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hncj.dao.MtypeMapper;
import com.cn.hncj.pojo.Mtype;
import com.cn.hncj.pojo.MtypeExample;
import com.cn.hncj.service.MtypeService;
import com.cn.hncj.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * @ClassName: MtypeServiceImpl
 * @title: MtypeServiceImpl.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Service
public class MtypeServiceImpl implements MtypeService {

	@Resource
	private MtypeMapper mtypemapper;


	@Override
	public PageBean findPage(int currentPage , int pageSize){
		PageBean pageBean = new PageBean();
		MtypeExample example=new MtypeExample();
		PageHelper.startPage(currentPage, pageSize);
		List<Mtype> list = mtypemapper.selectByExample(example);
		PageInfo<Mtype> info = new PageInfo<Mtype>(list);
		long total = info.getTotal();
		int totalPage = (int) ((total + pageSize - 1) / pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotal(total);
		pageBean.setRows(list);
		pageBean.setCurrentPage(currentPage);
		return pageBean;
	}
	

	@Override
	public Mtype findById(int id){
		return mtypemapper.selectByPrimaryKey(id);
	}
	

	@Override
	public List<Mtype> findList(){
		MtypeExample example=new MtypeExample();
		return mtypemapper.selectByExample(example);
	}
	

	@Override
	public int insertMtype(Mtype entity){
		return mtypemapper.insert(entity);
	}
	

	@Override
	public int updateMtype(Mtype entity){
		return mtypemapper.updateByPrimaryKey(entity);
	}
	

	@Override
	public int deleteById(int id){
		return mtypemapper.deleteByPrimaryKey(id);
	}
	

	@Override
	public void deletes(String ids){
		String[] str=ids.split(",");
		for(String id : str){
			try {
				mtypemapper.deleteByPrimaryKey(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
}
