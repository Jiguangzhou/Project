package com.kaishengit.dao;


import com.kaishengit.pojo.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class UserDao {

    @Inject
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public User findByUsername(String username){
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.add(Restrictions.eq("username",username));
        return (User) criteria.uniqueResult();
    }

    public List<User> findAll() {
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.addOrder(Order.desc("id"));
        return criteria.list();
    }

    public void save(User user) {
        getSession().saveOrUpdate(user);
    }

    public User findById(Integer id) {
        return (User) getSession().get(User.class,id);
    }

    public void delete(Integer id) {
        getSession().delete(findById(id));
    }
}
