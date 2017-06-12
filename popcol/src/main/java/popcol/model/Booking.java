package popcol.model;

import java.sql.Date;

public class Booking {
	private int bid;
	private String cid;
	private int lid;
	private int tid;
	private int mid;
	private int rtid;
	private String ticketnumber;
	private int pid;
	private String bseat;
	private Date bdate;
	private String bdel;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
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
	public int getRtid() {
		return rtid;
	}
	public void setRtid(int rtid) {
		this.rtid = rtid;
	}
	public String getTicketnumber() {
		return ticketnumber;
	}
	public void setTicketnumber(String ticketnumber) {
		this.ticketnumber = ticketnumber;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getBseat() {
		return bseat;
	}
	public void setBseat(String bseat) {
		this.bseat = bseat;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBdel() {
		return bdel;
	}
	public void setBdel(String bdel) {
		this.bdel = bdel;
	}

}
