package com.cn.hnust.dao;

import com.cn.hnust.pojo.Mtype;
import com.cn.hnust.pojo.MtypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MtypeMapper {
    int countByExample(MtypeExample example);

    int deleteByExample(MtypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Mtype record);

    int insertSelective(Mtype record);

    List<Mtype> selectByExample(MtypeExample example);

    Mtype selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Mtype record, @Param("example") MtypeExample example);

    int updateByExample(@Param("record") Mtype record, @Param("example") MtypeExample example);

    int updateByPrimaryKeySelective(Mtype record);

    int updateByPrimaryKey(Mtype record);
}