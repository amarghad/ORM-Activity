# Gestion des patients

Ce compte rendu présente la partie web d'une application Spring Boot qui permet de gérer des informations de patients. L'application utilise JPA pour l'accès aux données, FreeMarker comme moteur de template et Apache Maven pour la gestion des dépendances.

## Fonctionnalités

L'application offre les fonctionnalités suivantes :

* **Affichage de la liste des patients :** La liste des patients est affichée avec un système de pagination et une barre de recherche.
* **Création de nouveaux patients :** Un formulaire permet de saisir les informations des nouveaux patients.
* **Modification des patients :** Un formulaire permet de modifier les informations d'un patient.
* **Suppression des patients :** La suppression d'un patient est possible à partir de la liste des patients.

## Couche web : controlleurs

Voici un exemple du code du contrôleur web responsable de la gestion des patients :

```java
@Controller
@RequestMapping("/patients")
@AllArgsConstructor
public class PatientController {

    private PatientRepository patientRepository;

    @GetMapping("")
    public String index(
            Model model,
            @RequestParam(name = "page", defaultValue = "1") int current,
            @RequestParam(name = "size", defaultValue = "2") int size,
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
        return "redirect:/patients";
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
```

## Démonstration vidéo

Voici une vidéo illustrant le fonctionnement de l'application :

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/bALAtdLcq3s/0.jpg)](https://www.youtube.com/watch?v=bALAtdLcq3s)

## Conclusion

L'application développée avec Spring Boot, JPA, FreeMarker et offre une interface web simple et efficace pour la gestion des patients. L'architecture MVC permet de séparer clairement le code du contrôleur, du modèle et de la vue. 
