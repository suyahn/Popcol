package popcol.controller.customer;

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

import popcol.model.Customer;
import popcol.model.MypageBooking;
import popcol.model.Review;
import popcol.service.customer.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService ms;

	@RequestMapping("mypage_Main")
	public String mypage_Main(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);
		
		
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
	   myBookingList = ms.selectMyBookingListMain(id, oneMonthAgo);
	   
	   /*SimpleDateFormat df2 = new SimpleDateFormat("yyyy.MM.dd");
	   SimpleDateFormat df3 = new SimpleDateFormat("HH:mm");*/

	   for(MypageBooking mb : myBookingList) {
		   /*String theDate = df2.format(mb.getRtdate());
		   String theTime = df3.format(mb.getRtdate());*/
		   
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

			/*mb.setTheDate(theDate);
			mb.setTheTime(theTime);*/
			mb.setTheDay(theDay);
	   }
	   
	   List<MypageBooking> MyPriceSeatList = new ArrayList<MypageBooking>();
	   MyPriceSeatList = ms.selectMyPriceSeatList(id, oneMonthAgo);
	  
	   model.addAttribute("myBookingList", myBookingList);
	   model.addAttribute("MyPriceSeatList", MyPriceSeatList);
	   
	   //포인트조회
	   
	   //1:1문의조회
			   

		return "mypage_Main";
	}

	@RequestMapping("receivePoint")
	public String receivePoint(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = null;

		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			int result = ms.updateForBirthdayPoint(id);

			session.setAttribute("checkPoint", "y");

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
		Customer customer = ms.getSessionCustomerInfo(id);
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
	   myBookingList = ms.selectMyBookingList(id, oneMonthAgo);

	   for(MypageBooking mb : myBookingList) {
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
	   MyPriceSeatList = ms.selectMyPriceSeatList(id, oneMonthAgo);
	  
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
		int result = ms.deleteBooking(ticketnumber, id);
		model.addAttribute("result", result);
		
		return "cancelBooking";
	}
	
	
	
	// 내가 본 영화 보기
	/*@RequestMapping("mypage_seeMovie")
	public String mypage_seeMovie(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);
		
		// 상영일이 지난 내가 본 영화 리스트 가져오기
		List<MypageBooking> mySeeMovieList = new ArrayList<MypageBooking>();
		mySeeMovieList = ms.selectMySeeMovieList(id);
		
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat df3 = new SimpleDateFormat("HH:mm");
		Calendar c = Calendar.getInstance();
		
		for (MypageBooking mb : mySeeMovieList) {
			String theDate = df2.format(mb.getRtdate());
			String theTime = df3.format(mb.getRtdate());

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

			mb.setTheDate(theDate);
			mb.setTheTime(theTime);
			mb.setTheDay(theDay);
			
		}
		
		// 내가 쓴 리뷰 리스트 가져오기
		List<Review> myReviewList = new ArrayList<Review>();
		myReviewList = ms.selectMyReviewList(id);
		
		model.addAttribute("mySeeMovieList", mySeeMovieList);
		model.addAttribute("myReviewList", myReviewList);
		
		return "mypage_seeMovie";
	}*/
	
	@RequestMapping("mypage_seeMovie")
	public String mypage_seeMovie(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);
		
		// 상영일이 지난 내가 본 영화 리스트 가져오기
		List<MypageBooking> mySeeMovieList = ms.selectMySeeMovieList(id);
		
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
	
	@RequestMapping("mypage_Review")
	public String mypage_Review(Review review, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		review.setCid(id);
		
		System.out.println("mid : " + review.getMid());
		
		model.addAttribute("customer", customer);
		Review myReview = ms.selectReview(review);
		
		model.addAttribute("myReview", myReview);
		
		return "mypage_Review";
	}
	
	
	// 회원 정보 수정
	@RequestMapping("mypage_Modifyintro")
	public String mypage_Modifyintro(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);
		
		return "mypage_Modifyintro";
	}

	
	// 회원 탈퇴
	@RequestMapping("mypage_myInfoModifyForm")
	public String mypage_myInfoModifyForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);

		return "mypage_myInfoModifyForm";
	}
	
	@RequestMapping("mypage_myInfoModify")
	public String mypage_myInfoModify(Customer customer, Model model) {
		int result = ms.updateCustomerInfo(customer);
		
		model.addAttribute("result", result);
		
		return "mypage_myInfoModify";
	}
	
	@RequestMapping("mypage_byePopcolForm")
	public String mypage_byePopcolForm(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);
		
		return "mypage_byePopcolForm";
	}
	
	@RequestMapping("mypage_byePopcol")
	public String mypage_byePopcol(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		int result = ms.deleteCutomerInfo(id);
		
		if (result > 0) {
			session.invalidate();
		}
		
		model.addAttribute("result", result);
		
		return "mypage_byePopcol";
	}
}
