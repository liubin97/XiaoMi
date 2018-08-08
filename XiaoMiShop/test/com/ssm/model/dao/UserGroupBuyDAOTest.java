package com.ssm.model.dao;

import com.ssm.model.bean.Order;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-dao.xml"})
public class UserGroupBuyDAOTest {
    @Resource
    UserGroupBuyDAO userGroupBuyDAO;
    @Test
    public void selectSearchGroupOrder() {
        Map<String ,Object> map = new HashMap<>();
        map.put("user_email","mr_liubin@outlook.com");
        map.put("searchKey","3");
        List<Order> orders = userGroupBuyDAO.selectSearchGroupOrder(map);
        System.out.println(orders.size());
    }
}