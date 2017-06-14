package popcol.model;

import java.sql.Date;

public class Notice {
	private int nid;
	private String nsubject;
	private String ncontent;
	private Date ndate;
	private String ndel;
	
	/*페이징처리*/
	private int startRow;
	private int endRow;
	
	/*검색*/
	private String search;
	private String keyword;
	
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
	
	/*검색*/
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
