package cn.qf.service.impl;

import cn.qf.dao.UserDao;
import cn.qf.dao.impl.UserDaoImpl;
import cn.qf.mapper.UserMapper;
import cn.qf.pojo.User;
import cn.qf.service.UserService;
import cn.qf.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:49
 * @ desc:
 **/

public class UserServiceImpl implements UserService {

    //private UserDao userDao = new UserDaoImpl();

    SqlSession sqlSession = MybatisUtils.getSqlSession();
    private UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

    public List<User> findList() {
        return userMapper.findList();
    }

    public void add(User user) {
        userMapper.add(user);
        sqlSession.commit();
    }
}
