package popcol.model;

public class Price {
	private int pid;
	private String timezone;
	private int price;
	private String human;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getHuman() {
		return human;
	}
	public void setHuman(String human) {
		this.human = human;
	}

}
