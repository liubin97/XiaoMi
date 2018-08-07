package com.ssm.model.exception;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:18
 **/
public class SecKillException extends RuntimeException{

    public SecKillException(String message) {
        super(message);
    }

    public SecKillException(String message, Throwable cause) {
        super(message, cause);
    }
}
