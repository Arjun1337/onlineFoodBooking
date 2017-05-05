package cn.wdn.obf.entity;

import java.util.List;

public class User {
    private Integer uId;

    private String uAccount;

    private String uPwd;

    private String uName;

    private String uStreet;

    private String uAddress;

    private String uPhone;

    private Integer uPower;
    private List<Comment> comments;
    private List<Order> orders;
    private List<Store> stores;
    private List<Cart> carts;

    @Override
	public String toString() {
		return "User [uId=" + uId + ", uAccount=" + uAccount + ", uPwd=" + uPwd + ", uName=" + uName + ", uStreet="
				+ uStreet + ", uAddress=" + uAddress + ", uPhone=" + uPhone + ", uPower=" + uPower + ", comments="
				+ comments + ", orders=" + orders + ", stores=" + stores + ", carts=" + carts + "]";
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String uPwd, String uName) {
		super();
		this.uPwd = uPwd;
		this.uName = uName;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<Store> getStores() {
		return stores;
	}

	public void setStores(List<Store> stores) {
		this.stores = stores;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}


	public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuAccount() {
        return uAccount;
    }

    public void setuAccount(String uAccount) {
        this.uAccount = uAccount == null ? null : uAccount.trim();
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd == null ? null : uPwd.trim();
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuStreet() {
        return uStreet;
    }

    public void setuStreet(String uStreet) {
        this.uStreet = uStreet == null ? null : uStreet.trim();
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress == null ? null : uAddress.trim();
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
    }

    public Integer getuPower() {
        return uPower;
    }

    public void setuPower(Integer uPower) {
        this.uPower = uPower;
    }
}