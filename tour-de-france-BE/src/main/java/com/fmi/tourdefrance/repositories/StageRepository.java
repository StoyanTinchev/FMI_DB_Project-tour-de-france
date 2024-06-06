package com.fmi.tourdefrance.repositories;


import com.fmi.tourdefrance.models.Stage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StageRepository extends JpaRepository<Stage, Integer> {
}
