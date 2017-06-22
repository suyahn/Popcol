package popcol.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Qna;
import popcol.model.Review;
import popcol.model.Point;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.LocationService;
import popcol.service.MovieService;
import popcol.service.MypageBookingService;
import popcol.service.PagingPgm;
import popcol.service.QnaService;
import popcol.service.ReviewService;

@Controller
public class MypageController {
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

	@RequestMapping("mypage_Main")
	public String mypage_Main(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 예매 내역 2~3건
		// 1개월 간의 예매내역만 출력
		// 1개월 전 날짜 구하기
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		String today = df.format(new java.util.Date());

		Calendar c = Calendar.getInstance();
		c.setTime(df.parse(today));
		c.add(Calendar.MONTH, -1);
		String oneMonthAgo = df.format(c.getTime());

		List<MypageBooking> myBookingList = new ArrayList<MypageBooking>();
		myBookingList = mbs.selectMyBookingListMain(id, oneMonthAgo);

		/*
		 * SimpleDateFormat df2 = new SimpleDateFormat("yyyy.MM.dd");
		 * SimpleDateFormat df3 = new SimpleDateFormat("HH:mm");
		 */

		for (MypageBooking mb : myBookingList) {
			/*
			 * String theDate = df2.format(mb.getRtdate()); String theTime =
			 * df3.format(mb.getRtdate());
			 */

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

			/*
			 * mb.setTheDate(theDate); mb.setTheTime(theTime);
			 */
			mb.setTheDay(theDay);
		}

		List<MypageBooking> MyPriceSeatList = new ArrayList<MypageBooking>();
		MyPriceSeatList = mbs.selectMyPriceSeatList(id, oneMonthAgo);

		model.addAttribute("myBookingList", myBookingList);
		model.addAttribute("MyPriceSeatList", MyPriceSeatList);

		// 포인트조회

		// 1:1문의조회
		List<Qna> myQnaList = qs.mypage_listMain(id);

		model.addAttribute("myQnaList", myQnaList);
		
		return "mypage_Main";
	}

	@RequestMapping("receivePoint")
	public String receivePoint(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = null;

		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			int result = cs.updateForBirthdayPoint(id);

			if(result > 0) {
				session.setAttribute("checkPoint", "y");
				cs.giveBirthdayPoint(id);
			}
			model.addAttribute("result", result);
		}

		return "receivePoint";
	}

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

		for (MypageBooking mb : myBookingList) {
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
		
		int result = bs.deleteBooking(ticketnumber, id);
		
		if (result > 0) {
			cs.deletePointContent(ticketnumber, id);
		}
		
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
	
	// 포인트 조회
	@RequestMapping("mypage_myPoint")
	public String mypage_myPoint(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		List<Point> pointList = cs.selectPointList(id);
		System.out.println("크기1 : " + pointList.size());
		List<Location> location = ls.selectPointLocation();
		System.out.println("크기2 : " + location.size());
		
		for(Point p : pointList) {
			System.out.println("pid : " + p.getPid());
			
			for(Location l : location) {
				if(p.getLid() == l.getLid())
					p.setLname(l.getLname());
			}
		}
		
		model.addAttribute("pointList", pointList);
		
		return "mypage_myPoint";
	}
	

	// 회원 정보 수정
	@RequestMapping("mypage_myInfoModifyintro")
	public String mypage_Modifyintro(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		// 회원정보 수정 전 비밀번호 체크를 위한 것
		Customer customer = cs.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);

		return "mypage_myInfoModifyintro";
	}

	@RequestMapping("mypage_myInfoModifyForm")
	public String mypage_myInfoModifyForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);

		return "mypage_myInfoModifyForm";
	}

	@RequestMapping("mypage_myInfoModify")
	public String mypage_myInfoModify(Customer customer, Model model) {
		int result = cs.updateCustomerInfo(customer);

		model.addAttribute("result", result);

		return "mypage_myInfoModify";
	}

	// 회원 탈퇴
	@RequestMapping("mypage_byePopcolForm")
	public String mypage_byePopcolForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);

		return "mypage_byePopcolForm";
	}

	@RequestMapping("mypage_byePopcol")
	public String mypage_byePopcol(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = cs.deleteCutomerInfo(id);

		if (result > 0) {
			session.invalidate();
		}

		model.addAttribute("result", result);

		return "mypage_byePopcol";
	}

	// 1:1 문의
	@RequestMapping("mypage_myQna")
	public String mypage_myQna(String pageNum, Qna qna, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 문의게시판 페이징
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = qs.mypage_getTotal(id);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		qna.setCid(id);
		List<Qna> mypageQnaList = qs.mypage_list(qna);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("qnalist", mypageQnaList);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);

		return "mypage_myQna";
	}

	@RequestMapping("mypage_myQnaShow")
	public String mypage_myQnaShow(int qid, String pageNum, Model model) {
		Qna mypageQna = qs.mypage_qnaShow(qid);

		model.addAttribute("qna", mypageQna);
		model.addAttribute("pageNum", pageNum);

		return "mypage_myQnaShow";
	}

	@RequestMapping("mypage_myQnaDelete")
	public String mypage_myQnaDelete(@RequestParam(value="qid",required=true) List<Integer> qid, String pageNum, Model model) {
		int result = 0;
		int r1 = 0;
		
		for (int i = 0; i < qid.size(); i++) {
			int r2 = qs.mypage_qnaDelete(qid.get(i));
			r1 = r1 + r2;
		}
		
		if (r1 == qid.size()) {
			result = 1;
		}
		
		model.addAttribute("result", result);

		if (pageNum != null) {
			model.addAttribute("pageNum", pageNum);
		}

		return "mypage_myQnaDelete";
	}
	
	@RequestMapping("pointPage")
	public String navigation(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);
		
		return "pointPage";
	}
}
