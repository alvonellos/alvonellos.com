package com.alvonellos.website.service;

import com.alvonellos.website.model.StatisticsEntity;
import com.alvonellos.website.repository.StatisticsRepository;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log
public class StatisticsService {
    @Autowired
    private StatisticsRepository statisticsRepository;

    public StatisticsEntity postStatistics(StatisticsEntity statisticsEntity) {
        return statisticsRepository.save(statisticsEntity);
    }

    public List<StatisticsEntity> getAllStats() {
        log.info("" + statisticsRepository.findAll());
        return statisticsRepository.findAll();
    }
}
