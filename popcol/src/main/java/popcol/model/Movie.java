package popcol.model;

import java.sql.Date;

//영화
public class Movie {
	private int mid;
	private String mtitle;
	private String moriginaltitle;//원제
	private String mdirector;
	private String mactor;
	private String mcontent;
	private Date mreleaseDate;//개봉일
	private int mrunningTime;
	private String murlPreview;
	private String murlPoster;
	private String mgrade;//상영등급
	private String mnation;// 만든 나라
	private String mdel;
	private double bookingRate; //예매율

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}

	public String getMoriginaltitle() {
		return moriginaltitle;
	}

	public void setMoriginaltitle(String moriginaltitle) {
		this.moriginaltitle = moriginaltitle;
	}

	public String getMdirector() {
		return mdirector;
	}

	public void setMdirector(String mdirector) {
		this.mdirector = mdirector;
	}

	public String getMactor() {
		return mactor;
	}

	public void setMactor(String mactor) {
		this.mactor = mactor;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Date getMreleaseDate() {
		return mreleaseDate;
	}

	public void setMreleaseDate(Date mreleaseDate) {
		this.mreleaseDate = mreleaseDate;
	}

	public int getMrunningTime() {
		return mrunningTime;
	}

	public void setMrunningTime(int mrunningTime) {
		this.mrunningTime = mrunningTime;
	}

	public String getMurlPreview() {
		return murlPreview;
	}

	public void setMurlPreview(String murlPreview) {
		this.murlPreview = murlPreview;
	}

	public String getMurlPoster() {
		return murlPoster;
	}

	public void setMurlPoster(String murlPoster) {
		this.murlPoster = murlPoster;
	}

	public String getMgrade() {
		return mgrade;
	}

	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}

	public String getMnation() {
		return mnation;
	}

	public void setMnation(String mnation) {
		this.mnation = mnation;
	}

	public double getBookingRate() {
		return bookingRate;
	}

	public void setBookingRate(double bookingRate) {
		this.bookingRate = bookingRate;
	}

	public String getMdel() {
		return mdel;
	}

	public void setMdel(String mdel) {
		this.mdel = mdel;
	}
}
