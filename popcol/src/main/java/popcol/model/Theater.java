package popcol.model;
//상영관
public class Theater {
	private int tid;
	private String tname;
	private int lid;//영화관 아이디
	private String tseat;
	private String lname;//영화관 이름

	public int getTid() {
		return tid;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getTseat() {
		return tseat;
	}

	public void setTseat(String tseat) {
		this.tseat = tseat;
	}
}
