package com.attitude.dal.mybatis.dao.service;

import com.attitude.dal.mybatis.dao.DictionaryMapper;
import com.attitude.dal.mybatis.dao.ProductMapper;
import com.attitude.dal.mybatis.entity.Dictionary;
import com.attitude.dal.mybatis.entity.DictionaryExample;
import com.attitude.dal.mybatis.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Smomo on 2015/2/4.
 */
@Service
public class StaticService {
    @Autowired
    private DictionaryMapper dicMapper;
    @Autowired
    private ProductMapper productMapper;

    /**
     * 获取字典名称
     * @param dictype 字典类型
     * @param dicCode 字典编码
     * @return 字典名
     */
    public String GetDicName(int dictype, String dicCode) {
        DictionaryExample example = new DictionaryExample();
        example.createCriteria().andDicCodeEqualTo(dicCode).andDicTypeIdEqualTo(Integer.valueOf(dictype));
        List<Dictionary> dicList = dicMapper.selectByExample(example);
        if (dicList != null && dicList.size() > 0) {
            return dicList.get(0).getDicName();
        } else {
            return dicCode;
        }
    }

    public Product GetProduct(int pid){
        return productMapper.selectByPrimaryKey(pid);
    }
}
