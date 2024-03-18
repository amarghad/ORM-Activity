package com.amarghad.ormactivity.web;

import com.amarghad.ormactivity.entities.Patient;
import com.amarghad.ormactivity.repository.PatientRepository;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/patients")
@AllArgsConstructor
public class PatientController {

    private PatientRepository patientRepository;

    @GetMapping("")
    public String index(
            Model model,
            @RequestParam(name = "page", defaultValue = "1") int current,
            @RequestParam(name = "size", defaultValue = "10") int size,
            @RequestParam(name = "q", defaultValue = "") String keyword
    ) {

        PageRequest pageRequest = PageRequest.of(current - 1, size);
        Page<Patient> page = patientRepository.findByFirstNameOrLastNameContains(keyword, keyword, pageRequest);

        model.addAttribute("elementsPerPage", size);
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("currentPageNumber", current);
        model.addAttribute("patients", page.getContent());
        model.addAttribute("searchKeyword", keyword);

        return "patients/index";
    }

    /**
     * Show the new patient form
     * @return new patient form view
     */
    @GetMapping("/create")
    public String create() {
        return "patients/create";
    }

    /**
     * Save a send patient to database
     * @param patient
     * @return redirect to patients page
     */

    @PostMapping("/create")
    public String save(Patient patient) {
        patientRepository.save(patient);
        return "redirect:/patients/";
    }

    @GetMapping("/edit/{patient}")
    public String edit(Model model, @PathVariable Patient patient) {
        model.addAttribute(model);
        return "patients/create";
    }

    @PostMapping("/edit/{patient}")
    public String update(@PathVariable Patient patient) {
        return "redirect:/patients";
    }


    @PostMapping("/delete")
    public String delete(Patient patient) {
        patientRepository.delete(patient);
        return "redirect:/patients";
    }


}
