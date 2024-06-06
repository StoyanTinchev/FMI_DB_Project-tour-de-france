package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.repositories.CyclistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CyclistService {
    @Autowired
    private CyclistRepository cyclistRepository;

    public List<Object[]> getCyclistsByTeam(String teamName) {
        return cyclistRepository.findCyclistsByTeam(teamName);
    }
}
