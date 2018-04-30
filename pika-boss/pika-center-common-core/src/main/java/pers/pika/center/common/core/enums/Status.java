package pers.pika.center.common.core.enums;

import pers.pika.center.common.core.enums.entity.BaseEntityEnum;

/**
 * 基本状态
 *
 * @author Jere
 * @create 2018-04-30 10:24
 */

public enum Status implements BaseEntityEnum<Status> {

    ENABLE(0, "启用"), DISABLE(1, "禁用");

    private Status(int code, String description) {
        this.code = new Integer(code);
        this.description = description;
    }

    private int code;

    private String description;

    public int getCode() {

        return code;
    }

    public String getDescription() {
        return description;
    }

    @Override
    public int getIntValue() {
        return this.code;
    }

}
