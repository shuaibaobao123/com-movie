package com.cn.hncj.dao;

import com.cn.hncj.pojo.Mycollection;
import com.cn.hncj.pojo.MycollectionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MycollectionMapper {
    int countByExample(MycollectionExample example);

    int deleteByExample(MycollectionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Mycollection record);

    int insertSelective(Mycollection record);

    List<Mycollection> selectByExample(MycollectionExample example);

    Mycollection selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Mycollection record, @Param("example") MycollectionExample example);

    int updateByExample(@Param("record") Mycollection record, @Param("example") MycollectionExample example);

    int updateByPrimaryKeySelective(Mycollection record);

    int updateByPrimaryKey(Mycollection record);
}