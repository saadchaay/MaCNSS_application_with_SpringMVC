package com.macnss.services;

import com.macnss.entities.Admin;
import com.macnss.repositories.AdminRepository;
import com.macnss.security.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@Transactional
public class AdminService {

    final AdminRepository adminRepository;

    @Autowired
    public AdminService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public void save(Admin admin){ adminRepository.save(admin); }

    public List<Admin> listAll(){ return (List<Admin>) adminRepository.findAll(); }

    public Admin get(Long id) { return adminRepository.findById(id).get(); }

    public void delete(Long id) { adminRepository.deleteById(id); }

    public Admin adminExists(String email, String password) {
        List<Admin> admins = listAll()
                                .stream()
                                .filter(adm -> Objects.equals(adm.getEmail(), email) && Hash.verifyPassword(password, adm.getPassword())).collect(Collectors.toList());
        return admins.size() > 0 ? admins.get(0) : null;
    }
}
