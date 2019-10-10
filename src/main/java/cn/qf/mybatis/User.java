package cn.qf.mybatis;

/**
 * @ program: eleme
 * @ author:  TaoXueFeng
 * @ create: 2019-10-10 16:26
 * @ desc:
 **/

public class User {
    private int uid;
    private String uname;

    public User() {
    }

    public User(int uid, String uname) {
        this.uid = uid;
        this.uname = uname;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }
}
