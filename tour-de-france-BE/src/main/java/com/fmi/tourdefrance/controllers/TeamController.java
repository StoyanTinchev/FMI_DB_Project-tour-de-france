package com.fmi.tourdefrance.controllers;

import com.fmi.tourdefrance.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    @GetMapping
    public Object getTeamByCyclist(@RequestParam int cyclistRegistrationNumber) {
        return teamService.getTeamByCyclist(cyclistRegistrationNumber);
    }
}
