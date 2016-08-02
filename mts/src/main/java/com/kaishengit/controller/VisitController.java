package com.kaishengit.controller;


import com.kaishengit.pojo.Patient;
import com.kaishengit.service.PatientService;
import com.kaishengit.service.VisitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/visit")
public class VisitController {

    @Inject
    private VisitService visitService;
    @Inject
    private PatientService patientService;

    @RequestMapping(method = RequestMethod.GET)
    public String list() {

        return "visit/list";
    }

    @RequestMapping(value = "/{id:\\d+}", method = RequestMethod.GET)
    public String visit(@PathVariable Integer id, Model model) {

        Patient patient = patientService.findPatientById(id);
        model.addAttribute("patient",patient);
        return "visit/visit";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newVisit() {

        return "visit/new";
    }
}
