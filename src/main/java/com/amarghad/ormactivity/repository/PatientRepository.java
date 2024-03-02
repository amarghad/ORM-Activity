package com.amarghad.ormactivity.repository;

import com.amarghad.ormactivity.entities.Patient;
import com.amarghad.ormactivity.entities.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PatientRepository extends PersonRepository<Patient> {

    List<Patient> findByIsSick(boolean isSick);

}
