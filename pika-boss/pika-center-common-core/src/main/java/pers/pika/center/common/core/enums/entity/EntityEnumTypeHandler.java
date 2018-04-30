package pers.pika.center.common.core.enums.entity;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Jere
 * @create 2018-04-14 18:25
 */

public class EntityEnumTypeHandler<E extends Enum<E> & BaseEntityEnum<E>> extends BaseTypeHandler<BaseEntityEnum> {

    private Class<E> type;

    public EntityEnumTypeHandler(Class<E> type) {
        if (type == null) {
            throw new IllegalArgumentException("Type argument cannot be null");
        }
        this.type = type;
    }

    private BaseEntityEnum convert(int status) {
        BaseEntityEnum[] objs = type.getEnumConstants();
        for (BaseEntityEnum em : objs) {
            if (em.getIntValue() == status) {
                return em;
            }
        }
        return null;
    }

    @Override
    public BaseEntityEnum getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return convert(rs.getInt(columnName));
    }

    @Override
    public BaseEntityEnum getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return convert(rs.getInt(columnIndex));
    }

    @Override
    public BaseEntityEnum getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return convert(cs.getInt(columnIndex));
    }

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, BaseEntityEnum parameter, JdbcType jdbcType)
            throws SQLException {
        ps.setInt(i, parameter.getIntValue());
    }
}
