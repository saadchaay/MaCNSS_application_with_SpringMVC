package com.macnss.entities;

import jakarta.persistence.*;

@MappedSuperclass
public class Papers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Basic
    @Column(name = "dossier_id", nullable = false)
    private long dossierId;

    @Basic
    @Column(name = "price", nullable = false)
    private double price;

    @ManyToOne
    @JoinColumn(name = "dossier_id", insertable = false, updatable = false)
    private Dossier dossier;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getDossierId() {
        return dossierId;
    }

    public void setDossierId(long dossierId) {
        this.dossierId = dossierId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Dossier getDossier() {
        return dossier;
    }

    public void setDossier(Dossier dossier) {
        this.dossier = dossier;
    }
}
