package com.fmi.tourdefrance.controllers;

import com.fmi.tourdefrance.DTO.CyclistDTO;
import com.fmi.tourdefrance.services.CyclistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/cyclists")
public class CyclistController {
    @Autowired
    private CyclistService cyclistService;

    @GetMapping("/team")
    public List<CyclistDTO> getCyclistsByTeam(@RequestParam String teamName) {
        return cyclistService.getCyclistsByTeam(teamName);
    }
}

