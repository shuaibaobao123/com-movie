package com.cn.hncj.dao;

import com.cn.hncj.pojo.Hoby;
import com.cn.hncj.pojo.HobyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HobyMapper {
    int countByExample(HobyExample example);

    int deleteByExample(HobyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Hoby record);

    int insertSelective(Hoby record);

    List<Hoby> selectByExample(HobyExample example);

    Hoby selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Hoby record, @Param("example") HobyExample example);

    int updateByExample(@Param("record") Hoby record, @Param("example") HobyExample example);

    int updateByPrimaryKeySelective(Hoby record);

    int updateByPrimaryKey(Hoby record);
}