package com.fmi.tourdefrance.models;

import jakarta.persistence.*;

import java.sql.Time;

@Entity
public class Result {
    @EmbeddedId
    private ResultId id;
    private Time stageTime;
    private Time totalTime;
    private int stageRanking;

    @ManyToOne
    @MapsId("cyclistRegistrationNumber")
    @JoinColumn(name = "cyclist_registration_number")
    private Cyclist cyclist;

    @ManyToOne
    @MapsId("stageNumber")
    @JoinColumn(name = "stage_number")
    private Stage stage;

    public ResultId getId() {
        return id;
    }

    public void setId(ResultId id) {
        this.id = id;
    }

    public Time getStageTime() {
        return stageTime;
    }

    public void setStageTime(Time stageTime) {
        this.stageTime = stageTime;
    }

    public Time getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(Time totalTime) {
        this.totalTime = totalTime;
    }

    public int getStageRanking() {
        return stageRanking;
    }

    public void setStageRanking(int stageRanking) {
        this.stageRanking = stageRanking;
    }

    public Cyclist getCyclist() {
        return cyclist;
    }

    public void setCyclist(Cyclist cyclist) {
        this.cyclist = cyclist;
    }

    public Stage getStage() {
        return stage;
    }

    public void setStage(Stage stage) {
        this.stage = stage;
    }
}

