package cn.wdn.obf.entity;

public class Comment {
    private Integer coId;

    private User user;

    private Order order;

    private int coOid;
    private int coUid;

    private String coContent;


    private Integer coPoint;

	private String coDate;
  
	public int getCoOid() {
		return coOid;
	}

	public void setCoOid(int coOid) {
		this.coOid = coOid;
	}

	public int getCoUid() {
		return coUid;
	}

	public void setCoUid(int coUid) {
		this.coUid = coUid;
	}

	public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

  

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}


	public String getCoContent() {
        return coContent;
    }

    public void setCoContent(String coContent) {
        this.coContent = coContent == null ? null : coContent.trim();
    }

    public String getCoDate() {
        return coDate;
    }

    public void setCoDate(String coDate) {
        this.coDate = coDate == null ? null : coDate.trim();
    }

    public Integer getCoPoint() {
        return coPoint;
    }

    public void setCoPoint(Integer coPoint) {
        this.coPoint = coPoint;
    }
}