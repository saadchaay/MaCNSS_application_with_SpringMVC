package com.macnss.services;

import com.macnss.entities.Admin;
import com.macnss.entities.Agent;
import com.macnss.repositories.AgentRepository;
import com.macnss.security.Hash;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@Transactional
public class AgentService {

    AgentRepository agentRepository;

    @Autowired
    public AgentService(AgentRepository agentRepository) {
        this.agentRepository = agentRepository;
    }

    public void save(Agent agent){
        agentRepository.save(agent);
    }

    public List<Agent> listAll() {
        return (List<Agent>) agentRepository.findAll();
    }

    public Agent get(Long id) {
        return agentRepository.findById(id).get();
    }

    public void delete(Long id) {
        agentRepository.deleteById(id);
    }

    public Agent agentExists(String email, String password) {
        List<Agent> agents = listAll()
                .stream()
                .filter( agt -> Objects.equals(agt.getEmail(), email) && Hash.verifyPassword(password, agt.getPassword())).collect(Collectors.toList());
        return agents.size() > 0 ? agents.get(0) : null;
    }
}
