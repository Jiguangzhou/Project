package com.kaishengit.dao;

import com.kaishengit.pojo.Dept;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class DeptDao {

    @Inject
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public List<Dept> findAll() {
        Criteria criteria = getSession().createCriteria(Dept.class);
        criteria.addOrder(Order.asc("id"));
        return criteria.list();
    }

    public void save(Dept dept) {
        getSession().saveOrUpdate(dept);
    }

    public Dept findById(Integer id){
        return (Dept) getSession().get(Dept.class,id);
    }

    public void del(Integer id) {
        getSession().delete(findById(id));
    }
}
