package cn.qf.mybatis;

import cn.qf.pojo.User;
import cn.qf.service.UserService;
import cn.qf.service.impl.UserServiceImpl;
import org.junit.Test;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:26
 * @ desc:
 **/

public class TestMybatis {
    private UserService userService = new UserServiceImpl();

    @Test
    public void test() {
        List<User> list = userService.findList();
        System.out.println(list);
    }
    @Test
    public void insert() {
        User user = new User(3, "xiaoming");
        userService.add(user);
    }
}
