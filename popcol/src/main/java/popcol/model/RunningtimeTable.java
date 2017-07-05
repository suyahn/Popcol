package popcol.model;

import java.sql.Date;

public class RunningtimeTable {
	private int rtid;
	private int lid;
	private int tid;
	private int mid;
	private Date rtdate;
	private String timezone;
	private String rttime;
	private String mtitle;
	private String lname;
	private String tname;
	private String mrunningtime;
	private String mgrade;
	private int seats;

	public String getMrunningtime() {
		return mrunningtime;
	}
	public void setMrunningtime(String mrunningtime) {
		this.mrunningtime = mrunningtime;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
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
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
}
