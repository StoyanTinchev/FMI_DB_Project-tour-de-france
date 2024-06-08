package com.fmi.tourdefrance.DTO;


import java.sql.Time;

public class ResultDTO {
    private int registrationNumber;
    private String cyclistName;
    private int stageNumber;
    private Time stageTime;
    private Time totalTime;

    public ResultDTO(int registrationNumber, String cyclistName, int stageNumber, Time stageTime, Time totalTime) {
        this.registrationNumber = registrationNumber;
        this.cyclistName = cyclistName;
        this.stageNumber = stageNumber;
        this.stageTime = stageTime;
        this.totalTime = totalTime;
    }

    public int getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(int registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getCyclistName() {
        return cyclistName;
    }

    public void setCyclistName(String cyclistName) {
        this.cyclistName = cyclistName;
    }

    public int getStageNumber() {
        return stageNumber;
    }

    public void setStageNumber(int stageNumber) {
        this.stageNumber = stageNumber;
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
}
