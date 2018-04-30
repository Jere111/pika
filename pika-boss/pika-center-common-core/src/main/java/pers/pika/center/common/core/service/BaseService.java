package pers.pika.center.common.core.service;

import java.util.List;

/**
 * Created by Jere on 2018/4/11.
 */
public interface BaseService<T> {
    T get(Object o);

    int save(T o);

    int update(T o);

    int delete(T o);

    int deleteByPrimaryKey(Object id);

    List<T> getAllList();

    List<T> getByIds(Class<T> object, String property, List<?> ids);
}
