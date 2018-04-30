package pers.pika.center.service.user.enums;

import pers.pika.center.common.core.enums.entity.BaseEntityEnum;

/**
 * 菜单类型
 * Created by Jere on 2018/4/30.
 */
public enum MenuType implements BaseEntityEnum<MenuType> {

    DIRECTORY(0, "目录"), MENU(1, "菜单");

    private MenuType(int code, String description) {
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
