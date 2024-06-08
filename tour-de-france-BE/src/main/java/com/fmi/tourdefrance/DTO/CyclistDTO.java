package com.fmi.tourdefrance.DTO;

public class CyclistDTO {
    private String teamName;
    private int registrationNumber;
    private String cyclistName;

    public CyclistDTO(String teamName, int registrationNumber, String cyclistName) {
        this.teamName = teamName;
        this.registrationNumber = registrationNumber;
        this.cyclistName = cyclistName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
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
}
