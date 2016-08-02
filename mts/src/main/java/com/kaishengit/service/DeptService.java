package com.kaishengit.service;

import com.kaishengit.dao.DeptDao;
import com.kaishengit.pojo.Dept;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class DeptService {

    @Inject
    private DeptDao deptDao;

    public void save(Dept dept) {
        deptDao.save(dept);
    }

    public List<Dept> findAllDept() {
        return deptDao.findAll();
    }

    public void delDept(Integer id) {
        deptDao.del(id);
    }

    public Dept editDept(Integer id) {
        return deptDao.findById(id);
    }
}
