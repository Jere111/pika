package pers.pika.center.common.core.annotation.dynamicDataSource;

/**
 * @author Jere
 * @create 2018-04-12 23:10
 */

public class DynamicDataSourceHolder {
    public static final ThreadLocal<String> holder = new ThreadLocal<String>();

    public static void putDataSource(String name) {
        holder.set(name);
    }

    public static String getDataSource() {
        return holder.get();
    }
}
