package com.ssm.controller;

import com.ssm.model.bean.Address;
import com.ssm.model.bean.Seckill;
import com.ssm.model.bean.SeckillDetail;
import com.ssm.model.bean.SeckillReminder;
import com.ssm.model.dto.*;
import com.ssm.model.enums.RemindStateEnum;
import com.ssm.model.enums.SeckillStateEnum;
import com.ssm.model.exception.*;
import com.ssm.model.service.SeckillService;
import com.ssm.model.vo.DateList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @program: XiaoMiShop
 * @author: Xie Dong
 * @create: 2018-07-31 20:16
 **/
@Controller
@RequestMapping("/seckill")//url：/模块/资源/{id}/细分/seckill/list
public class SecKillController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;

    //列表页
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(Model model){
        //查询是否需要关闭秒杀
        CloseSeckill closeSeckill = seckillService.closeSeckillProcedure();

        if(closeSeckill.isSuccess()){
            //关闭成功
            //获取列表页
            List<SeckillDetail> list = seckillService.getSeckillList();

            model.addAttribute("list",list);
            //获取时间列表
            List<DateList> timeList = seckillService.getKillTimeList();
            model.addAttribute("timeList",timeList);
            return "seckill_list";
        }
        System.out.println("------------------------------------------------------");
        System.out.println("ERRO"+closeSeckill.getStateInfo());
        return "busy";

    }

    //详情页
    @RequestMapping(value = "/{seckillId}/detail",method = RequestMethod.GET)
    public String detail(@PathVariable("seckillId") int seckillId, Model model){
        //找不到活动
        if (seckillId <= 0) {
            return "redirect:/seckill/list";
        }

        SeckillDetail seckillDetail = seckillService.getById(seckillId);
        if(seckillDetail == null){
            return "forward:/seckill/list";
        }
        System.out.println("-------------------------------------");
        System.out.println(seckillDetail.toString());
        model.addAttribute("seckillDetail", seckillDetail);
        return "seckill_detail" ;
    }

    //ajax，json暴露秒杀接口的方法
    //解决中文乱码问题也可以是使用web.xml中配置过滤器
    @RequestMapping(value = "/{seckillId}/exposer",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<Exposer> exposer(@PathVariable int seckillId){

        SeckillResult<Exposer> result;
        try {
            Exposer exposer = seckillService.exportSeckillUrl(seckillId);
            result = new SeckillResult<Exposer>(true,exposer);
        }catch (Exception e){
            logger.error(e.getMessage());
            result = new SeckillResult<Exposer>(false,e.getMessage());

        }


        return result;
    }

    //进入付款页面，让用户选择地址付款
    @RequestMapping(value = "/{seckillId}/{md5}/handerorder",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    public String handerSeckillOrder(@PathVariable("seckillId")int seckillId,@PathVariable("md5")String md5,HttpSession httpSession,Model model){

        //判断登录逻辑以放入到了拦截器其中
        //TODO
        System.out.println("进入付款Controller");
        //md5被篡改
        if(!seckillService.IsMd5Rignt(seckillId,md5)){

            //篡改数据返回400
            return "400";
        }

        String email = (String) httpSession.getAttribute("user_email");

        //获取地址
        List<Address> addresses = seckillService.getAddress(email);

        //获取秒杀详情
        SeckillDetail seckillDetail = seckillService.getById(seckillId);

        System.out.println("----------------------------------------------------");
        System.out.println("email："+email);
        System.out.println(addresses.toString());
        System.out.println(seckillDetail.toString());
        model.addAttribute("addresses",addresses);
        model.addAttribute("seckillDetail",seckillDetail);
        model.addAttribute("md5",md5);


        return "seckill_order";
    }




    //执行秒杀; email实际上是从用户的浏览器的cookie里面或者session里面获得
    @RequestMapping(value = "/{seckillId}/{md5}/execution",method = RequestMethod.POST)
    public String execute(@PathVariable("seckillId")int seckillId, @PathVariable("md5")String md5,int addressId,HttpSession httpSession,Model model){

        System.out.println("进入支付Controller");
        String email = (String) httpSession.getAttribute("user_email");
        System.out.println("------------------打印信息------------------");
        System.out.println("addressID"+addressId);
        System.out.println("user_email"+email);

        SeckillResult<SeckillExecution>  result;

        try{
            //存储过程
            SeckillExecution execution = seckillService.executeSeckillProcedure(seckillId,email,addressId,md5);
            result =new SeckillResult<SeckillExecution>(true,execution);
            model.addAttribute("result",result);
        }catch (RepeatKillException e1) {
            // 重复秒杀
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.REPEAT_KILL);
            result =new SeckillResult<SeckillExecution>(false, execution);
            model.addAttribute("result",result);
        } catch (SecKillCloseException e2) {
            // 秒杀关闭
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.END);
            result =new SeckillResult<SeckillExecution>(false, execution);
            model.addAttribute("result",result);
        }catch (SecKillException e){
            logger.error(e.getMessage(),e);
            // 不能判断的异常
            SeckillExecution execution = new SeckillExecution(seckillId, SeckillStateEnum.INNER_ERRO);
            result =new SeckillResult<SeckillExecution>(false, execution);
            model.addAttribute("result",result);
        }
        model.addAttribute("user_email",email);
        model.addAttribute("addressID",addressId);


        return "result";
    }


    //获取系统时间
    @RequestMapping(value = "/time/now", method = RequestMethod.GET)
    @ResponseBody
    public SeckillResult<Long> time() {
        Date now = new Date();
        System.out.println("----------------------------");
        System.out.println("当前时间为："+now);
        return new SeckillResult<Long>(true, now.getTime());
    }


    //插入提醒
    @RequestMapping(value = "/{seckillId}/reminder",method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public SeckillResult<Remind> Secremind(@PathVariable("seckillId") int seckillId,HttpSession httpSession){

        System.out.println("进入插入提醒 ");

        SeckillResult<Remind> result;
        String email = (String) httpSession.getAttribute("user_email");
        System.out.println("seckillId: "+seckillId);
        System.out.println("email: "+email);
        try{
            //调用存储过程
            Remind remind = seckillService.addRemind(seckillId,email);
            return new SeckillResult<Remind>(true,remind);
        }catch (RepeatRemindException e1){
            //重复提醒
            Remind remind = new Remind(false,RemindStateEnum.REPEAT);
            return new SeckillResult<Remind>(true,remind);
        }catch (RemindException e){
            //无法判断的错误
            logger.error(e.getMessage(),e);
            Remind remind = new Remind(false,RemindStateEnum.INNER_ERRO);
            return new SeckillResult<Remind>(true,remind);
        }

    }



    @RequestMapping(value = "/indexlist",method = RequestMethod.GET)
    public String getIndex(Model model){


        return "indextest";
    }

}
