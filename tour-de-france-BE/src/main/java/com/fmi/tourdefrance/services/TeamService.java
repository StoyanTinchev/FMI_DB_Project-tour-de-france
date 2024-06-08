package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.DTO.TeamDTO;
import com.fmi.tourdefrance.repositories.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;

    public TeamDTO getTeamByCyclist(int cyclistRegistrationNumber) {
        return teamRepository.findTeamByCyclist(cyclistRegistrationNumber);
    }
}
