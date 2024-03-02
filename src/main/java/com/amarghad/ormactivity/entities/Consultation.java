package com.amarghad.ormactivity.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Entity
@Data
public class Consultation implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date date;
    private String report;

    @OneToOne(mappedBy = "consultation")
    private Appoitement appoitement;

}
