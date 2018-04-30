package pers.pika.center.common.core.mybatis;

import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.NestedIOException;

import java.io.IOException;

/**
 * @author Jere
 * @create 2018-04-12 23:17
 */

public class BeanFactory extends SqlSessionFactoryBean {

    @Override
    protected SqlSessionFactory buildSqlSessionFactory() throws IOException {
        try {
            return super.buildSqlSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NestedIOException("===============================", e.getCause());
        } finally {
            ErrorContext.instance().reset();
        }
    }
}
