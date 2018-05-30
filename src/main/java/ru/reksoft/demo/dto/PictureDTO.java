package ru.reksoft.demo.dto;

import ru.reksoft.demo.domain.PictureEntity;

import java.time.LocalDateTime;

public class PictureDTO {

    private Integer id;
    private String url;
    private String name;
    private Integer size;
    private LocalDateTime uploaded;


    public PictureDTO(PictureEntity entity) {
        id = entity.getId();
        url = entity.getUrl();
        name = entity.getName();
        size = entity.getSize();

        uploaded = entity.getUploaded().toLocalDateTime();
    }


    public Integer getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public String getName() {
        return name;
    }

    public Integer getSize() {
        return size;
    }

    public LocalDateTime getUploaded() {
        return uploaded;
    }
}
