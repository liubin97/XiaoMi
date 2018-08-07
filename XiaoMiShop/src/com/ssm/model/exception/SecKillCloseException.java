package com.ssm.model.exception;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:18
 **/
public class SecKillCloseException extends SecKillException{

    public SecKillCloseException(String message) {
        super(message);
    }

    public SecKillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}
