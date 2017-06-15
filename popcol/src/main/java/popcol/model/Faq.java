package popcol.model;

public class Faq {
	private int fid;
	private String fquestion;
	private String fanswer;
	private String fdel;
	
	/*페이징처리*/
	private int startRow;
	private int endRow;
	
	/*검색*/
	private String search;
	private String keyword;
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFquestion() {
		return fquestion;
	}
	public void setFquestion(String fquestion) {
		this.fquestion = fquestion;
	}
	public String getFanswer() {
		return fanswer;
	}
	public void setFanswer(String fanswer) {
		this.fanswer = fanswer;
	}
	public String getFdel() {
		return fdel;
	}
	public void setFdel(String fdel) {
		this.fdel = fdel;
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
