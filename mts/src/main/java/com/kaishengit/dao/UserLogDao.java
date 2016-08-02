package com.kaishengit.dao;

import com.kaishengit.pojo.UserLog;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
public class UserLogDao {

    @Inject
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public void save(UserLog userLog) {
        getSession().save(userLog);
    }

//    public List<UserLog> findByParam() {
//        Criteria criteria = getSession().createCriteria(UserLog.class);
//        return criteria.list();
//    }

//    public Long countByParam(Map<String, Object> param) {
//        Criteria criteria = getSession().createCriteria(UserLog.class);
//        criteria.setProjection(Projections.rowCount());
//        return (Long) criteria.uniqueResult();
//    }

    public List<UserLog> findUserLog() {
        Criteria criteria = getSession().createCriteria(UserLog.class);
        return criteria.list();
    }

    public List<UserLog> findById(Integer userid) {
        Criteria criteria = (Criteria) getSession().get(UserLog.class,userid);
        return criteria.list();
    }

    public void delLog(List<UserLog> userLogList) {
        getSession().delete(userLogList);
    }

}
