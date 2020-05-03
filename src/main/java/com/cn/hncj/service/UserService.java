package com.cn.hncj.service;
import java.util.List;

import com.cn.hncj.pojo.User;
import com.cn.hncj.utils.PageBean;
/**
 * @ClassName: UserService
 * @title: UserService.class
 * @author: liulangzhizi
 * @Data: 2020-04-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface UserService{

	public PageBean findPage(int currentPage , int pageSize);

	public User findById(int id);

	public List<User> findList(boolean hasParams,String ParamName,String ParamValue);

	public int insertUser(User entity);

	public int updateUser(User entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
