package pers.pika.center.common.core.annotation;

import pers.pika.center.common.core.enums.DataSourceEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 该注解，用于标识使用哪一个数据源
 *
 * @author Jere
 * @create 2018-04-12 22:27
 */

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface DataSource {
    DataSourceEnum value();
}
