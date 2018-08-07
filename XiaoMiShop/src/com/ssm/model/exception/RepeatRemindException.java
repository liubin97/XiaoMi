package com.ssm.model.exception;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 13:23
 **/
public class RepeatRemindException extends RemindException {

    public RepeatRemindException(String message) {
        super(message);
    }

    public RepeatRemindException(String message, Throwable cause) {
        super(message, cause);
    }
}
