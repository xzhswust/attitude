package com.attitude.dal.mybatis.dao;

import com.attitude.dal.mybatis.entity.UserRating;
import com.attitude.dal.mybatis.entity.UserRatingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserRatingMapper {
    int countByExample(UserRatingExample example);

    int deleteByExample(UserRatingExample example);

    int deleteByPrimaryKey(Integer oId);

    int insert(UserRating record);

    int insertSelective(UserRating record);

    List<UserRating> selectByExample(UserRatingExample example);

    UserRating selectByPrimaryKey(Integer oId);

    int updateByExampleSelective(@Param("record") UserRating record, @Param("example") UserRatingExample example);

    int updateByExample(@Param("record") UserRating record, @Param("example") UserRatingExample example);

    int updateByPrimaryKeySelective(UserRating record);

    int updateByPrimaryKey(UserRating record);
}