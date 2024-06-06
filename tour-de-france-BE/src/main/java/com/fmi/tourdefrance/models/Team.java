package com.fmi.tourdefrance.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.util.List;

@Entity
public class Team {
    @Id
    private int registrationNumber;
    private String name;
    private String country;

    @OneToMany(mappedBy = "team")
    private List<Cyclist> cyclists;

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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public List<Cyclist> getCyclists() {
        return cyclists;
    }

    public void setCyclists(List<Cyclist> cyclists) {
        this.cyclists = cyclists;
    }
}
