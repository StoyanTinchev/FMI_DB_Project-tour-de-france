package com.fmi.tourdefrance.controllers;


import com.fmi.tourdefrance.DTO.ResultDTO;
import com.fmi.tourdefrance.services.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/results")
public class ResultController {
    @Autowired
    private ResultService resultService;

    @GetMapping("/stage")
    public List<ResultDTO> getCyclistTimesForStage(@RequestParam int stageNumber) {
        return resultService.getCyclistTimesForStage(stageNumber);
    }

    @GetMapping("/last-stage-sorted")
    public List<ResultDTO> getCyclistsSortedByTotalTimeForLastStage() {
        return resultService.getCyclistsSortedByTotalTimeForLastStage();
    }

    @GetMapping("/sorted-stage")
    public List<ResultDTO> getCyclistsSortedByTotalTimeForStage(@RequestParam int stageNumber) {
        return resultService.getCyclistsSortedByTotalTimeForStage(stageNumber);
    }
}
