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
	
}
