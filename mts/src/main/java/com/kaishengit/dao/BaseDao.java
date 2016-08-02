package com.kaishengit.dao;

import com.kaishengit.util.Page;
import com.kaishengit.util.SearchParam;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.hibernate.transform.ResultTransformer;


import javax.inject.Inject;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseDao<T, PK extends Serializable> {
    @Inject
    private SessionFactory sessionFactory;

    private Class<?> entityClass;//如果将被建模的类未知，则使用 Class<?>。
    //当父类被动创建出来时，父类中的this表示子类，getClass()表示此对象运行时类的 Class 对象
    //getGenericSuperclass()返回表示此 Class 所表示的实体（类、接口、基本类型或 void）的直接超类的 Type
    public BaseDao() {
        ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
        //getActualTypeArguments()返回表示此类型实际类型参数的 Type 对象的数组。
        entityClass = (Class<?>) parameterizedType.getActualTypeArguments()[0];
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 通过 id 查找
     */
    public T findById(PK id) {

        return (T) getSession().get(entityClass, id);
    }

    /**
     * 通过 id 删除
     */
    public void deleteById(PK id) {

        getSession().delete(findById(id));
    }

    /**
     * 通过传入对象删除
     */
    public void delete(T entity) {

        getSession().delete(entity);
    }

    /**
     * 保存对象
     */
    public void save(T entity) {

        getSession().saveOrUpdate(entity);
    }

    /**
     * 查找所有
     */
    public List<T> findAll() {

        Criteria criteria = getSession().createCriteria(entityClass);
        criteria.addOrder(Order.desc("id"));
        return criteria.list();
    }


    /**
     * 获取总记录数（不加参数的）
     */
    public Long count() {

        Criteria criteria = getSession().createCriteria(entityClass);
        criteria.setProjection(Projections.rowCount());
        return (Long) criteria.uniqueResult();
    }


    public Long count(Criteria criteria) {

        ResultTransformer resultTransformer = criteria.ROOT_ENTITY;

        criteria.setProjection(Projections.rowCount());
        Long count = (Long) criteria.uniqueResult();

        criteria.setProjection(null);
        criteria.setResultTransformer(resultTransformer);

        return count;
    }

    /**
     * 分页查询数据
     */
    public Page<T> findByPageNo(Integer pageNo, Integer pageSize) {

        Integer totalSize = count().intValue();//获取总记录数
        Page<T> page = new Page<>(pageNo, pageSize, totalSize);

        Criteria criteria = getSession().createCriteria(entityClass);
        criteria.setFirstResult(page.getStart());//开始
        criteria.setMaxResults(page.getPageSize());//每页显示几条

        List<T> pageList = criteria.list();
        page.setItems(pageList);

        return page;

    }

    public Page<T> findByPageNo(Integer pageNo, Integer pageSize, List<SearchParam> searchParamList) {

        //将获得的参数集合，添加到查询对象Criteria里面
        Criteria criteria = buildCriteriaBySearchParam(searchParamList);

        Integer totalSize = count(criteria).intValue();

        Page<T> page = new Page<>(pageNo, pageSize, totalSize);
        criteria.setFirstResult(page.getStart());
        criteria.setMaxResults(page.getPageSize());

        List<T> result = criteria.list();
        page.setItems(result);


        return page;
    }

    /**
     * 建立查询对象
     * @param searchParamList
     * @return
     */
    private Criteria buildCriteriaBySearchParam(List<SearchParam> searchParamList) {

        Criteria criteria = getSession().createCriteria(entityClass);

        for (SearchParam searchParam : searchParamList) {
            String propertyName = searchParam.getProtertyName();
            Object value = searchParam.getValue();
            String type = searchParam.getType();

            if (propertyName.contains("_or_")) {
                String[] nameArray = propertyName.split("_or_");

                Disjunction disjunction = Restrictions.disjunction(); //关系or
                for (String name : nameArray) {
                    Criterion c = buildCriterion(value,type,name);
                    disjunction.add(c);
                }

                criteria.add(disjunction);
            } else {
                Criterion criterion = buildCriterion(value, type, propertyName);
                criteria.add(criterion);
            }
        }

        return criteria;

    }


    /**
     * 建立参数对象
     * @param value
     * @param type
     * @param propertyName
     * @return
     */
    private Criterion buildCriterion(Object value, String type, String propertyName) {
        if ("eq".equalsIgnoreCase(type)) {
            return Restrictions.eq(propertyName, value);
        } else if ("like".equalsIgnoreCase(type)) {
            return Restrictions.like(propertyName, value.toString(), MatchMode.ANYWHERE);
        } else if ("ge".equalsIgnoreCase(type)) {
            return Restrictions.ge(propertyName, value);
        } else if ("gt".equalsIgnoreCase(type)) {
            return Restrictions.gt(propertyName, value);
        } else if ("le".equalsIgnoreCase(type)) {
            return Restrictions.le(propertyName, value);
        } else if ("lt".equalsIgnoreCase(type)) {
            return Restrictions.lt(propertyName, value);
        }
        return null;
    }
}
