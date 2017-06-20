package popcol.model;

public class Qna {
	private int qid;
	private String qsubject;
	private String qcontent;
	private String qreplycontent;
	private String qdate;
	private String cid;
	private String qdel;
	private String cname;
	
	/*페이징처리*/
	private int startRow;
	private int endRow;
	
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQsubject() {
		return qsubject;
	}
	public void setQsubject(String qsubject) {
		this.qsubject = qsubject;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQreplycontent() {
		return qreplycontent;
	}
	public void setQreplycontent(String qreplycontent) {
		this.qreplycontent = qreplycontent;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getQdel() {
		return qdel;
	}
	public void setQdel(String qdel) {
		this.qdel = qdel;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
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
