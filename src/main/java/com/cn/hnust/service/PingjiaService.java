package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Pingjia;
import java.util.List;
/**
 * @ClassName: PingjiaService
 * @title: PingjiaService.class
 * @author: liulangzhizi
 * @Data: 2020-04-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface PingjiaService{

	public PageBean findPage(int currentPage , int pageSize);

	public Pingjia findById(int id);

	public List<Pingjia> findList();

	public int insertPingjia(Pingjia entity);

	public int updatePingjia(Pingjia entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
