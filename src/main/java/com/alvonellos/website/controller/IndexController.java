package com.alvonellos.website.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/")
//@EnableWebMvc
//@EnableAutoConfiguration
public class IndexController {
    @RequestMapping("/index")
    public String welcome(ModelMap map) {
        map.put("currentDate", new Date());
        return "index";
    }
}