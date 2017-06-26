package popcol.model;

import java.sql.Date;

public class Event {
	private int eid;
	private String esubject;
	private String econtent;
	private String epicture;
	private Date eclosingdate;
	private Date estartingdate;
	private String edel;
	
	/*페이징처리*/
	private int startRow;
	private int endRow;
	
	/*검색*/
	private String search;
	private String keyword;
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEsubject() {
		return esubject;
	}
	public void setEsubject(String esubject) {
		this.esubject = esubject;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public String getEpicture() {
		return epicture;
	}
	public void setEpicture(String epicture) {
		this.epicture = epicture;
	}
	public Date getEclosingdate() {
		return eclosingdate;
	}
	public void setEclosingdate(Date eclosingdate) {
		this.eclosingdate = eclosingdate;
	}
	public Date getEstartingdate() {
		return estartingdate;
	}
	public void setEstartingdate(Date estartingdate) {
		this.estartingdate = estartingdate;
	}
	public String getEdel() {
		return edel;
	}
	public void setEdel(String edel) {
		this.edel = edel;
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
