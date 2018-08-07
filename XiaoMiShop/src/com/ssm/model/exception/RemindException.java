package com.ssm.model.exception;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-08-06 13:23
 **/
public class RemindException extends RuntimeException {

    public RemindException(String message) {
        super(message);
    }

    public RemindException(String message, Throwable cause) {
        super(message, cause);
    }
}
