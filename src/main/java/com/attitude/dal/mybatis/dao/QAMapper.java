package com.attitude.dal.mybatis.dao;

import com.attitude.dal.mybatis.entity.QA;
import com.attitude.dal.mybatis.entity.QAExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QAMapper {
    int countByExample(QAExample example);

    int deleteByExample(QAExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QA record);

    int insertSelective(QA record);

    List<QA> selectByExample(QAExample example);

    QA selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QA record, @Param("example") QAExample example);

    int updateByExample(@Param("record") QA record, @Param("example") QAExample example);

    int updateByPrimaryKeySelective(QA record);

    int updateByPrimaryKey(QA record);
}