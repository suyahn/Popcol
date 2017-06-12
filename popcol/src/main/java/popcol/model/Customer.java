package popcol.model;

import java.sql.Date;

public class Customer {
	private String cid;
	private String cname;
	private String cpassword;
	private String cemail;
	private String cphone;
	private int cpoint;
	private String cde;
	private Date creg_date;
	private Date cbirthday;

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCpassword() {
		return cpassword;
	}

	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}

	public String getCemail() {
		return cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public int getCpoint() {
		return cpoint;
	}

	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}

	public String getCde() {
		return cde;
	}

	public void setCde(String cde) {
		this.cde = cde;
	}

	public Date getCreg_date() {
		return creg_date;
	}

	public void setCreg_date(Date creg_date) {
		this.creg_date = creg_date;
	}

	public Date getCbirthday() {
		return cbirthday;
	}

	public void setCbirthday(Date cbirthday) {
		this.cbirthday = cbirthday;
	}
}
