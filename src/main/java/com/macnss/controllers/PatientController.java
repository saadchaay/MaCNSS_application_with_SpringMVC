package com.macnss.controllers;

import com.macnss.entities.Dossier;
import com.macnss.entities.Patient;
import com.macnss.helpers.Authenticated;
import com.macnss.helpers.Enum;
import com.macnss.services.DossierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
@RequestMapping("patient")
@SessionAttributes("authPerson")
public class PatientController {

    final DossierService dos;

    public PatientController(DossierService dos) {
        this.dos = dos;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Map<String, Object> model){
        Authenticated authenticated = (Authenticated) model.get("authPerson");
        model.put("role", "patient");
        if(authenticated != null){
            if(!Objects.equals(authenticated.getRole(), Enum.role.PATIENT.toString()))
                return "redirect:/"+authenticated.getRole().toLowerCase();
        }else{
            return "redirect:/login";
        }
//        List<Dossier> dossiers = ;
        model.put("dossiers", dos.listAll()
                .stream()
                .filter(d -> d.getPatientNumber() == ((Patient)authenticated.getLoggedInUser()).getPatientNumber())
                .collect(Collectors.toList()));
        return "/patient/index";
    }
}
