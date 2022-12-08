package com.macnss.controllers;

import com.macnss.helpers.Authenticated;
import com.macnss.helpers.Enum;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("patient")
@SessionAttributes("authPerson")
public class PatientController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Map<String, Object> model){
        Authenticated authenticated = (Authenticated) model.get("authPerson");
        if(authenticated != null){
            if(!Objects.equals(authenticated.getRole(), Enum.role.PATIENT.toString()))
                return "redirect:/"+authenticated.getRole().toLowerCase();
        }else{
            return "redirect:/login";
        }
        return "/patient/index";
    }
}
