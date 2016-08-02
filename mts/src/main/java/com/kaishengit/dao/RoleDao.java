package com.kaishengit.dao;

import com.kaishengit.pojo.Role;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class RoleDao {

    @Inject
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public List<Role> findAll() {
        Criteria criteria = getSession().createCriteria(Role.class);
        return criteria.list();
    }

    public Role findById(Integer roleid) {
        return (Role) getSession().get(Role.class,roleid);
    }
}
