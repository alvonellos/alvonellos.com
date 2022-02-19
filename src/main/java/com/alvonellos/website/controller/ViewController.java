package com.alvonellos.website.controller;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/")
public class ViewController {
    @RequestMapping("/index")
    public String welcome(ModelMap map) {
        map.put("currentDate", new Date());
        return "index";
    }

    @RequestMapping("/")
    String index() {
        return "index";
    }

    @RequestMapping("/about")
    String about() { return "about"; }

}