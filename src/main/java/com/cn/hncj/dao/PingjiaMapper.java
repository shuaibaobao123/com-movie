package com.cn.hncj.dao;

import com.cn.hncj.pojo.Pingjia;
import com.cn.hncj.pojo.PingjiaExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PingjiaMapper {
    int countByExample(PingjiaExample example);

    int deleteByExample(PingjiaExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Pingjia record);

    int insertSelective(Pingjia record);

    List<Pingjia> selectByExampleWithBLOBs(PingjiaExample example);

    List<Pingjia> selectByExample(PingjiaExample example);

    Pingjia selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Pingjia record, @Param("example") PingjiaExample example);

    int updateByExampleWithBLOBs(@Param("record") Pingjia record, @Param("example") PingjiaExample example);

    int updateByExample(@Param("record") Pingjia record, @Param("example") PingjiaExample example);

    int updateByPrimaryKeySelective(Pingjia record);

    int updateByPrimaryKeyWithBLOBs(Pingjia record);

    int updateByPrimaryKey(Pingjia record);
}