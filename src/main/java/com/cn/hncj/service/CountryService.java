package com.cn.hncj.service;
import com.cn.hncj.utils.PageBean;
import com.cn.hncj.pojo.Country;
import java.util.List;
/**
 * @ClassName: CountryService
 * @title: CountryService.class
 * @author: liulangzhizi
 * @Data: 2020-03-07 10:23:26
 * @Version: V1.0.0
 * @description:  
 */
public interface CountryService{

	public PageBean findPage(int currentPage , int pageSize);

	public Country findById(int id);

	public List<Country> findList();

	public int insertCountry(Country entity);

	public int updateCountry(Country entity);

	public int deleteById(int id);

	public void deletes(String ids);
}
