package com.amarghad.ormactivity;

import com.amarghad.ormactivity.entities.Appoitement;
import com.amarghad.ormactivity.entities.Doctor;
import com.amarghad.ormactivity.entities.Patient;
import com.amarghad.ormactivity.repository.AppoitementRepository;
import com.amarghad.ormactivity.repository.ConsultationRepository;
import com.amarghad.ormactivity.repository.DoctorRepository;
import com.amarghad.ormactivity.repository.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Date;
import java.util.stream.Stream;

@SpringBootApplication
public class OrmActivityApplication{

    public static void main(String[] args) {
        SpringApplication.run(OrmActivityApplication.class, args);
    }

    @Bean
    CommandLineRunner run(
        PatientRepository patientRepository,
        DoctorRepository doctorRepository,
        ConsultationRepository consultationRepository,
        AppoitementRepository appoitementRepository
    ) {

        return args -> {

            Stream.of("Mohamed", "Hassan", "Mouad", "Yassmine", "Doha", "Oussama", "Ammar", "Anas", "Yaacoub").forEach(name -> {
                Patient patient = new Patient();
                patient.setFirstName(name);
                patient.setLastName(name);
                patient.setEmail(name + "@gmail.com");
                patient.setSick(Math.random() > 0.5);
                patient.setScore((int) (Math.random() * 3000));
                patient.setBirthDate(new Date());
                patientRepository.save(patient);
            });

            Stream.of("Amine", "Abdelmajid", "Issam", "Ibrahim", "Youssef", "Bilal", "Wissam", "Jiahd", "Sanae", "Intissar", "Hafsa", "Manal", "Montassir", "Zineb", "Fatima", "Ayoub").forEach(name -> {
                Doctor doctor = new Doctor();
                doctor.setFirstName(name);
                doctor.setLastName(name);
                doctor.setEmail(name + "@gmail.com");
                doctor.setSpeciality(Math.random() > 0.5 ? "Urgence" : "Cardiologie");
                doctorRepository.save(doctor);
            });

            patientRepository.findByFirstNameOrLastNameContains("Mo", "Mo").forEach(System.out::println);

        };
    }
}
