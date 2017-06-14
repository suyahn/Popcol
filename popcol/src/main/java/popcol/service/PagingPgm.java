package popcol.service;

public class PagingPgm {
	private int total;
	private int ROW_PER_PAGE;
	private int PAGE_PER_BLOCK = 10;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totPage;
	
	public PagingPgm(int total, int ROW_PER_PAGE, int currentPage) {
		this.total = total;
		this.ROW_PER_PAGE = ROW_PER_PAGE;
		this.currentPage = currentPage;
		
		totPage = (int) Math.ceil((double) this.total / this.ROW_PER_PAGE);
		startPage = this.currentPage - (this.currentPage - 1) % PAGE_PER_BLOCK;
		endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totPage) {
			endPage = totPage;
		}
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getROW_PER_PAGE() {
		return ROW_PER_PAGE;
	}

	public void setROW_PER_PAGE(int rOW_PER_PAGE) {
		ROW_PER_PAGE = rOW_PER_PAGE;
	}

	public int getPAGE_PER_BLOCK() {
		return PAGE_PER_BLOCK;
	}

	public void setPAGE_PER_BLOCK(int pAGE_PER_BLOCK) {
		PAGE_PER_BLOCK = pAGE_PER_BLOCK;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
}
