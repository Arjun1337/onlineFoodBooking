package cn.wdn.obf.entity;

import java.util.List;

public class Order {
    private Integer oId;

    private User user;

    private int oUid;
    private int oSid;
    private Store store;

    private String oDetail;
    private double oPrice;

    private String oDate;

    private String oStatus;


	@Override
	public String toString() {
		return "Order [oId=" + oId + ", user=" + user + ", oUid=" + oUid + ", oSid=" + oSid + ", store=" + store
				+ ", oDetail=" + oDetail + ", oPrice=" + oPrice + ", oDate=" + oDate + ", oStatus=" + oStatus + "]";
	}

	public double getoPrice() {
		return oPrice;
	}

	public void setoPrice(double oPrice) {
		this.oPrice = oPrice;
	}

	public int getoSid() {
		return oSid;
	}

	public void setoSid(int oSid) {
		this.oSid = oSid;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public String getoDetail() {
		return oDetail;
	}

	public void setoDetail(String oDetail) {
		this.oDetail = oDetail;
	}

	public int getoUid() {
		return oUid;
	}

	public void setoUid(int oUid) {
		this.oUid = oUid;
	}


	public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

  

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



    public String getoDate() {
        return oDate;
    }

    public void setoDate(String oDate) {
        this.oDate = oDate == null ? null : oDate.trim();
    }

    public String getoStatus() {
        return oStatus;
    }

    public void setoStatus(String oStatus) {
        this.oStatus = oStatus == null ? null : oStatus.trim();
    }
}