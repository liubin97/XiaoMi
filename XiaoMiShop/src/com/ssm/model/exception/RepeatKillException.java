package com.ssm.model.exception;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:19
 **/
public class RepeatKillException extends SecKillException{

    public RepeatKillException(String message) {
        super(message);
    }

    public RepeatKillException(String message, Throwable cause) {
        super(message, cause);
    }
}
