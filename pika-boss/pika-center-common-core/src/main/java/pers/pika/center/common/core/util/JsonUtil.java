package pers.pika.center.common.core.util;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.codehaus.jackson.type.TypeReference;

import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * Json工具类
 *
 * @author Jere
 * @create 2018-04-30 0:17
 */

public class JsonUtil {

    private static final ObjectMapper mapper;

    private JsonUtil() {
    }

    static {
        mapper = new ObjectMapper();
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
    }

    public static final String toJson(Object obj) {
        try {
            return mapper.writeValueAsString(obj);
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return "";
    }

    public static final <T> T fromJson(final String json, Class<T> clazz) {
        try {
            return mapper.readValue(json, clazz);
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return null;
    }

    public static final <T> T fromJson(final String json, JavaType type) {
        try {
            return mapper.readValue(json, type);
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return null;
    }

    public static final <T> T fromJson(final String json, TypeReference<T> reference) {
        try {
            return mapper.readValue(json, reference);
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return null;
    }

    public static final Map<String, Object> fromJson(final String json) {
        return fromJson(json, Map.class);
    }

}
