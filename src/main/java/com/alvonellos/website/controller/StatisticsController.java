package com.alvonellos.website.controller;

import com.alvonellos.website.model.StatisticsEntity;
import com.alvonellos.website.service.StatisticsService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;

@Controller("/")
@Log
public class StatisticsController {

    private final StatisticsService statisticsService;
    public StatisticsController(@Autowired StatisticsService statisticsService) {
        this.statisticsService = statisticsService;
    }

    @GetMapping("/statistics")
    public String getStatistics(ModelMap modelMap) {
        modelMap.put("statisticsEntities", statisticsService.getAllStats());
        return "statistics";
    }

    @PostMapping("/statistics")
    public ResponseEntity<StatisticsEntity> postStatistics(
            @RequestParam String userAgent, @RequestParam String method,
            @RequestParam String requestURI, @RequestParam String protocol,
            @RequestParam String remoteHost, @RequestParam String remoteAddr)
    {

        return new ResponseEntity<>(statisticsService.postStatistics(
                StatisticsEntity.builder()
                        .accessed(LocalDateTime.now())
                        .userAgent(userAgent)
                        .method(method)
                        .requestURI(requestURI)
                        .requestProtocol(protocol)
                        .remoteHost(remoteHost)
                        .remoteAddr(remoteAddr).build()
        ), HttpStatus.OK);
    }

}
