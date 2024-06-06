package com.fmi.tourdefrance.models;

import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class ResultId implements Serializable {
    private int cyclistRegistrationNumber;
    private int stageNumber;

    public int getCyclistRegistrationNumber() {
        return cyclistRegistrationNumber;
    }

    public void setCyclistRegistrationNumber(int cyclistRegistrationNumber) {
        this.cyclistRegistrationNumber = cyclistRegistrationNumber;
    }

    public int getStageNumber() {
        return stageNumber;
    }

    public void setStageNumber(int stageNumber) {
        this.stageNumber = stageNumber;
    }

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ResultId resultId)) return false;

        return getCyclistRegistrationNumber() == resultId.getCyclistRegistrationNumber() && getStageNumber() == resultId.getStageNumber();
    }

    @Override
    public int hashCode() {
        int result = getCyclistRegistrationNumber();
        result = 31 * result + getStageNumber();
        return result;
    }
}
