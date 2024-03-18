package com.amarghad.ormactivity.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoctorController {

    @GetMapping("/doctors")
    public String index() {
        return "doctors/index";
    }

}
