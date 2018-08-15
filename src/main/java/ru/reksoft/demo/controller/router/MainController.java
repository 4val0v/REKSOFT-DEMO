package ru.reksoft.demo.controller.router;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @GetMapping("/")
    public String index() {
        return "redirect:/home";
    }

    @GetMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @GetMapping("/home")
    public ModelAndView home() {
        return new ModelAndView("home");
    }
}
