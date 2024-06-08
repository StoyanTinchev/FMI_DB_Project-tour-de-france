package com.fmi.tourdefrance.services;

import com.fmi.tourdefrance.DTO.ResultDTO;
import com.fmi.tourdefrance.repositories.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResultService {
    @Autowired
    private ResultRepository resultRepository;

    private List<ResultDTO> mapToResultDTO(List<Object[]> results) {
        return results.stream()
                .map(row -> new ResultDTO(
                        (int) row[0],
                        (String) row[1],
                        (int) row[2],
                        (Time) row[3],
                        (Time) row[4]
                ))
                .collect(Collectors.toList());
    }

    public List<ResultDTO> getCyclistTimesForStage(int stageNumber) {
        return mapToResultDTO(resultRepository.findCyclistTimesForStage(stageNumber));
    }

    public List<ResultDTO> getCyclistsSortedByTotalTimeForLastStage() {
        return mapToResultDTO(resultRepository.findCyclistsSortedByTotalTimeForLastStage());
    }

    public List<ResultDTO> getCyclistsSortedByTotalTimeForStage(int stageNumber) {
        return mapToResultDTO(resultRepository.findCyclistsSortedByTotalTimeForStage(stageNumber));
    }
}