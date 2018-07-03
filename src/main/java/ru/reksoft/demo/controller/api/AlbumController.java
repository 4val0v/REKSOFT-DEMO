package ru.reksoft.demo.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.reksoft.demo.dto.AlbumDTO;
import ru.reksoft.demo.dto.AlbumShortDTO;
import ru.reksoft.demo.dto.pagination.PageDTO;
import ru.reksoft.demo.dto.pagination.filters.StringSearcherDTO;
import ru.reksoft.demo.service.AlbumService;
import ru.reksoft.demo.service.generic.ResourceCannotCreateException;
import ru.reksoft.demo.service.generic.ResourceCannotUpdateException;
import ru.reksoft.demo.service.generic.ResourceNotFoundException;
import ru.reksoft.demo.service.generic.ResourceOptimisticLockException;
import ru.reksoft.demo.util.ResourceLocationBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("${api-path.album}")
public class AlbumController {

    private AlbumService albumService;

    @Autowired
    public void setAlbumService(AlbumService albumService) {
        this.albumService = albumService;
    }


    /**
     * Returns list of albums for current searcher.
     *
     * @param searcher - page divider with search string
     * @return page with albums
     */
    @PostMapping("/list")
    public PageDTO<AlbumShortDTO> getList(@RequestBody StringSearcherDTO searcher) {
        return albumService.getList(searcher);
    }

    /**
     * Returns album by id with full information.
     *
     * @param id - album id
     * @return album
     */
    @GetMapping("/{id}")
    public AlbumDTO get(@PathVariable int id) throws ResourceNotFoundException {
        return albumService.get(id);
    }

    /**
     * Returns created album id and location.
     *
     * @param albumDTO - sent album
     */
    @PostMapping
    public void create(@RequestBody @Validated(AlbumDTO.FieldCheck.class) AlbumDTO albumDTO, HttpServletRequest request, HttpServletResponse response)
            throws ResourceCannotCreateException {
        response.setHeader(HttpHeaders.LOCATION, ResourceLocationBuilder.build(request, albumService.create(albumDTO)));
        response.setStatus(HttpServletResponse.SC_CREATED);
    }

    /**
     * Update album by id.
     *
     * @param id       - album id
     * @param albumDTO - album data
     */
    @PutMapping("/{id}")
    public void update(@PathVariable int id, @RequestBody @Validated(AlbumDTO.FieldCheck.class) AlbumDTO albumDTO, HttpServletResponse response) throws
            ResourceNotFoundException,
            ResourceCannotUpdateException,
            ResourceOptimisticLockException {

        albumService.update(id, albumDTO);
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

    /**
     * Delete album by id.
     *
     * @param id - album id
     */
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id, HttpServletResponse response)
            throws ResourceNotFoundException {
        albumService.delete(id);
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }
}
