package com.cn.hncj.pojo;

import java.util.Date;

public class Pingjia {
    private Integer id;

    private Integer movieid;

    private String uname;

    private Date pjdate;

    private Double rank;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMovieid() {
        return movieid;
    }

    public void setMovieid(Integer movieid) {
        this.movieid = movieid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public Date getPjdate() {
        return pjdate;
    }

    public void setPjdate(Date pjdate) {
        this.pjdate = pjdate;
    }

  

    public Double getRank() {
		return rank;
	}

	public void setRank(Double rank) {
		this.rank = rank;
	}

	public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}