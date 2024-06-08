package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.DTO.CyclistDTO;
import com.fmi.tourdefrance.repositories.CyclistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CyclistService {
    @Autowired
    private CyclistRepository cyclistRepository;

    public List<CyclistDTO> getCyclistsByTeam(String teamName) {
        return cyclistRepository.findCyclistsByTeam(teamName)
                .stream()
                .map(row -> new CyclistDTO(
                        (String) row[0],
                        (int) row[1],
                        (String) row[2]
                ))
                .collect(Collectors.toList());
    }
}
