package com.cn.hnust.service.impl;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.UserMapper;
import com.cn.hnust.pojo.User;
import com.cn.hnust.pojo.UserExample;
import com.cn.hnust.pojo.UserExample.Criteria;
import com.cn.hnust.service.UserService;
import com.cn.hnust.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * @ClassName: UserServiceImpl
 * @title: UserServiceImpl.class
 * @author: liulangzhizi
 * @Data: 2020-03-01 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper usermapper;


	@Override
	public PageBean findPage(int currentPage , int pageSize){
		PageBean pageBean = new PageBean();
		UserExample example=new UserExample();
		PageHelper.startPage(currentPage, pageSize);
		List<User> list = usermapper.selectByExample(example);
		PageInfo<User> info = new PageInfo<User>(list);
		long total = info.getTotal();
		int totalPage = (int) ((total + pageSize - 1) / pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotal(total);
		pageBean.setRows(list);
		pageBean.setCurrentPage(currentPage);
		return pageBean;
	}
	

	@Override
	public User findById(int id){
		return usermapper.selectByPrimaryKey(id);
	}
	

	@Override
	public List<User> findList(boolean hasParams, String ParamName, String ParamValue){
		UserExample example=new UserExample();
		Criteria criteria = example.createCriteria();
		if(!hasParams){
		return usermapper.selectByExample(example);
		}else{
			//查询所有会员
			if("isPay".equals(ParamName)){
				criteria.andIsPayEqualTo(1);
				return usermapper.selectByExample(example);
			}else if("uName".equals(ParamName)){
				criteria.andUnameEqualTo(ParamValue);
				return usermapper.selectByExample(example);
			}
			else{
				return usermapper.selectByExample(example);	
			}
			
		}
		
	}
	

	@Override
	public int insertUser(User entity){
		return usermapper.insert(entity);
	}
	

	@Override
	public int updateUser(User entity){
		return usermapper.updateByPrimaryKey(entity);
	}
	

	@Override
	public int deleteById(int id){
		return usermapper.deleteByPrimaryKey(id);
	}
	

	@Override
	public void deletes(String ids){
		String[] str=ids.split(",");
		for(String id : str){
			try {
				usermapper.deleteByPrimaryKey(Integer.parseInt(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
}
