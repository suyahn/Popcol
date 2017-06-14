package popcol.controller.customer;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Customer;
import popcol.service.customer.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService cs;

	@RequestMapping("home")
	public String home(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id != null) {
			Customer customer = cs.getSessionInfo(id);

			model.addAttribute("id", id);
			model.addAttribute("customer", customer);
		}

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
			session.setAttribute("id", customer.getCid());
		}

		if (result <= 0) {
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
		
		if(idDupCheck == null) {
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
		
		if(customerId != null) {
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
		
		if(checkCustomer != null) {
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
