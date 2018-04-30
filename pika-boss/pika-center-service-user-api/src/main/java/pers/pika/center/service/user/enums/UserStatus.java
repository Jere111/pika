package pers.pika.center.service.user.enums;

import pers.pika.center.common.core.enums.entity.BaseEntityEnum;

/**
 * 账户状态
 *
 * @author Jere
 * @create 2018-04-12 21:28
 */

public enum UserStatus implements BaseEntityEnum<UserStatus> {
    ENABLE(0, "启用"), DISABLE(1, "禁用"), LOCK(2, "锁定");

    private int code;
    private String description;

    UserStatus(int code, String description) {
        this.code = new Integer(code);
        this.description = description;
    }

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
