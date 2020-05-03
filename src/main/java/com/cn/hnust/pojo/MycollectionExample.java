package com.cn.hnust.pojo;

import java.util.ArrayList;
import java.util.List;

public class MycollectionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MycollectionExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("Id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("Id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("Id =", value, "id");
            return (Criteria) this;
        }
        
        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("userId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("Id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("Id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("Id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("Id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("Id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("Id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("Id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("Id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("Id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andMovieidIsNull() {
            addCriterion("movieId is null");
            return (Criteria) this;
        }

        public Criteria andMovieidIsNotNull() {
            addCriterion("movieId is not null");
            return (Criteria) this;
        }

        public Criteria andMovieidEqualTo(Integer value) {
            addCriterion("movieId =", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidNotEqualTo(Integer value) {
            addCriterion("movieId <>", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidGreaterThan(Integer value) {
            addCriterion("movieId >", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidGreaterThanOrEqualTo(Integer value) {
            addCriterion("movieId >=", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidLessThan(Integer value) {
            addCriterion("movieId <", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidLessThanOrEqualTo(Integer value) {
            addCriterion("movieId <=", value, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidIn(List<Integer> values) {
            addCriterion("movieId in", values, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidNotIn(List<Integer> values) {
            addCriterion("movieId not in", values, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidBetween(Integer value1, Integer value2) {
            addCriterion("movieId between", value1, value2, "movieid");
            return (Criteria) this;
        }

        public Criteria andMovieidNotBetween(Integer value1, Integer value2) {
            addCriterion("movieId not between", value1, value2, "movieid");
            return (Criteria) this;
        }

        public Criteria andDirectorIsNull() {
            addCriterion("director is null");
            return (Criteria) this;
        }

        public Criteria andDirectorIsNotNull() {
            addCriterion("director is not null");
            return (Criteria) this;
        }

        public Criteria andDirectorEqualTo(String value) {
            addCriterion("director =", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorNotEqualTo(String value) {
            addCriterion("director <>", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorGreaterThan(String value) {
            addCriterion("director >", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorGreaterThanOrEqualTo(String value) {
            addCriterion("director >=", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorLessThan(String value) {
            addCriterion("director <", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorLessThanOrEqualTo(String value) {
            addCriterion("director <=", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorLike(String value) {
            addCriterion("director like", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorNotLike(String value) {
            addCriterion("director not like", value, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorIn(List<String> values) {
            addCriterion("director in", values, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorNotIn(List<String> values) {
            addCriterion("director not in", values, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorBetween(String value1, String value2) {
            addCriterion("director between", value1, value2, "director");
            return (Criteria) this;
        }

        public Criteria andDirectorNotBetween(String value1, String value2) {
            addCriterion("director not between", value1, value2, "director");
            return (Criteria) this;
        }

        public Criteria andMainact1IsNull() {
            addCriterion("mainAct1 is null");
            return (Criteria) this;
        }

        public Criteria andMainact1IsNotNull() {
            addCriterion("mainAct1 is not null");
            return (Criteria) this;
        }

        public Criteria andMainact1EqualTo(String value) {
            addCriterion("mainAct1 =", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1NotEqualTo(String value) {
            addCriterion("mainAct1 <>", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1GreaterThan(String value) {
            addCriterion("mainAct1 >", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1GreaterThanOrEqualTo(String value) {
            addCriterion("mainAct1 >=", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1LessThan(String value) {
            addCriterion("mainAct1 <", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1LessThanOrEqualTo(String value) {
            addCriterion("mainAct1 <=", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1Like(String value) {
            addCriterion("mainAct1 like", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1NotLike(String value) {
            addCriterion("mainAct1 not like", value, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1In(List<String> values) {
            addCriterion("mainAct1 in", values, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1NotIn(List<String> values) {
            addCriterion("mainAct1 not in", values, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1Between(String value1, String value2) {
            addCriterion("mainAct1 between", value1, value2, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact1NotBetween(String value1, String value2) {
            addCriterion("mainAct1 not between", value1, value2, "mainact1");
            return (Criteria) this;
        }

        public Criteria andMainact2IsNull() {
            addCriterion("mainAct2 is null");
            return (Criteria) this;
        }

        public Criteria andMainact2IsNotNull() {
            addCriterion("mainAct2 is not null");
            return (Criteria) this;
        }

        public Criteria andMainact2EqualTo(String value) {
            addCriterion("mainAct2 =", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2NotEqualTo(String value) {
            addCriterion("mainAct2 <>", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2GreaterThan(String value) {
            addCriterion("mainAct2 >", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2GreaterThanOrEqualTo(String value) {
            addCriterion("mainAct2 >=", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2LessThan(String value) {
            addCriterion("mainAct2 <", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2LessThanOrEqualTo(String value) {
            addCriterion("mainAct2 <=", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2Like(String value) {
            addCriterion("mainAct2 like", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2NotLike(String value) {
            addCriterion("mainAct2 not like", value, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2In(List<String> values) {
            addCriterion("mainAct2 in", values, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2NotIn(List<String> values) {
            addCriterion("mainAct2 not in", values, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2Between(String value1, String value2) {
            addCriterion("mainAct2 between", value1, value2, "mainact2");
            return (Criteria) this;
        }

        public Criteria andMainact2NotBetween(String value1, String value2) {
            addCriterion("mainAct2 not between", value1, value2, "mainact2");
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