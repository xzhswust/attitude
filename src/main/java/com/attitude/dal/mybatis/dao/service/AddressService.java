package com.attitude.dal.mybatis.dao.service;

import com.attitude.dal.mybatis.dao.AddressMapper;
import com.attitude.dal.mybatis.entity.Address;
import com.attitude.dal.mybatis.entity.AddressExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zh.xu on 2015/1/15.
 */
@Transactional
@Service
public class AddressService implements AddressMapper {
    @Resource
    private AddressMapper mapper;

    @Override
    public int countByExample(AddressExample example) {
        return mapper.countByExample(example);
    }

    @Override
    public int deleteByExample(AddressExample example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Address record) {
        return mapper.insert(record);
    }

    @Override
    public int insertSelective(Address record) {
        return mapper.insertSelective(record);
    }

    @Override
    public List<Address> selectByExample(AddressExample example) {
        return mapper.selectByExample(example);
    }

    @Override
    public Address selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(@Param("record") Address record, @Param("example") AddressExample example) {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByExample(@Param("record") Address record, @Param("example") AddressExample example) {
        return mapper.updateByExample(record, example);
    }

    @Override
    public int updateByPrimaryKeySelective(Address record) {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Address record) {
        return mapper.updateByPrimaryKey(record);
    }
}
