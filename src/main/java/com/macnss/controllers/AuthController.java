package com.macnss.controllers;

import com.macnss.entities.Admin;
import com.macnss.helpers.Authenticated;
import com.macnss.helpers.Enum;
import com.macnss.security.Hash;
import com.macnss.services.AdminService;
import com.macnss.services.AgentService;
import com.macnss.services.PatientService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {

    final AdminService adminService;
    final AgentService agentService;
    final PatientService patientService;

    @Autowired
    public AuthController(AdminService adminService, AgentService agentService, PatientService patientService) {
        this.adminService = adminService;
        this.agentService = agentService;
        this.patientService = patientService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(){
        return "auth/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView auth(HttpServletRequest request, ModelMap modelMap){
        Authenticated auth = new Authenticated();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = Enum.role.ADMIN.toString();
        modelMap.addAttribute("error", "Failed authentication, try again!");
        switch (role){
            case "ADMIN" -> {
                Admin admin = adminService.adminExists(email, password);
                if(admin != null){
                    auth.setLoggedInUser(admin);
                    auth.setRole(Enum.role.ADMIN.toString());
                    return new ModelAndView("redirect:/dossiers/");
                }else{
                    return new ModelAndView("redirect:/login", modelMap);
                }
            }
//            case "AGENT" -> {
//                return agentService.agentExists(email, password) != null ?  new ModelAndView("/"): new ModelAndView("/login");
//            }
//            case "PATIENT" -> {
//                return patientService.patientExists(email, password) != null ? new ModelAndView("/") : new ModelAndView("/login");
//            }
        }
        System.out.println("email: "+ request.getParameter("email"));
        System.out.println("password : "+ request.getParameter("password"));
//        return "index";
        return new ModelAndView("redirect:/");
    }
}
