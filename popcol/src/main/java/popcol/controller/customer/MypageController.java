package popcol.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Customer;
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

	@RequestMapping("mypage_Home")
	public String mypage_Home() {

		return "mypage_Home";
	}
	
	@RequestMapping("mypage_Modifyintro")
	public String mypage_Modifyintro(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Customer customer = ms.getSessionCustomerInfo(id);
		
		model.addAttribute("customer", customer);
		
		return "mypage_Modifyintro";
	}

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
}
