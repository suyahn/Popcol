package popcol.model;

import java.sql.Date;

public class RunningtimeTable {
	private int rtid;
	private int pid;
	private int lid;
	private int tid;
	private int mid;
	private Date rtdate;
	private String rttime;
	
	public String getRttime() {
		return rttime;
	}
	public void setRttime(String rttime) {
		this.rttime = rttime;
	}
	public int getRtid() {
		return rtid;
	}
	public void setRtid(int rtid) {
		this.rtid = rtid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public Date getRtdate() {
		return rtdate;
	}
	public void setRtdate(Date rtdate) {
		this.rtdate = rtdate;
	}
}
