package pers.pika.center.common.core.annotation.dynamicDataSource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author Jere
 * @create 2018-04-12 23:13
 */

public class DynamicDataSource extends AbstractRoutingDataSource {

    /**
     * determineCurrentLookupKey方法返回lookupKey,resolvedDataSources方法就是根据lookupKey从Map中获得数据源
     */
    @Override
    protected Object determineCurrentLookupKey() {
        return DynamicDataSourceHolder.getDataSource();
    }
}
