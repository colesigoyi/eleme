package cn.qf.service;

import cn.qf.pojo.User;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:48
 * @ desc:
 **/

public interface UserService {
    public List<User> findList();
    public void add(User user);
}
