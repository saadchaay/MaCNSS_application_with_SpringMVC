package com.macnss.entities;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;

@Entity
public class Patient extends Person{

    @Basic
    @Column(name = "patient_number")
    private long patientNumber;

    public long getPatientNumber() {
        return patientNumber;
    }

    public void setPatientNumber(long patientNumber) {
        this.patientNumber = patientNumber;
    }
}
