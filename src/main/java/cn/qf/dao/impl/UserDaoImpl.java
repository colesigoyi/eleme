package cn.qf.dao.impl;

import cn.qf.dao.UserDao;
import cn.qf.pojo.User;
import cn.qf.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:48
 * @ desc:
 **/

public class UserDaoImpl implements UserDao {

    public List<User> findList() {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        List<User> ulist = sqlSession.selectList("user.findList");
        return ulist;
    }

    public void add(User user) {
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        sqlSession.insert("user.add", user);
        sqlSession.commit();
    }
}
