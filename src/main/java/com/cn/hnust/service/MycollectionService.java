package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Mycollection;
import java.util.List;
/**
 * @ClassName: MycollectionService
 * @title: MycollectionService.class
 * @author: liulangzhizi
 * @Data: 2020-04-01 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface MycollectionService{

	public PageBean findPage(int currentPage , int pageSize);

	public Mycollection findById(int id);
	
	public List<Mycollection> findByUserId(int id);

	public List<Mycollection> findList();

	public int insertMycollection(Mycollection entity);

	public int updateMycollection(Mycollection entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
