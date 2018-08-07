package com.ssm.model.dao.cache;

import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtobufIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.ssm.model.bean.Seckill;
import com.ssm.model.bean.SeckillDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 09:24
 **/
public class RedisDao {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private final JedisPool jedisPool;//redis连接池

    //通过字节码，和字节码对应的属性，把字节码传递给哪些属性，达到序列化的目的
    private RuntimeSchema<SeckillDetail> schema = RuntimeSchema.createFrom(SeckillDetail.class);

    public RedisDao(String ip,int port){
        jedisPool = new JedisPool(ip,port);
    }

    //拿到秒杀对象
    public SeckillDetail getSeckill(int seckillId){

        //redis操作逻辑
        try{

            Jedis jedis = jedisPool.getResource();
            try {
                String key = "seckill:"+seckillId;
                //并没有实现内部序列化操作
                //get->byte[]->反序列化—>object（Seckill）
                //因为序列化的效率差异不适用java自带的，而是采用自定义开源项目--protostuff
                //protostuff：能够序列化的仅仅是pojo标准的类（即有set和get方法）
                byte[] bytes = jedis.get(key.getBytes());
                //从缓存中获取到
                if(bytes !=null){
                    //空对象
                    SeckillDetail seckillDetail = schema.newMessage();
                    //参数1.存放字节码 参数2.空对象 参数3.schema
                    //protostuff会根据bytes字节数组（存放时间 ），把数据有schema对应放到空对象
                    ProtobufIOUtil.mergeFrom(bytes,seckillDetail,schema);
                    //seckillDetail被反序列化
                    return seckillDetail;
                }
            }finally {
                jedis.close();
            }
        }
        catch (Exception e){
            logger.error(e.getMessage(),e);
        }
        return null;
    }

    //无缓存去put一个SeckillDetail
    public String putSeckill(SeckillDetail seckillDetail){

        //set Object(SeckillDetail) ->序列化->bytes[]
        try {
            Jedis jedis = jedisPool.getResource();
            try {
                String key = "seckill:"+seckillDetail.getSeckill_id();
                //参数1.序列化对象  参数2.schema（结构）  3.LinkedBuffer缓存器--方便在对象大的时候有缓冲
                byte[] bytes = ProtobufIOUtil.toByteArray(seckillDetail,schema,LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
                //超时缓存
                int timeout = 60 * 60;//缓冲1个小时
                String result = jedis.setex(key.getBytes(),timeout,bytes);//会返回一个错误信息,没错误则返回ok
                return result;

            }finally {
                jedis.close();
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
        }
        return null;
    }

}
