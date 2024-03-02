package com.amarghad.ormactivity.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;


@EqualsAndHashCode(callSuper = true)
@Entity
@Data @ToString(exclude = "appoitements")
public class Patient extends Person {

    @Temporal(TemporalType.DATE)
    private Date birthDate;
    private boolean isSick;
    private int score;

    @OneToMany(mappedBy = "patient")
    private List<Appoitement> appoitements;

}
