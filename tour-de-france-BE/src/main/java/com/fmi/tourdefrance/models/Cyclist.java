package com.fmi.tourdefrance.models;


import jakarta.persistence.*;

import java.util.Date;
import java.util.List;

@Entity
public class Cyclist {
    @Id
    private int registrationNumber;
    private String name;
    private Date birthDate;
    private String nationality;

    @ManyToOne
    @JoinColumn(name = "team_registration_number")
    private Team team;

    @OneToMany(mappedBy = "cyclist")
    private List<Result> results;

    @ManyToMany
    @JoinTable(
            name = "Participates",
            joinColumns = @JoinColumn(name = "cyclist_registration_number"),
            inverseJoinColumns = @JoinColumn(name = "stage_number")
    )
    private List<Stage> stages;

    public int getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(int registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public List<Result> getResults() {
        return results;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    public List<Stage> getStages() {
        return stages;
    }

    public void setStages(List<Stage> stages) {
        this.stages = stages;
    }
}
