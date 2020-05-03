package com.cn.hncj.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hncj.dao.HobyMapper;
import com.cn.hncj.pojo.Hoby;
import com.cn.hncj.pojo.HobyExample;
import com.cn.hncj.pojo.HobyExample.Criteria;
import com.cn.hncj.service.HobyService;
import com.cn.hncj.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * @ClassName: HobyServiceImpl
 * @title: HobyServiceImpl.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Service
public class HobyServiceImpl implements HobyService {

	@Resource
	private HobyMapper hobymapper;


	@Override
	public PageBean findPage(int currentPage , int pageSize){
		PageBean pageBean = new PageBean();
		HobyExample example=new HobyExample();
		PageHelper.startPage(currentPage, pageSize);
		List<Hoby> list = hobymapper.selectByExample(example);
		PageInfo<Hoby> info = new PageInfo<Hoby>(list);
		long total = info.getTotal();
		int totalPage = (int) ((total + pageSize - 1) / pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotal(total);
		pageBean.setRows(list);
		pageBean.setCurrentPage(currentPage);
		return pageBean;
	}
	

	@Override
	public Hoby findById(int id){
		return hobymapper.selectByPrimaryKey(id);
	}
	

	@Override
	public List<Hoby> findList(int userId){
		HobyExample example=new HobyExample();
		Criteria criteria=example.createCriteria();
		criteria.andUseridEqualTo(userId);
		example.setOrderByClause("Id desc");
		return hobymapper.selectByExample(example);
	}
	

	@Override
	public int insertHoby(Hoby entity){
		return hobymapper.insert(entity);
	}
	

	@Override
	public int updateHoby(Hoby entity){
		return hobymapper.updateByPrimaryKey(entity);
	}
	

	@Override
	public int deleteById(int id){
		return hobymapper.deleteByPrimaryKey(id);
	}
	

	@Override
	public void deletes(String ids){
		String[] str=ids.split(",");
		for(String id : str){
			try {
				hobymapper.deleteByPrimaryKey(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
}
