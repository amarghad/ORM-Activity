package com.amarghad.ormactivity.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data @ToString(exclude = "appoitements")
public class Doctor extends Person {
    private String speciality;
    @OneToMany(mappedBy = "doctor")
    private List<Appoitement> appoitements;
}
