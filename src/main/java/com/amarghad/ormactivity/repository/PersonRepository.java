package com.amarghad.ormactivity.repository;

import com.amarghad.ormactivity.entities.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface PersonRepository<T extends Person> extends JpaRepository<T, Long> {

    Optional<T> findByEmail(String email);
    List<T> findByLastNameContains(String lastName);

    List<T> findByFirstNameContains(String firstName);

    List<T> findByFirstNameOrLastNameContains(String firstName, String lastName);

}
