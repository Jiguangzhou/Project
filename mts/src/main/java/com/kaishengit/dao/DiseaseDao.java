package com.kaishengit.dao;

import com.kaishengit.pojo.Disease;
import com.kaishengit.util.Page;
import com.kaishengit.util.SearchParam;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.ResultTransformer;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class DiseaseDao {

    @Inject
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }



    public List<Disease> findAll() {
        Criteria criteria = getSession().createCriteria(Disease.class);
        criteria.addOrder(Order.asc("id"));
        return criteria.list();
    }




    public Long count(){
        Criteria criteria = getSession().createCriteria(Disease.class);
        criteria.setProjection(Projections.rowCount());
        return (Long) criteria.uniqueResult();
    }

    public Long count(Criteria criteria){
        ResultTransformer resultTransformer = criteria.ROOT_ENTITY;
        criteria.setProjection(Projections.rowCount());
        Long count  = (Long) criteria.uniqueResult();

        criteria.setProjection(null);
        criteria.setResultTransformer(resultTransformer);

        return count;
    }




    public Page<Disease> findByPage(Integer pageNo, Integer pageSize){
        Integer totaSize = count().intValue();
        Page<Disease> page = new Page<>(pageNo,pageSize,totaSize);
        Criteria criteria = getSession().createCriteria(Disease.class);

        criteria.setFirstResult(page.getStart());
        criteria.setMaxResults(page.getPageSize());

        List<Disease> result = criteria.list();
        page.setItems(result);
        return page;
    }

    public Page<Disease> findByPageNo(Integer pageNo, Integer pageSize, List<SearchParam> searchParamList) {
        Criteria criteria = buildCriteriaBySearchParam(searchParamList);
        Integer totalSize = count(criteria).intValue();
        Page<Disease> page = new Page<>(pageNo,pageSize,totalSize);
        criteria.setFirstResult(page.getStart());
        criteria.setMaxResults(page.getPageSize());
        List<Disease> result = criteria.list();
        page.setItems(result);
        return page;
    }

    private Criteria buildCriteriaBySearchParam(List<SearchParam> searchParamList) {
        Criteria criteria = getSession().createCriteria(Disease.class);

        for (SearchParam searchParam:searchParamList){
            String propertyName = searchParam.getProtertyName();
            Object value = searchParam.getValue();
            String type = searchParam.getType();

            if (propertyName.contains("_or_")){
                String[] nameArray = propertyName.split("_or_");

                Disjunction disjunction = Restrictions.disjunction();
                for (String name:nameArray){
                    Criterion criterion = buildCondition(name,value,type);
                    disjunction.add(criterion);
                }
                criteria.add(disjunction);
            }else {
                Criterion criterion = buildCondition(propertyName,value,type);
                criteria.add(criterion);
            }

        }
        return criteria;
    }

    private Criterion buildCondition(String propertyName, Object value, String type) {
        if ("eq".equalsIgnoreCase(type)){
            return Restrictions.eq(propertyName,value);
        }else if("like".equalsIgnoreCase(type)){
            return Restrictions.like(propertyName,value.toString(), MatchMode.ANYWHERE);
        }else if ("ge".equalsIgnoreCase(type)){
            return Restrictions.ge(propertyName,value);
        }else if ("gt".equalsIgnoreCase(type)){
            return Restrictions.gt(propertyName,value);
        }else if ("lt".equalsIgnoreCase(type)){
            return Restrictions.lt(propertyName,value);
        }else if ("le".equalsIgnoreCase(type)){
            return Restrictions.le(propertyName,value);
        }
        return null;
    }


    public void save(Disease disease) {
        getSession().saveOrUpdate(disease);
    }
}
