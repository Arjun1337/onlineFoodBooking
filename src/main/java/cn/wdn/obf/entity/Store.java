package cn.wdn.obf.entity;

import java.util.List;

public class Store {
    private Integer sId;



	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}

	private User user;

    private String sName;

    private String sDesc;

    private Integer sPoint;

    private Double sAllsale;

    private int sStatus;

    private String sImg;

    private String sCertimg;
    
    private List<Food> foods;
    private int sUid;
    private String sStarttime;
    private String sEndtime;
    private String sAddress;
    
    public String getsStarttime() {
		return sStarttime;
	}

	public void setsStarttime(String sStarttime) {
		this.sStarttime = sStarttime;
	}

	public String getsEndtime() {
		return sEndtime;
	}

	public void setsEndtime(String sEndtime) {
		this.sEndtime = sEndtime;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	@Override
	public String toString() {
		return "Store [sId=" + sId + ", user=" + user + ", sName=" + sName + ", sDesc=" + sDesc + ", sPoint=" + sPoint
				+ ", sAllsale=" + sAllsale + ", sStatus=" + sStatus + ", sImg=" + sImg + ", sCertimg=" + sCertimg
				+ ", foods=" + foods + ", sUid=" + sUid + "]";
	}

	public int getsUid() {
		return sUid;
	}

	public void setsUid(int sUid) {
		this.sUid = sUid;
	}



	public List<Food> getFoods() {
		return foods;
	}

	public void setFoods(List<Food> foods) {
		this.foods = foods;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }


    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsDesc() {
        return sDesc;
    }

    public void setsDesc(String sDesc) {
        this.sDesc = sDesc == null ? null : sDesc.trim();
    }

    public Integer getsPoint() {
        return sPoint;
    }

    public void setsPoint(Integer sPoint) {
        this.sPoint = sPoint;
    }

    public Double getsAllsale() {
        return sAllsale;
    }

    public void setsAllsale(Double sAllsale) {
        this.sAllsale = sAllsale;
    }

    public int getsStatus() {
        return sStatus;
    }

    public void setsStatus(int sStatus) {
        this.sStatus = sStatus;
    }

    public String getsImg() {
        return sImg;
    }

    public void setsImg(String sImg) {
        this.sImg = sImg == null ? null : sImg.trim();
    }

    public String getsCertimg() {
        return sCertimg;
    }

    public void setsCertimg(String sCertimg) {
        this.sCertimg = sCertimg == null ? null : sCertimg.trim();
    }
}