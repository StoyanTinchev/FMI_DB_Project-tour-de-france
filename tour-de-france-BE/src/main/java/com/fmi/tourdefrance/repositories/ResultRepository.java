package com.fmi.tourdefrance.repositories;

import com.fmi.tourdefrance.models.Result;
import com.fmi.tourdefrance.models.ResultId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result, ResultId> {

    @Query("SELECT c.registrationNumber, c.name, r.stage.number, r.stageTime, r.totalTime " +
            "FROM Cyclist c JOIN c.results r WHERE r.stage.number = ?1")
    List<Object[]> findCyclistTimesForStage(int stageNumber);

    @Query("SELECT c.registrationNumber, c.name, r.stage.number, r.totalTime " +
            "FROM Cyclist c JOIN c.results r WHERE r.stage.number = " +
            "(SELECT MAX(sr.stage.number) FROM Result sr) " +
            "ORDER BY r.totalTime")
    List<Object[]> findCyclistsSortedByTotalTimeForLastStage();

    @Query("SELECT c.registrationNumber, c.name, r.stage.number, r.totalTime " +
            "FROM Cyclist c JOIN c.results r WHERE r.stage.number = ?1 " +
            "ORDER BY r.totalTime")
    List<Object[]> findCyclistsSortedByTotalTimeForStage(int stageNumber);
}
