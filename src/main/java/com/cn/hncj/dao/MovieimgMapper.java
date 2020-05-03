package com.cn.hncj.dao;

import com.cn.hncj.pojo.Movieimg;
import com.cn.hncj.pojo.MovieimgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieimgMapper {
    int countByExample(MovieimgExample example);

    int deleteByExample(MovieimgExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Movieimg record);

    int insertSelective(Movieimg record);

    List<Movieimg> selectByExampleWithBLOBs(MovieimgExample example);

    List<Movieimg> selectByExample(MovieimgExample example);

    Movieimg selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Movieimg record, @Param("example") MovieimgExample example);

    int updateByExampleWithBLOBs(@Param("record") Movieimg record, @Param("example") MovieimgExample example);

    int updateByExample(@Param("record") Movieimg record, @Param("example") MovieimgExample example);

    int updateByPrimaryKeySelective(Movieimg record);

    int updateByPrimaryKeyWithBLOBs(Movieimg record);

    int updateByPrimaryKey(Movieimg record);
}