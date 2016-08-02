package com.kaishengit.dao;

import com.kaishengit.pojo.Patient;
import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import javax.inject.Named;

@Named
public class PatientDao extends BaseDao<Patient,Integer> {

    public Patient findByStr(String str) {

        Criteria criteria = getSession().createCriteria(Patient.class);
        Disjunction disjunction = Restrictions.disjunction();
        disjunction.add(Restrictions.like("name", str,MatchMode.ANYWHERE));
        disjunction.add(Restrictions.like("pinyin",str,MatchMode.ANYWHERE));
        criteria.add(disjunction);

        return (Patient) criteria.uniqueResult();
    }
}


