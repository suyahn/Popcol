package popcol.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Customer;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Point;
import popcol.model.Review;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.LocationService;
import popcol.service.MovieService;
import popcol.service.MypageBookingService;
import popcol.service.PointService;
import popcol.service.QnaService;
import popcol.service.ReviewService;

@Controller
public class Mypage_MovieController {
	@Autowired
	CustomerService cs;
	@Autowired
	MypageBookingService mbs;
	@Autowired
	BookingService bs;
	@Autowired
	ReviewService rs;
	@Autowired
	MovieService ms;
	@Autowired
	QnaService qs;
	@Autowired
	LocationService ls;
	@Autowired
	PointService ps;

	// 예매내역 보기
	@RequestMapping("mypage_reservation")
	public String mypage_reservation(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		// 1개월 간의 예매내역만 출력
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id);
		model.addAttribute("customer", customer);

		// 1개월 전 날짜 구하기
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		String today = df.format(new java.util.Date());

		SimpleDateFormat df6 = new SimpleDateFormat("yyyy-MM-dd");
		String today6 = df6.format(new java.util.Date());

		Calendar c = Calendar.getInstance();
		c.setTime(df.parse(today));
		c.add(Calendar.MONTH, -1);
		String oneMonthAgo = df.format(c.getTime());

		List<MypageBooking> myBookingList = new ArrayList<MypageBooking>();
		myBookingList = mbs.selectMyBookingList(id, oneMonthAgo);
		
		//List<List<Point>> pointList = new ArrayList<List<Point>>();
		//HashSet<String> ticketnumber = new HashSet<String>();
		List<Point> pointList = new ArrayList<Point>();
		if(myBookingList.size() != 0) {
		for (MypageBooking mb : myBookingList) {
			/*System.out.println("rtdateww : " + mb.getTheDate());
			String rtdate1 = df6.format(mb.getRtdate());
			System.out.println("rtdate1 : " + rtdate1);
			Date  rtdate2 = (Date) df6.parse(rtdate1);
			System.out.println("rtdate2 : " + rtdate2);
			c.setTime(rtdate2);*/
			c.setTime(mb.getRtdate());
			int dayNum = c.get(Calendar.DAY_OF_WEEK);
			String theDay = "";

			switch (dayNum) {
			case 1:
				theDay = "일";
				break;
			case 2:
				theDay = "월";
				break;
			case 3:
				theDay = "화";
				break;
			case 4:
				theDay = "수";
				break;
			case 5:
				theDay = "목";
				break;
			case 6:
				theDay = "금";
				break;
			case 7:
				theDay = "토";
				break;

			}
			mb.setTheDay(theDay);
			
			// 포인트를 위한 티켓넘버
			// ticketnumber.add(mb.getTicketnumber());
		}}
		
		// 포인트 리스트
		/*Iterator<String> itr = ticketnumber.iterator();
		while(itr.hasNext()) {
			String ticknum = (String) itr.next(); 
			List<Point> p = ps.selectPointForBookingList(ticknum, id);
			
			pointList.add(p);
		}*/
		
		pointList = ps.selectUsePointList(id);
		
		model.addAttribute("pointList", pointList);

		List<MypageBooking> MyPriceSeatList = new ArrayList<MypageBooking>();
		MyPriceSeatList = mbs.selectMyPriceSeatList(id, oneMonthAgo);

		model.addAttribute("myBookingList", myBookingList);
		model.addAttribute("MyPriceSeatList", MyPriceSeatList);
		model.addAttribute("today", today6);

