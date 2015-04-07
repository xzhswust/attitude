package com.attitude.common.utils;


import com.attitude.dal.mybatis.entity.Dictionary;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by zh.xu on 14-06-17.
 * 字典对象转换类
 */
public class DictionaryConvert {
    public static ComboboxDictionary convertToComboboxDictionary(Dictionary dictionary){
        if (null == dictionary){
            return null;
        }

        ComboboxDictionary comoboDic = new ComboboxDictionary(dictionary.getDicCode(), dictionary.getDicName());
        return comoboDic;
    }

    /**
     * 将字典数据转化为可以用户easyui combobox显示的数据对象
     * @param dictionarys
     * @return 返回可供easyui combobox显示的数据对象列表
     */
    public static List<ComboboxDictionary> convertToComboboxDictionarys(List<Dictionary> dictionarys){
        if (null == dictionarys){
            return null;
        }

        List<ComboboxDictionary> comboboxDics = new LinkedList<ComboboxDictionary>();
        for(Dictionary dictionary : dictionarys){
            comboboxDics.add(convertToComboboxDictionary(dictionary));
        }

        return comboboxDics;
    }

    /**
     * 将字典数据转化为可以用户easyui combobox显示的数据对象
     * @param dictionarys
     * @param selectedFirst 是否默认第一条数据为选中状态
     * @return 返回可供easyui combobox显示的数据对象列表
     */
    public static List<ComboboxDictionary> convertToComboboxDictionarys(List<Dictionary> dictionarys, boolean selectedFirst){

        List<ComboboxDictionary> comboboxDics = convertToComboboxDictionarys(dictionarys);
        if (selectedFirst && comboboxDics.size() > 0){
            comboboxDics.get(0).setSelected(true);
        }

        return comboboxDics;
    }
}
