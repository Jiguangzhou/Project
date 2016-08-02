package com.kaishengit.service;

import com.kaishengit.dao.DiseaseDao;
import com.kaishengit.pojo.Disease;
import com.kaishengit.util.Page;
import com.kaishengit.util.SearchParam;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.inject.Named;
import java.util.List;

@Named
@Transactional
public class DiseaseService {

    @Inject
    private DiseaseDao diseaseDao;



    public List<Disease> findAllDisease() {
        return diseaseDao.findAll();
    }


    public void save(Disease disease) {
        diseaseDao.save(disease);
    }

    public Page<Disease> findByPage(Integer pageNo, List<SearchParam> searchParamList) {
        return diseaseDao.findByPageNo(pageNo,5,searchParamList);
    }
}
