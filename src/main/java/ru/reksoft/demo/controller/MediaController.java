package ru.reksoft.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.reksoft.demo.dto.MediaDTO;
import ru.reksoft.demo.dto.MediaFilterDTO;
import ru.reksoft.demo.dto.MediaShortDTO;
import ru.reksoft.demo.dto.PageDTO;
import ru.reksoft.demo.service.MediaService;

@RestController
@RequestMapping("api/media")
public class MediaController {

    private MediaService mediaService;

    @Autowired
    public void setMediaService(MediaService mediaService) {
        this.mediaService = mediaService;
    }


    /**
     * Return list of media with base information for current filter
     *
     * @return page with media
     */
    @GetMapping(value = "/list")
    public PageDTO<MediaShortDTO> getMediaList() {
        return mediaService.getMediaList(new MediaFilterDTO());
    }

    @PostMapping(value = "/list")
    public PageDTO<MediaShortDTO> getMediaList(@RequestBody MediaFilterDTO filter) {
        return mediaService.getMediaList(filter);
    }

    /**
     * Return media by id with full information
     *
     * @return media
     */
    @GetMapping(value = "/{id}")
    public MediaDTO getMedia(@PathVariable int id) {
        return mediaService.getMedia(id);
    }

}
