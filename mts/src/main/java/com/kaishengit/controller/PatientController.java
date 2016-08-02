package com.kaishengit.controller;

import com.kaishengit.pojo.Insurance;
import com.kaishengit.pojo.Patient;
import com.kaishengit.service.PatientService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/patient")
public class PatientController {

    @Inject
    private PatientService patientService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {

        List<Patient> patientList = patientService.findAllPatient();

        model.addAttribute("patientList", patientList);
        return "patient/list";
    }

    @RequestMapping(value = "/{id:\\d+}", method = RequestMethod.GET)
    public String viewPatient(@PathVariable Integer id, Model model) {

        Patient patient = patientService.findPatientById(id);

        model.addAttribute("patient", patient);
        return "patient/view";
    }


    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newPatient() {

        return "patient/new";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String newSave(Patient patient) {
        patientService.savePatient(patient,0);
        return "redirect:/patient";
    }

    @RequestMapping(value = "/getAge", method = RequestMethod.GET)
    @ResponseBody
    public String getAge(HttpServletRequest request) {
        String num = request.getParameter("num");
        String birthday = null;

        String regex = "[0-9]{17}[0-9(x|X)]";

        if (num.matches(regex)) {
            birthday = num.substring(6, 14);
        } else {
            throw new RuntimeException("身份证格式错误！");

        }

        return birthday;
    }



    @RequestMapping(value = "/{id:\\d+}/edit", method = RequestMethod.GET)
    public String editPatient(@PathVariable Integer id,Model model) {

        Patient patient = patientService.findPatientById(id);
        List<Insurance> insuranceList = patientService.findAllInsurance();
        model.addAttribute("patient",patient);
        model.addAttribute("insuranceList",insuranceList);
        return "patient/edit";
    }

    @RequestMapping(value = "/{id:\\d+}/edit", method = RequestMethod.POST)
    public String editSave(@PathVariable Integer id, Patient patient, RedirectAttributes redirectAttributes) {
        patientService.savePatient(patient,id);
        redirectAttributes.addFlashAttribute("message", "修改成功!");
        return "redirect:/patient/"+id;
    }



    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public Patient getPatient(HttpServletRequest request) {

        String str = request.getParameter("str");

        Patient patient = patientService.findByStr(str);

        return patient;
    }
}
