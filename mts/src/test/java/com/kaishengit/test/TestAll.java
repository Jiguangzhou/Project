package com.kaishengit.test;

import com.kaishengit.pojo.Insurance;
import com.kaishengit.pojo.Patient;
import com.kaishengit.service.PatientService;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestAll {

    @Inject
    private PatientService patientService;
    @Inject
    private SessionFactory sessionFactory;

    @Test
    public void testFindAllIn() {
        List<Insurance> insuranceList = patientService.findAllInsurance();

        for (Insurance insurance : insuranceList) {
            System.out.println(insurance);
            DateTime.now().toString("yyyy-MM-dd HH-ss-mm");
        }
    }


    @Test
    public void getP() {
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        Criteria criteria = session.createCriteria(Patient.class);
        Disjunction disjunction = Restrictions.disjunction();

        disjunction.add(Restrictions.like("name", "lin", MatchMode.ANYWHERE));
        disjunction.add(Restrictions.like("pinyin","lin",MatchMode.ANYWHERE));
        criteria.add(disjunction);


        System.out.println((Patient) criteria.uniqueResult());

        session.getTransaction().commit();
    }



}
