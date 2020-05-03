package com.cn.hnust.service;
import com.cn.hnust.utils.PageBean;
import com.cn.hnust.pojo.Hoby;
import java.util.List;
/**
 * @ClassName: HobyService
 * @title: HobyService.class
 * @author: liulangzhizi
 * @Data: 2020-03-25 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface HobyService{

	public PageBean findPage(int currentPage , int pageSize);

	public Hoby findById(int id);

	public List<Hoby> findList(int userId);

	public int insertHoby(Hoby entity);

	public int updateHoby(Hoby entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