		return "mypage_reservation";
	}

	// 영화 예매 취소
	@RequestMapping("cancelBooking")
	public String cancelBooking(String ticketnumber, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		Customer customer = new Customer();
		customer.setCid(id);
		
		// 예매번호가 같은 포인트 테이블에있는애들 다 받아와서 하기
		List<Point> pointList = ps.selectPointForCancel(ticketnumber, id);
		
		for(Point p : pointList) {
			if (p.getPsort().equals("사용")) {
				
				customer.setCpoint(p.getPpoint());
				cs.returnPointForCancel(customer);
			} else if(p.getPsort().equals("매표")) {
				

				customer.setCpoint(-p.getPpoint());
				cs.returnPointForCancel(customer);
			}
		}
		
		/*// 예매할 때 사용한 포인트 돌려주기(더해주기)
		int point = ps.selectUsePoint(ticketnumber, id);
		
		if(point > 0) {
			customer.setCpoint(point);
			
			cs.returnPointForCancel(customer);
		}
		
		// 예매할 때 받은 포인트 돌려주기(빼주기)
		point = ps.selectReceivePoint(ticketnumber, id);
		System.out.println("point2 : " + -point);
		customer.setCpoint(-point);
		cs.returnPointForCancel(customer);*/
		
		ps.deletePointContent(ticketnumber, id);
			
		int result = bs.deleteBooking(ticketnumber, id);
		
		model.addAttribute("result", result);

		return "cancelBooking";
	}

	// 내가 본 영화 보기
	/*
	 * @RequestMapping("mypage_seeMovie") public String mypage_seeMovie(Model
	 * model, HttpSession session, HttpServletRequest request) { session =
	 * request.getSession(); String id = (String) session.getAttribute("id");
	 * Customer customer = ms.getSessionCustomerInfo(id);
	 * 
	 * model.addAttribute("customer", customer);
	 * 
	 * // 상영일이 지난 내가 본 영화 리스트 가져오기 List<MypageBooking> mySeeMovieList = new
	 * ArrayList<MypageBooking>(); mySeeMovieList = ms.selectMySeeMovieList(id);
	 * 
	 * SimpleDateFormat df2 = new SimpleDateFormat("yyyy.MM.dd");
	 * SimpleDateFormat df3 = new SimpleDateFormat("HH:mm"); Calendar c =
	 * Calendar.getInstance();
	 * 
	 * for (MypageBooking mb : mySeeMovieList) { String theDate =
	 * df2.format(mb.getRtdate()); String theTime = df3.format(mb.getRtdate());
	 * 
	 * c.setTime(mb.getRtdate()); int dayNum = c.get(Calendar.DAY_OF_WEEK);
	 * String theDay = "";
	 * 
	 * switch (dayNum) { case 1: theDay = "일"; break; case 2: theDay = "월";
	 * break; case 3: theDay = "화"; break; case 4: theDay = "수"; break; case 5:
	 * theDay = "목"; break; case 6: theDay = "금"; break; case 7: theDay = "토";
	 * break;
	 * 
	 * }
	 * 
	 * mb.setTheDate(theDate); mb.setTheTime(theTime); mb.setTheDay(theDay);
	 * 
	 * }
	 * 
	 * // 내가 쓴 리뷰 리스트 가져오기 List<Review> myReviewList = new ArrayList<Review>();
	 * myReviewList = ms.selectMyReviewList(id);
	 * 
	 * model.addAttribute("mySeeMovieList", mySeeMovieList);
	 * model.addAttribute("myReviewList", myReviewList);
	 * 
	 * return "mypage_seeMovie"; }
	 */

	@RequestMapping("mypage_seeMovie")
	public String mypage_seeMovie(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 상영일이 지난 내가 본 영화 리스트 가져오기
		List<MypageBooking> mySeeMovieList = mbs.selectMySeeMovieList(id);

		Calendar c = Calendar.getInstance();

		for (MypageBooking mb : mySeeMovieList) {
			c.setTime(mb.getRtdate());
			int dayNum = c.get(Calendar.DAY_OF_WEEK);
			String theDay = "";

			switch (dayNum) {
			case 1:
				theDay = "일";
				break;
			case 2:
				theDay = "월";
				break;
			case 3:
				theDay = "화";
				break;
			case 4:
				theDay = "수";
				break;
			case 5:
				theDay = "목";
				break;
			case 6:
				theDay = "금";
				break;
			case 7:
				theDay = "토";
				break;

			}

			mb.setTheDay(theDay);

		}

		model.addAttribute("mySeeMovieList", mySeeMovieList);

		return "mypage_seeMovie";
	}

	// 리뷰
	@RequestMapping("mypage_Review")
	public String mypage_Review(Review review, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		review.setCid(id);

		Review myReview = rs.selectReview(review);

		if (myReview != null)
			model.addAttribute("myReview", myReview);
		else
			model.addAttribute("mid", review.getMid());

		return "mypage_Review";
	}

	@RequestMapping("mypage_reviewShow")
	public String mypage_showReview(Review review, Model model) {
		// 리뷰 보여주는것인데 업데이트 폼 불러오는 거랑 똑같아서 그냥 씀
		Review modifyReview = rs.selectReviewForUpdate(review);
		model.addAttribute("review", modifyReview);

		Movie movie = ms.selectMovieForReview(review.getMid());
		model.addAttribute("movie", movie);

		return "mypage_reviewShow";
	}

	@RequestMapping("mypage_reviewWriteForm")
	public String mypage_reviewForm(String mid, Model model) {
		model.addAttribute("mid", mid);

		return "mypage_reviewWriteForm";
	}

	@RequestMapping("mypage_reviewWrite")
	public String mypage_writeReview(Review review, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		review.setCid(id);

		int result = rs.insertReview(review);
		model.addAttribute("result", result);

		return "mypage_reviewWrite";
	}

	@RequestMapping("mypage_reviewModifyForm")
	public String mypage_reviewModifyForm(Review review, Model model) {
		Review modifyReview = rs.selectReviewForUpdate(review);
		model.addAttribute("review", modifyReview);

		return "mypage_reviewModifyForm";
	}

	@RequestMapping("mypage_reviewMoify")
	public String mypage_modifyReview(Review review, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		review.setCid(id);

		int result = rs.updateReview(review);
		model.addAttribute("result", result);

		return "mypage_reviewMoify";
	}

	@RequestMapping("mypage_reviewDelete")
	public String mypage_deleteReview(Review review, Model model) {
		int result = rs.deleteReview(review);
		model.addAttribute("result", result);

		return "mypage_reviewDelete";
	}
}
