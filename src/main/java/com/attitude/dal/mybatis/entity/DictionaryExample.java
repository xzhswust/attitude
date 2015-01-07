package com.attitude.dal.mybatis.entity;

import java.util.ArrayList;
import java.util.List;

public class DictionaryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DictionaryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDicCodeIsNull() {
            addCriterion("Dic_Code is null");
            return (Criteria) this;
        }

        public Criteria andDicCodeIsNotNull() {
            addCriterion("Dic_Code is not null");
            return (Criteria) this;
        }

        public Criteria andDicCodeEqualTo(String value) {
            addCriterion("Dic_Code =", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeNotEqualTo(String value) {
            addCriterion("Dic_Code <>", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeGreaterThan(String value) {
            addCriterion("Dic_Code >", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeGreaterThanOrEqualTo(String value) {
            addCriterion("Dic_Code >=", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeLessThan(String value) {
            addCriterion("Dic_Code <", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeLessThanOrEqualTo(String value) {
            addCriterion("Dic_Code <=", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeLike(String value) {
            addCriterion("Dic_Code like", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeNotLike(String value) {
            addCriterion("Dic_Code not like", value, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeIn(List<String> values) {
            addCriterion("Dic_Code in", values, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeNotIn(List<String> values) {
            addCriterion("Dic_Code not in", values, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeBetween(String value1, String value2) {
            addCriterion("Dic_Code between", value1, value2, "dicCode");
            return (Criteria) this;
        }

        public Criteria andDicCodeNotBetween(String value1, String value2) {
            addCriterion("Dic_Code not between", value1, value2, "dicCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeIsNull() {
            addCriterion("Up_Code is null");
            return (Criteria) this;
        }

        public Criteria andUpCodeIsNotNull() {
            addCriterion("Up_Code is not null");
            return (Criteria) this;
        }

        public Criteria andUpCodeEqualTo(String value) {
            addCriterion("Up_Code =", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeNotEqualTo(String value) {
            addCriterion("Up_Code <>", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeGreaterThan(String value) {
            addCriterion("Up_Code >", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeGreaterThanOrEqualTo(String value) {
            addCriterion("Up_Code >=", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeLessThan(String value) {
            addCriterion("Up_Code <", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeLessThanOrEqualTo(String value) {
            addCriterion("Up_Code <=", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeLike(String value) {
            addCriterion("Up_Code like", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeNotLike(String value) {
            addCriterion("Up_Code not like", value, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeIn(List<String> values) {
            addCriterion("Up_Code in", values, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeNotIn(List<String> values) {
            addCriterion("Up_Code not in", values, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeBetween(String value1, String value2) {
            addCriterion("Up_Code between", value1, value2, "upCode");
            return (Criteria) this;
        }

        public Criteria andUpCodeNotBetween(String value1, String value2) {
            addCriterion("Up_Code not between", value1, value2, "upCode");
            return (Criteria) this;
        }

        public Criteria andDicNameIsNull() {
            addCriterion("Dic_Name is null");
            return (Criteria) this;
        }

        public Criteria andDicNameIsNotNull() {
            addCriterion("Dic_Name is not null");
            return (Criteria) this;
        }

        public Criteria andDicNameEqualTo(String value) {
            addCriterion("Dic_Name =", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameNotEqualTo(String value) {
            addCriterion("Dic_Name <>", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameGreaterThan(String value) {
            addCriterion("Dic_Name >", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameGreaterThanOrEqualTo(String value) {
            addCriterion("Dic_Name >=", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameLessThan(String value) {
            addCriterion("Dic_Name <", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameLessThanOrEqualTo(String value) {
            addCriterion("Dic_Name <=", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameLike(String value) {
            addCriterion("Dic_Name like", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameNotLike(String value) {
            addCriterion("Dic_Name not like", value, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameIn(List<String> values) {
            addCriterion("Dic_Name in", values, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameNotIn(List<String> values) {
            addCriterion("Dic_Name not in", values, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameBetween(String value1, String value2) {
            addCriterion("Dic_Name between", value1, value2, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicNameNotBetween(String value1, String value2) {
            addCriterion("Dic_Name not between", value1, value2, "dicName");
            return (Criteria) this;
        }

        public Criteria andDicLevelIsNull() {
            addCriterion("Dic_Level is null");
            return (Criteria) this;
        }

        public Criteria andDicLevelIsNotNull() {
            addCriterion("Dic_Level is not null");
            return (Criteria) this;
        }

        public Criteria andDicLevelEqualTo(Integer value) {
            addCriterion("Dic_Level =", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelNotEqualTo(Integer value) {
            addCriterion("Dic_Level <>", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelGreaterThan(Integer value) {
            addCriterion("Dic_Level >", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelGreaterThanOrEqualTo(Integer value) {
            addCriterion("Dic_Level >=", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelLessThan(Integer value) {
            addCriterion("Dic_Level <", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelLessThanOrEqualTo(Integer value) {
            addCriterion("Dic_Level <=", value, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelIn(List<Integer> values) {
            addCriterion("Dic_Level in", values, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelNotIn(List<Integer> values) {
            addCriterion("Dic_Level not in", values, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelBetween(Integer value1, Integer value2) {
            addCriterion("Dic_Level between", value1, value2, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicLevelNotBetween(Integer value1, Integer value2) {
            addCriterion("Dic_Level not between", value1, value2, "dicLevel");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdIsNull() {
            addCriterion("Dic_Type_ID is null");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdIsNotNull() {
            addCriterion("Dic_Type_ID is not null");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdEqualTo(Integer value) {
            addCriterion("Dic_Type_ID =", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdNotEqualTo(Integer value) {
            addCriterion("Dic_Type_ID <>", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdGreaterThan(Integer value) {
            addCriterion("Dic_Type_ID >", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("Dic_Type_ID >=", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdLessThan(Integer value) {
            addCriterion("Dic_Type_ID <", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("Dic_Type_ID <=", value, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdIn(List<Integer> values) {
            addCriterion("Dic_Type_ID in", values, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdNotIn(List<Integer> values) {
            addCriterion("Dic_Type_ID not in", values, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("Dic_Type_ID between", value1, value2, "dicTypeId");
            return (Criteria) this;
        }

        public Criteria andDicTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("Dic_Type_ID not between", value1, value2, "dicTypeId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}