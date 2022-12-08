package com.macnss.controllers;

import com.macnss.entities.*;
import com.macnss.helpers.Authenticated;
import com.macnss.helpers.Enum;
import com.macnss.helpers.JsonManagement;
import com.macnss.services.ConsultationService;
import com.macnss.services.DossierService;
import com.macnss.services.MedicService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

@Controller
@RequestMapping("/agent")
@SessionAttributes("authPerson")
public class DossierController {

    private final DossierService dos;
    private final ConsultationService cons;
    private final MedicService medicService;

    @Autowired
    public DossierController(DossierService dos, ConsultationService cons, MedicService medicService) {
        this.dos = dos;
        this.cons = cons;
        this.medicService = medicService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getAllDossier(Map<String, Object> model, @ModelAttribute("error") String error){
        Authenticated authenticated = (Authenticated) model.get("authPerson");
        if(authenticated != null){
            if(!Objects.equals(authenticated.getRole(), Enum.role.AGENT.toString()))
                return "redirect:/"+authenticated.getRole().toLowerCase();
        }else{
            return "redirect:/login";
        }
        model.put("error", error);
        return "/agent/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addNewDossier(Model model,
                                @RequestParam("consultation") String consPrice,
                                @RequestParam("patient") String patientNumber,
                                HttpServletRequest req)
    {
        Dossier dossier = new Dossier();
        Consultation consultation = new Consultation();
        List<Medication> medications = new ArrayList<>();
        List<Document> docs = new ArrayList<>();
        dossier.setNumber((long)Math.floor(Math.random()*(999999-99999+1)+99999));
        dossier.setAppliedDate(Date.from((LocalDate.now()).atStartOfDay(ZoneId.systemDefault()).toInstant()));
        dossier.setStatus(Enum.status.PENDING.toString());
        dossier.setPatientNumber(Long.parseLong(patientNumber));
        dossier.setAmount(Double.parseDouble(consPrice));
        int medic_number = Integer.parseInt(req.getParameter("medic_number"));
        for(int i=0; i < medic_number; i++){
            Medication med = new Medication();
            String num_med = req.getParameter("medic"+(i+1));
            Double price_rem = JsonManagement.readFile(num_med);
            med.setNumber(Long.parseLong(num_med));
            med.setPrice(price_rem);
            dossier.setAmount(dossier.getAmount()+price_rem);
            medications.add(med);
        }
        if(dos.save(dossier) != null){
            consultation.setPrice(Double.parseDouble(consPrice));
            consultation.setDossierId(dossier.getId());
            cons.save(consultation);
            for (int i=0; i<medic_number; i++){
                Medication med = medications.get(i);
                med.setDossierId(dossier.getId());
                medicService.save(med);
            }
        }
        System.out.println("consultation: "+ consPrice);
        System.out.println("patient number: "+ patientNumber);
        return "redirect:/agent";
    }

}
