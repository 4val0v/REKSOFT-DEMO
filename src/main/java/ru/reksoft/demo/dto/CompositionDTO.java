package ru.reksoft.demo.dto;

import ru.reksoft.demo.domain.CompositionEntity;

import java.time.LocalTime;

public class CompositionDTO {

    private Integer id;
    private String name;
    private LocalTime duration;
    private Integer position;


    public CompositionDTO(CompositionEntity entity) {
        id = entity.getId();
        name = entity.getName();
        duration = entity.getDuration().toLocalTime();
        position = entity.getPosition();
    }


    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public LocalTime getDuration() {
        return duration;
    }

    public Integer getPosition() {
        return position;
    }
}