package popcol.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Customer;
import popcol.model.Movie;
import popcol.service.CustomerService;
import popcol.service.MovieService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;
	@Autowired
	private MovieService ms;

	@RequestMapping("home")
	public String home(Model model, HttpSession session) {
		// 1월 1일에는 생일체크를 초기화해서 'n'으로 바꿔 생일에 포인트를 받을 수 있게 한다.
		SimpleDateFormat df = new SimpleDateFormat("MM/dd");
		String today = df.format(new java.util.Date());
		
		if (today.equals("01/01")) {
			cs.updateForbirthday();
		}
		
		Movie randomMovie = ms.selectRunningMovieRandom();
		model.addAttribute("movie", randomMovie);
		 
		return "home";
	}

	// 로그인

	@RequestMapping("loginForm")
	public String loginForm() {

		return "loginForm";
	}

	@RequestMapping("login")
	public String login(Customer customer, Model model, HttpServletRequest request, HttpSession session) {
		// 1. id체크 2. id가 있으면 비밀번호 체크/ id가 없으면 없는 아이디입니다~ 출력 3. 비밀번호가 일치하면 로그인
		// 성공!/ 비밀번호가 일치하지 않으면 로그인 실패!

		int result = cs.loginCheck(customer);
		model.addAttribute("result", result);

		session = request.getSession();

		if (result > 0) {
			String id = customer.getCid();
			Customer sessionCustomer = cs.getSessionCustomerInfo(id);
			String name = sessionCustomer.getCname();

			session.setAttribute("id", id);
			session.setAttribute("name", name);

			// 생일인지 확인하기
			Date birthday = sessionCustomer.getCbirthday();
			SimpleDateFormat df = new SimpleDateFormat("MM/dd");
			String today = df.format(new java.util.Date());
			String birthdayString = df.format(birthday);

			if (birthdayString.equals(today)) {
				int random = (int) ((double) Math.random() * 8 + 1);
				session.setAttribute("birthday", 1);	
				session.setAttribute("random", random); // 폭죽사진 랜덤으로
				session.setAttribute("checkPoint", sessionCustomer.getCcheckbd());
			}

		} else if (result <= 0) {
			return "loginForm";
		}

		return "login";
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.invalidate();

		return "redirect:home.do";
	}

	// 회원가입

	@RequestMapping("joinmain")
	public String joinmain() {

		return "joinmain";
	}

	@RequestMapping("joinCheckForm")
	public String joinCheckForm() {

		return "joinCheckForm";
	}

	@RequestMapping("joinCheck")
	public String joinCheck(Customer customer, String cbirthdaystring, Model model) {
		customer.setCbirthday(Date.valueOf(cbirthdaystring));
		Customer checkCustomer = cs.joinCheck(customer);
		int result = 0;

		if (checkCustomer != null) {
			result = 1;
			model.addAttribute("customer", checkCustomer);
		}

		model.addAttribute("result", result);

		return "joinCheck";
	}

	@RequestMapping("joinForm")
	public String joinForm() {

		return "joinForm";
	}

	@RequestMapping("idDupCheck")
	public String idDupCheck(String cid, Model model) {
		Customer idDupCheck = cs.idDupCheck(cid);
		int result = 0;

		if (idDupCheck == null) {
			result = 1;
			model.addAttribute("result", result);
		} else {
			result = 0;
			model.addAttribute("result", result);
		}

		return "idDupCheck";
	}

	@RequestMapping("join")
	public String join(Customer customer, String cbirthdaystring, Model model) {
		customer.setCbirthday(Date.valueOf(cbirthdaystring));
		int result = cs.insertCustomer(customer);
		
		if (result > 0) {
			cs.giveJoinPoint(customer.getCid());
		}

		model.addAttribute("result", result);

		return "join";
	}

	// 아이디, 패스워드 찾기

	@RequestMapping("findForm")
	public String findForm() {

		return "findForm";
	}

	@RequestMapping("findId")
	public String findId(Customer customer, String cbirthdaystring, Model model) {
		customer.setCbirthday(Date.valueOf(cbirthdaystring));
		String customerId = cs.findCustomerId(customer);
		int result = 0;

		if (customerId != null) {
			result = 1;
			model.addAttribute("customerId", customerId);
		} else {
			result = 0;
		}

		model.addAttribute("result", result);

		return "findId";
	}

	@RequestMapping("findPasswordForm")
	public String findPasswordForm() {

		return "findPasswordForm";
	}

	@RequestMapping("findPassword")
	public String findPassword(Customer customer, Model model) {
		Customer checkCustomer = cs.findCustomerPassword(customer);
		int result = 0;

		if (checkCustomer != null) {
			result = 1;
			model.addAttribute("customer", checkCustomer);
		} else {
			result = 0;
		}

		model.addAttribute("result", result);

		return "findPassword";
	}

	@RequestMapping("findPassword_changePassword")
	public String findPassword_changePassword(Customer customer, Model model) {
		int result = cs.updateFindPassword(customer);

		model.addAttribute("result", result);

		return "findPassword_changePassword";
	}
}
