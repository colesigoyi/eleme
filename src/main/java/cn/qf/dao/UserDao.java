package cn.qf.dao;

import cn.qf.pojo.User;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:47
 * @ desc:
 **/

public interface UserDao {
    public List<User> findList();
    public void add(User user);
}
