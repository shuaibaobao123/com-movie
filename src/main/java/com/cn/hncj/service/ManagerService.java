package com.cn.hncj.service;
import java.util.List;

import com.cn.hncj.pojo.Manager;
import com.cn.hncj.utils.PageBean;
/**
 * @ClassName: ManagerService
 * @title: ManagerService.class
 * @author: liulangzhizi
 * @Data: 2020-03-21 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface ManagerService{

	public PageBean findPage(int currentPage , int pageSize);

	public Manager findById(int id);

	public List<Manager> findList();

	public int insertManager(Manager entity);

	public int updateManager(Manager entity);

	public int deleteById(int id);

	public void deletes(String ids);
	
	public Manager checkLogin(String name, String password);
}
