package com.fmi.tourdefrance.repositories;

import com.fmi.tourdefrance.models.Cyclist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CyclistRepository extends JpaRepository<Cyclist, Integer> {

    @Query("SELECT t.name, c.registrationNumber, c.name " +
            "FROM Cyclist c JOIN c.team t WHERE t.name = ?1")
    List<Object[]> findCyclistsByTeam(String teamName);
}

