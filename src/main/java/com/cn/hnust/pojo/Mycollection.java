package com.cn.hnust.pojo;

public class Mycollection {
    private Integer id;
    
    private Integer userid;

    private Integer movieid;

    private String director;

    private String mainact1;

    private String mainact2;

    
    public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

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

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director == null ? null : director.trim();
    }

    public String getMainact1() {
        return mainact1;
    }

    public void setMainact1(String mainact1) {
        this.mainact1 = mainact1 == null ? null : mainact1.trim();
    }

    public String getMainact2() {
        return mainact2;
    }

    public void setMainact2(String mainact2) {
        this.mainact2 = mainact2 == null ? null : mainact2.trim();
    }
}