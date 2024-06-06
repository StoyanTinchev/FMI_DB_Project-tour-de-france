package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.repositories.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResultService {
    @Autowired
    private ResultRepository resultRepository;

    public List<Object[]> getCyclistTimesForStage(int stageNumber) {
        return resultRepository.findCyclistTimesForStage(stageNumber);
    }

    public List<Object[]> getCyclistsSortedByTotalTimeForLastStage() {
        return resultRepository.findCyclistsSortedByTotalTimeForLastStage();
    }

    public List<Object[]> getCyclistsSortedByTotalTimeForStage(int stageNumber) {
        return resultRepository.findCyclistsSortedByTotalTimeForStage(stageNumber);
    }
}
