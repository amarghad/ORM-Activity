package com.amarghad.ormactivity.repository;

import com.amarghad.ormactivity.entities.Appoitement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface AppoitementRepository extends JpaRepository<Appoitement, Long> {

    List<Appoitement> findByDateBetween(Date min, Date max);

}
