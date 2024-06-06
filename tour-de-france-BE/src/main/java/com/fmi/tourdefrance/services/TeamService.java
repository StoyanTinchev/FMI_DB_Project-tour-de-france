package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.repositories.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;

    public Object getTeamByCyclist(int cyclistRegistrationNumber) {
        return teamRepository.findTeamByCyclist(cyclistRegistrationNumber);
    }
}
