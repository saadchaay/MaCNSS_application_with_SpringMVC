package com.macnss.services;

import com.macnss.entities.Medication;
import com.macnss.repositories.MedicRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class MedicService {

    MedicRepository medicRepository;

    @Autowired
    public MedicService(MedicRepository medicRepository) {
        this.medicRepository = medicRepository;
    }

    public Medication save(Medication medication){
        return medicRepository.save(medication);
    }

    public List<Medication> listAll() {
        return medicRepository.findAll();
    }

    public Medication get(Long id) {
        return medicRepository.findById(id).get();
    }

    public void delete(Long id) {
        medicRepository.deleteById(id);
    }
}
