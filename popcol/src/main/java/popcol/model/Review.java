package popcol.model;

import java.sql.Date;

public class Review {
	private int rid;
	private int mid;
	private String cid;
	private String rcontent;
	private String rvaluation;
	private Date rdate;
	private String rdel;
	
	/*페이징처리*/
	private int startRow;
	private int endRow;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRvaluation() {
		return rvaluation;
	}

	public void setRvaluation(String rvaluation) {
		this.rvaluation = rvaluation;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRdel() {
		return rdel;
	}

	public void setRdel(String rdel) {
		this.rdel = rdel;
	}
	
	/*페이징처리*/
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}
