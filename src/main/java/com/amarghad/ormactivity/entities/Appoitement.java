package com.amarghad.ormactivity.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.bind.DefaultValue;

import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
public class Appoitement implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date date;
    @Enumerated(EnumType.ORDINAL)
    private AppoitementStat stat;
    @ManyToOne
    private Patient patient;
    @ManyToOne
    private Doctor doctor;

    @OneToOne
    private Consultation consultation;



}
