package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Mtype;
import java.util.List;
/**
 * @ClassName: MtypeService
 * @title: MtypeService.class
 * @author: liulangzhizi
 * @Data: 2020-03-15 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface MtypeService{

	public PageBean findPage(int currentPage , int pageSize);

	public Mtype findById(int id);

	public List<Mtype> findList();

	public int insertMtype(Mtype entity);

	public int updateMtype(Mtype entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
