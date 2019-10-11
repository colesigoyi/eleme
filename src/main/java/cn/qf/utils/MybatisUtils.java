package cn.qf.utils;

import cn.qf.mybatis.TestMybatis;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:49
 * @ desc:
 **/

public class MybatisUtils {
    private static SqlSessionFactory factory;
    static {
        //1. 获取到sqlsession的对象
        factory = new SqlSessionFactoryBuilder()
                .build(TestMybatis.class.getClassLoader().getResourceAsStream("mybatis-3.cfg.xml"));
    }
    public static SqlSession getSqlSession() {
        //2. 获取到sqlsession
        SqlSession sqlSession = factory.openSession();
        return sqlSession;
    }

    public static void close(SqlSession sqlSession) {
        if (sqlSession != null) {
            sqlSession.close();
        }
    }

}
