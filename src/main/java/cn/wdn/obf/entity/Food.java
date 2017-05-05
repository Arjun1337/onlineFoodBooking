package cn.wdn.obf.entity;

import java.util.List;

public class Food {
    private Integer fId;

    private Store store;
    private int fSid;

    private String fName;

    private String fDesc;

    private Integer fNumber;

    private Double fPrice;

    private String fImg;
    List<Order> orders;

    public int getfSid() {
		return fSid;
	}

	public void setfSid(int fSid) {
		this.fSid = fSid;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }


    public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName == null ? null : fName.trim();
    }

    public String getfDesc() {
        return fDesc;
    }

    public void setfDesc(String fDesc) {
        this.fDesc = fDesc == null ? null : fDesc.trim();
    }

    public Integer getfNumber() {
        return fNumber;
    }

    public void setfNumber(Integer fNumber) {
        this.fNumber = fNumber;
    }

    public Double getfPrice() {
        return fPrice;
    }

    public void setfPrice(Double fPrice) {
        this.fPrice = fPrice;
    }

    public String getfImg() {
        return fImg;
    }

    public void setfImg(String fImg) {
        this.fImg = fImg == null ? null : fImg.trim();
    }

	@Override
	public String toString() {
		return "Food [fId=" + fId + ", store=" + store + ", fSid=" + fSid + ", fName=" + fName + ", fDesc=" + fDesc
				+ ", fNumber=" + fNumber + ", fPrice=" + fPrice + ", fImg=" + fImg + ", orders=" + orders + "]";
	}
    
}