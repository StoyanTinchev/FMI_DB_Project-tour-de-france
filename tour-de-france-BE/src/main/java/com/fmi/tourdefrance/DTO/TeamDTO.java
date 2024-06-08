package com.fmi.tourdefrance.DTO;

public class TeamDTO {
    private String cyclistName;
    private String teamName;

    public TeamDTO(String cyclistName, String teamName) {
        this.cyclistName = cyclistName;
        this.teamName = teamName;
    }

    public String getCyclistName() {
        return cyclistName;
    }

    public void setCyclistName(String cyclistName) {
        this.cyclistName = cyclistName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}
