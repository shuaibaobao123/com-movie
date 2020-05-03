package com.cn.hnust.pojo;

import java.util.Date;

public class Movie {
    private Integer id;

    private String name;

    private Date startdate;

    private Integer countryid;
    
    private String countryname;
    
    private Integer typeid;
    
    private String typename;

    private String director;

    private String mainact1;

    private String mainact2;

    private String img;

    private Double rank;

    private Integer count;

    private Integer ispay;

    private String introduce;
    
    private String moviesrc;
    
    
    
   

	public String getCountryname() {
		return countryname;
	}

	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getMoviesrc() {
		return moviesrc;
	}

	public void setMoviesrc(String moviesrc) {
		this.moviesrc = moviesrc;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Integer getCountryid() {
        return countryid;
    }

    public void setCountryid(Integer countryid) {
        this.countryid = countryid;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Double getRank() {
        return rank;
    }

    public void setRank(Double rank) {
        this.rank = rank;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getIspay() {
        return ispay;
    }

    public void setIspay(Integer ispay) {
        this.ispay = ispay;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", startdate=" + startdate + ", countryid=" + countryid
				+ ", typeid=" + typeid + ", director=" + director + ", mainact1=" + mainact1 + ", mainact2=" + mainact2
				+ ", img=" + img + ", rank=" + rank + ", count=" + count + ", ispay=" + ispay + ", introduce="
				+ introduce + ", moviesrc=" + moviesrc + "]";
	}
}