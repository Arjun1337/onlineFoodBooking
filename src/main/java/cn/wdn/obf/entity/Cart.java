package cn.wdn.obf.entity;

public class Cart {
    private Integer caId;

    private User user;
    private int caUid;

    private Food food;
    private int caFid;

    private Integer caNumber;

	

	public int getCaUid() {
		return caUid;
	}

	public void setCaUid(int caUid) {
		this.caUid = caUid;
	}

	public int getCaFid() {
		return caFid;
	}

	public void setCaFid(int caFid) {
		this.caFid = caFid;
	}

	public Integer getCaId() {
        return caId;
    }

    public void setCaId(Integer caId) {
        this.caId = caId;
    }


    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public Integer getCaNumber() {
        return caNumber;
    }

    public void setCaNumber(Integer caNumber) {
        this.caNumber = caNumber;
    }

	@Override
	public String toString() {
		return "Cart [caId=" + caId + ", user=" + user + ", caUid=" + caUid + ", food=" + food + ", caFid=" + caFid
				+ ", caNumber=" + caNumber + "]";
	}
}