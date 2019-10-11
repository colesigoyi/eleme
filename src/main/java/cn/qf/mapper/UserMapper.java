package cn.qf.mapper;

import cn.qf.pojo.User;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 18:00
 * @ desc:
 **/

public interface UserMapper {
    public List<User> findList();
    public void add(User user);
}
