package com.attitude.dal.mybatis.entity;

import java.util.ArrayList;
import java.util.List;

public class DicTypeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DicTypeExample() {
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

        public Criteria andDicTypeNameIsNull() {
            addCriterion("Dic_Type_Name is null");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameIsNotNull() {
            addCriterion("Dic_Type_Name is not null");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameEqualTo(String value) {
            addCriterion("Dic_Type_Name =", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameNotEqualTo(String value) {
            addCriterion("Dic_Type_Name <>", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameGreaterThan(String value) {
            addCriterion("Dic_Type_Name >", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameGreaterThanOrEqualTo(String value) {
            addCriterion("Dic_Type_Name >=", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameLessThan(String value) {
            addCriterion("Dic_Type_Name <", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameLessThanOrEqualTo(String value) {
            addCriterion("Dic_Type_Name <=", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameLike(String value) {
            addCriterion("Dic_Type_Name like", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameNotLike(String value) {
            addCriterion("Dic_Type_Name not like", value, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameIn(List<String> values) {
            addCriterion("Dic_Type_Name in", values, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameNotIn(List<String> values) {
            addCriterion("Dic_Type_Name not in", values, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameBetween(String value1, String value2) {
            addCriterion("Dic_Type_Name between", value1, value2, "dicTypeName");
            return (Criteria) this;
        }

        public Criteria andDicTypeNameNotBetween(String value1, String value2) {
            addCriterion("Dic_Type_Name not between", value1, value2, "dicTypeName");
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