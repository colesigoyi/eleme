package cn.qf.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.util.List;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:26
 * @ desc:
 **/

public class TestMybatis {

    @Test
    public void init() {
        //1. 获取到sqlsession的对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder()
                .build(TestMybatis.class.getClassLoader().getResourceAsStream("mybatis-3.cfg.xml"));
        //2. 获取到sqlsession
        SqlSession sqlSession = factory.openSession();
        //3. 查询用户
        List<User> ulist = sqlSession.selectList("user.findList");
        System.out.println(ulist);
    }
}
