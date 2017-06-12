package popcol.model;

import java.sql.Date;

public class Notice {
	private int nid;
	private String nsubject;
	private String ncontent;
	private Date ndate;
	private String ndel;
	
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNsubject() {
		return nsubject;
	}
	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getNdel() {
		return ndel;
	}
	public void setNdel(String ndel) {
		this.ndel = ndel;
	}
}
