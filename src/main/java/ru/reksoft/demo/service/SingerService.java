package ru.reksoft.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.reksoft.demo.config.messages.MessageContainer;
import ru.reksoft.demo.domain.SingerEntity;
import ru.reksoft.demo.domain.SingerEntity_;
import ru.reksoft.demo.dto.SingerDTO;
import ru.reksoft.demo.dto.pagination.PageDTO;
import ru.reksoft.demo.dto.pagination.filters.StringSearcherDTO;
import ru.reksoft.demo.mapper.SingerMapper;
import ru.reksoft.demo.repository.SingerRepository;
import ru.reksoft.demo.service.generic.AbstractCRUDService;
import ru.reksoft.demo.service.generic.ResourceCannotCreateException;
import ru.reksoft.demo.service.generic.ResourceNotFoundException;
import ru.reksoft.demo.service.generic.ResourceOptimisticLockException;

import javax.persistence.EntityNotFoundException;
import javax.persistence.OptimisticLockException;
import javax.validation.constraints.NotNull;

@Service
public class SingerService extends AbstractCRUDService<SingerDTO> {

    private MessageContainer messages;

    private SingerRepository singerRepository;

    private SingerMapper singerMapper;

    @Autowired
    public void setMessages(MessageContainer messages) {
        this.messages = messages;
    }

    @Autowired
    public void setSingerRepository(SingerRepository singerRepository) {
        this.singerRepository = singerRepository;
    }

    @Autowired
    public void setSingerMapper(SingerMapper singerMapper) {
        this.singerMapper = singerMapper;
    }


    /**
     * Returns page with searched singers.
     *
     * @param searcherDTO - searcher for singer
     * @return singer page
     */
    @Transactional(readOnly = true)
    public PageDTO<SingerDTO> getList(@NotNull StringSearcherDTO searcherDTO) {
        SingerSearcher searcher = new SingerSearcher(searcherDTO);
        return new PageDTO<>(singerRepository.findAll(searcher, searcher.getPageRequest()).map(singerMapper::toDTO));
    }

    /**
     * Returns singer.
     *
     * @param id - singer id
     * @return found singer
     * @throws ResourceNotFoundException - if singer not found by id
     */
    @Override
    @Transactional(readOnly = true)
    public SingerDTO get(@NotNull Integer id) throws ResourceNotFoundException {
        try {
            return singerMapper.toDTO(singerRepository.getOne(id));
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException(messages.getAndFormat("reksoft.demo.Singer.notExistById.message", id), e);
        }
    }

    /**
     * Save singer.
     *
     * @param singerDTO - singer
     * @return saved entity id
     * @throws ResourceCannotCreateException - if singer cannot created
     */
    @Override
    @Transactional
    public Integer create(@NotNull SingerDTO singerDTO) throws ResourceCannotCreateException {
        if (singerRepository.existsByName(singerDTO.getName())) {
            throw new ResourceCannotCreateException(messages.getAndFormat("reksoft.demo.Singer.alreadyExistByName.message", singerDTO.getName()));
        }

        return singerRepository.save(singerMapper.toEntity(singerDTO)).getId();
    }

    /**
     * Update singer.
     *
     * @param id        - singer id
     * @param singerDTO - new singer data
     * @throws ResourceNotFoundException       - if singer not found by id
     * @throws ResourceOptimisticLockException - if singer was already updated
     */
    @Override
    @Transactional
    public void update(@NotNull Integer id, @NotNull SingerDTO singerDTO)
            throws ResourceNotFoundException, ResourceOptimisticLockException {

        try {
            singerRepository.saveAndFlush(singerMapper.merge(singerRepository.getOne(id), singerMapper.toEntity(singerDTO)));
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFoundException(messages.getAndFormat("reksoft.demo.Singer.notExistById.message", id));
        } catch (OptimisticLockException | OptimisticLockingFailureException e) {
            throw new ResourceOptimisticLockException(messages.get("reksoft.demo.Singer.optimisticLock.message"), e);
        }
    }

    /**
     * Delete singer.
     *
     * @param id - singer id
     * @throws ResourceNotFoundException - if singer not found by id
     */
    @Override
    @Transactional
    public void delete(@NotNull Integer id) throws ResourceNotFoundException {
        if (!singerRepository.existsById(id)) {
            throw new ResourceNotFoundException(messages.getAndFormat("reksoft.demo.Singer.notExistById.message", id));
        }

        singerRepository.deleteById(id);
    }


    public static class SingerSearcher extends StringSearcher<SingerEntity> {

        public SingerSearcher(StringSearcherDTO dto) {
            super(dto, SingerEntity_.name);
        }
    }
}
