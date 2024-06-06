package com.fmi.tourdefrance.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

import java.util.Date;
import java.util.List;

@Entity
public class Stage {
    @Id
    private int number;
    private Date date;
    private String startPoint;
    private String endPoint;
    private double length;

    @OneToMany(mappedBy = "stage")
    private List<Result> results;

    @ManyToMany(mappedBy = "stages")
    private List<Cyclist> cyclists;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint;
    }

    public String getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(String endPoint) {
        this.endPoint = endPoint;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public List<Result> getResults() {
        return results;
    }

    public void setResults(List<Result> results) {
        this.results = results;
    }

    public List<Cyclist> getCyclists() {
        return cyclists;
    }

    public void setCyclists(List<Cyclist> cyclists) {
        this.cyclists = cyclists;
    }
}
