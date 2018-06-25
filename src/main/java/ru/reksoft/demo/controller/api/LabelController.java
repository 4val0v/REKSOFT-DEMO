package ru.reksoft.demo.controller.api;

import javassist.NotFoundException;
import javassist.tools.reflect.CannotCreateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.reksoft.demo.dto.LabelDTO;
import ru.reksoft.demo.dto.pagination.filters.StringSearcherDTO;
import ru.reksoft.demo.dto.pagination.PageDTO;
import ru.reksoft.demo.service.LabelService;
import ru.reksoft.demo.util.ResourceLocationBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api/label")
public class LabelController {

    private LabelService labelService;

    @Autowired
    public void setLabelService(LabelService labelService) {
        this.labelService = labelService;
    }


    /**
     * Return list of labels for current searcher.
     *
     * @param searcher - page divider with search string
     * @return page with labels
     */
    @PostMapping("/list")
    public PageDTO<LabelDTO> getList(@RequestBody StringSearcherDTO searcher) {
        return labelService.getList(searcher);
    }

    /**
     * Returns label by id with full information.
     *
     * @param id - label id
     * @return label
     */
    @GetMapping("/{id}")
    public LabelDTO get(@PathVariable int id) throws NotFoundException {
        return labelService.get(id);
    }

    /**
     * Returns created label id and location.
     *
     * @param labelDTO - sent label
     */
    @PostMapping
    public void create(@RequestBody @Validated(LabelDTO.FieldCheck.class) LabelDTO labelDTO, HttpServletRequest request, HttpServletResponse response)
            throws CannotCreateException
    {
        response.setHeader("location", ResourceLocationBuilder.build(request, labelService.create(labelDTO)));
        response.setStatus(HttpServletResponse.SC_CREATED);
    }

    /**
     * Update label by id.
     *
     * @param id - label id
     */
    @PutMapping("/{id}")
    public void update(@PathVariable int id, @RequestBody @Validated(LabelDTO.FieldCheck.class) LabelDTO labelDTO, HttpServletResponse response)
            throws NotFoundException
    {
        labelService.update(id, labelDTO);
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }

    /**
     * Delete label by id.
     *
     * @param id - label id
     */
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id, HttpServletResponse response)
            throws NotFoundException
    {
        labelService.delete(id);
        response.setStatus(HttpServletResponse.SC_ACCEPTED);
    }
}