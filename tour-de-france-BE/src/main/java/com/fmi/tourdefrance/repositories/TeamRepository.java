package com.fmi.tourdefrance.repositories;

import com.fmi.tourdefrance.DTO.TeamDTO;
import com.fmi.tourdefrance.models.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TeamRepository extends JpaRepository<Team, Integer> {
    @Query("SELECT new com.fmi.tourdefrance.DTO.TeamDTO(c.name, t.name) " +
            "FROM Cyclist c JOIN c.team t WHERE c.registrationNumber = ?1")
    TeamDTO findTeamByCyclist(int cyclistRegistrationNumber);
}
