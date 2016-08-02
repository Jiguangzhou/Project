package com.kaishengit.service;


import com.kaishengit.dao.InsuranceDao;
import com.kaishengit.dao.PatientDao;
import com.kaishengit.pojo.Insurance;
import com.kaishengit.pojo.Patient;
import com.kaishengit.util.Strings;
import org.joda.time.DateTime;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class PatientService {

    @Inject
    private PatientDao patientDao;
    @Inject
    private InsuranceDao insuranceDao;

    public List<Patient> findAllPatient() {
        return patientDao.findAll();
    }


    public Patient findPatientById(Integer id) {
        return patientDao.findById(id);
    }

    public void savePatient(Patient patient, Integer num) {

        patient.setStatus("初诊");

        patient.setPinyin(Strings.pinyin(patient.getName()));
        patientDao.save(patient);
    }

    public List<Insurance> findAllInsurance() {
        return insuranceDao.findAll();
    }

    public Patient findByStr(String str) {
        return patientDao.findByStr(str);
    }
}
