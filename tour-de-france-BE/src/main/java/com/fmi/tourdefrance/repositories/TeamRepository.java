package com.fmi.tourdefrance.repositories;

import com.fmi.tourdefrance.models.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeamRepository extends JpaRepository<Team, Integer> {
    @Query("SELECT c.name, t.name " +
            "FROM Cyclist c JOIN c.team t WHERE c.registrationNumber = ?1")
    Object findTeamByCyclist(int cyclistRegistrationNumber);
}
