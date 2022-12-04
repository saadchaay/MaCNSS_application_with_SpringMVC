package com.macnss.controllers;

import com.macnss.repositories.DossierRepository;
import com.macnss.services.DossierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/dossiers")
public class DossierController {

    private final DossierService dos;

    @Autowired
    public DossierController(DossierService dos) {
        this.dos = dos;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getAllDossier(){
        System.out.println(dos.listAll());
        return "/index";
    }
}
