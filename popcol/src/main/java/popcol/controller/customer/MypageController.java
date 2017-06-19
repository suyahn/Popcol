package popcol.controller.customer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Booking;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.model.Theater;
import popcol.service.customer.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService ms;

	@RequestMapping("mypage_Main")
	public String mypage_Main(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);

		model.addAttribute("customer", customer);

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
		
		// 1개월 전 날짜 구하기
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		String today = df.format(new java.util.Date());
		
	    Calendar c = Calendar.getInstance();
	    c.setTime(df.parse(today));
	    c.add(Calendar.MONTH, -1);
	    String oneMonthAgo = df.format(c.getTime());  
	    
	   List<MypageBooking> myBookingList = new ArrayList<MypageBooking>();
	   myBookingList = ms.selectMyBookingList(id, oneMonthAgo);
	   
	   SimpleDateFormat df2 = new SimpleDateFormat("yyyy년 MM월 dd일");
	   SimpleDateFormat df3 = new SimpleDateFormat("HH시 mm분");

	   for(MypageBooking mb : myBookingList) {
		   String theDate = df2.format(mb.getRtdate());
		   String theTime = df3.format(mb.getRtdate());
		   
		   mb.setTheDate(theDate);
		   mb.setTheTime(theTime);
	   }
	   
	   List<MypageBooking> MyPriceSeatList = new ArrayList<MypageBooking>();
	   MyPriceSeatList = ms.selectMyPriceSeatList(id, oneMonthAgo);
	  
	   model.addAttribute("myBookingList", myBookingList);
	   model.addAttribute("MyPriceSeatList", MyPriceSeatList);
	   model.addAttribute("today", today);
	   
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
