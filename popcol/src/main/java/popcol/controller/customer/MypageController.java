package popcol.controller.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.service.customer.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService ms;
	
	@RequestMapping("mypage_Main")
	public String mypage_Main() {
		
		return "mypage_Main";
	}
}
