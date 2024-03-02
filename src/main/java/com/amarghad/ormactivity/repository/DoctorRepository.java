package com.amarghad.ormactivity.repository;

import com.amarghad.ormactivity.entities.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.print.Doc;
import java.util.List;

public interface DoctorRepository extends PersonRepository<Doctor> {

    List<Doctor> findBySpeciality(String speciality);

}
