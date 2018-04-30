package pers.pika.center.common.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.pika.center.common.core.service.BaseService;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author Jere
 * @create 2018-04-12 21:51
 */

@Service("baseServiceImpl")
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    @Autowired
    private Mapper<T> mapper;

    public Mapper<T> getMapper() {
        return mapper;
    }

    public void setMapper(Mapper<T> mapper) {
        this.mapper = mapper;
    }

    @Override
    @Transactional(readOnly = true)
    public T get(Object o) {
        return mapper.selectByPrimaryKey(o);
    }

    @Override
    @Transactional
    public int save(T o) {
        return mapper.insert(o);
    }

    @Override
    @Transactional
    public int update(T o) {
        return mapper.updateByPrimaryKey(o);
    }

    @Override
    @Transactional
    public int delete(T o) {
        return mapper.delete(o);
    }

    @Override
    @Transactional
    public int deleteByPrimaryKey(Object id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public List<T> getAllList() {
        return mapper.selectAll();
    }

    @Override
    @Transactional
    public List<T> getByIds(Class<T> object, String property, List<?> ids) {
        Example example = new Example(object);
        example.createCriteria().andIn(property, ids);
        return mapper.selectByExample(example);
    }
}
