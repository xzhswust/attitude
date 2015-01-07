package com.attitude.dal.mybatis.dao;

import com.attitude.dal.mybatis.entity.DicType;
import com.attitude.dal.mybatis.entity.DicTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DicTypeMapper {
    int countByExample(DicTypeExample example);

    int deleteByExample(DicTypeExample example);

    int deleteByPrimaryKey(Integer dicTypeId);

    int insert(DicType record);

    int insertSelective(DicType record);

    List<DicType> selectByExample(DicTypeExample example);

    DicType selectByPrimaryKey(Integer dicTypeId);

    int updateByExampleSelective(@Param("record") DicType record, @Param("example") DicTypeExample example);

    int updateByExample(@Param("record") DicType record, @Param("example") DicTypeExample example);

    int updateByPrimaryKeySelective(DicType record);

    int updateByPrimaryKey(DicType record);
}