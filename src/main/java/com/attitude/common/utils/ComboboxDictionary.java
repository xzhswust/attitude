package com.attitude.common.utils;

/**
 * 字典数据类，定义前端combobox控件使用的Json数据对象
 */
public class ComboboxDictionary {
    private String id;
    private String text;
    private String desc;
    private String group;  //分组名称
    private boolean selected;

    public ComboboxDictionary(String id, String text){
        this.id = id;
        this.text = text;
        this.desc = "";
        this.group = null;
        this.selected = false;
    }

    public ComboboxDictionary(String id, String text, String desc){
        this.id = id;
        this.text = text;
        this.desc = desc;
        this.group = null;
        this.selected = false;
    }

    public ComboboxDictionary(String id, String text, String desc, boolean selected){
        this.id = id;
        this.text = text;
        this.desc = desc;
        this.group = null;
        this.selected = selected;
    }

    public ComboboxDictionary(String id, String text, String desc, String group){
        this.id = id;
        this.text = text;
        this.desc = desc;
        this.group = group;
        this.selected = false;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }
}
