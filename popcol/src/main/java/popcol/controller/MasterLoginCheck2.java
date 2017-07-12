package popcol.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import popcol.model.Customer;
import popcol.service.CustomerService;

public class MasterLoginCheck2 implements HandlerInterceptor {
	@Autowired
	CustomerService cs = null;

	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session;

		session = request.getSession();
		String id = (String) session.getAttribute("master");

		if (id != null) {
			response.sendRedirect("adminList.do");

			return false;
		} 
		
		return true;
	}
}