package popcol.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Customer;
import popcol.model.MypageBooking;
import popcol.model.Point;
import popcol.model.Qna;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.LocationService;
import popcol.service.MovieService;
import popcol.service.MypageBookingService;
import popcol.service.PointService;
import popcol.service.QnaService;
import popcol.service.ReviewService;

@Controller
public class Mypage_MainController {
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
	
	@RequestMapping("mypage_Main")
	public String mypage_Main(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 예매 내역 2~3건
		// 1개월 간의 예매내역만 출력
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
		myBookingList = mbs.selectMyBookingListMain(id, oneMonthAgo);
		
		//List<List<Point>> pointList = new ArrayList<List<Point>>();
		HashSet<String> ticketnumber = new HashSet<String>();
		List<Point> pointList = new ArrayList<Point>();
		
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
			
			// 포인트를 위한 티켓넘버
			ticketnumber.add(mb.getTicketnumber());
		}
		
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
		model.addAttribute("today", today);

		// 포인트조회
		List<Point> myPointList = ps.mypage_listMain(id);
		model.addAttribute("myPointList", myPointList);

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
				ps.giveBirthdayPoint(id);
			}
			model.addAttribute("result", result);
		}

		return "receivePoint";
	}
	
	@RequestMapping("pointPage")
	public String navigation(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);
		
		return "pointPage";
	}
	
	// 회원 정보 수정
	@RequestMapping("mypage_myInfoModifyintro")
	public String mypage_Modifyintro() {
		return "mypage_myInfoModifyintro";
	}
	
	@RequestMapping("mypage_myInfoModifyPasswordChk")
	public String mypage_myInfoModifyPasswordChk(Customer customer, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		customer.setCid(id);
		int result = cs.loginCheck(customer);
		
		if(result <= 0) {
			model.addAttribute("result", result);
			return "mypage_myInfoModifyintro";
		} else {
			return "mypage_myInfoModifyForm";
		}
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
		try {
			customer.setCpassword(CustomerController.getEncPassword(customer.getCpassword()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
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
	
	@RequestMapping("mypage_byePopcolPasswordChk")
	public String mypage_byePopcolPasswordChk(Customer customer, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String)session.getAttribute("id");
		customer.setCid(id);
		int result = cs.loginCheck(customer);
		
		if(result <= 0) {
			customer = cs.getSessionCustomerInfo(id);

			model.addAttribute("customer", customer);
			model.addAttribute("result", result);
			
			return "mypage_byePopcolForm";
		} else {
			return "redirect:mypage_byePopcol.do";
		}
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
}
