package cn.wdn.obf.entity;

/**
 * 封装json对象，所有返回结果都使用它
 */
public class StoreResult {
	private String name;
	private double y;
	public StoreResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreResult(String name, double allsaler) {
		super();
		this.name = name;
		this.y = allsaler;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getAllsaler() {
		return y;
	}
	public void setAllsaler(double allsaler) {
		this.y = allsaler;
	}
	@Override
	public String toString() {
		return "StoreResult [name=" + name + ", allsaler=" + y + "]";
	}
    
}