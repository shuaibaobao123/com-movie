package com.cn.hnust.pojo;

import java.util.Date;

public class User {
    private Integer id;

    private String uname;

    private String upassword;

    private String ismember;

    private Date endtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword == null ? null : upassword.trim();
    }

    public String getIsmember() {
        return ismember;
    }

    public void setIsmember(String ismember) {
        this.ismember = ismember == null ? null : ismember.trim();
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}