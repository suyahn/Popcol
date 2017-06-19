package popcol.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.service.PagingPgm;
import popcol.service.customer.CustomerService;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.service.location.LocationService;
import popcol.service.movie.MovieService;
import popcol.service.theater.TheaterService;

@Controller
public class AdminController {

	@Autowired
	private LocationService ls;
	@Autowired
	private CustomerService cs;
	@Autowired
	private MovieService ms;
	/*
	 * @Autowired private TheaterService ts;
	 */

	/* 로그인 */
	@RequestMapping("adminLoginForm")
	public String adminLoginForm() {

		return "adminLoginForm";
	}

	@RequestMapping("adminLogin")
	public String adminLogin(Customer customer, Model model, HttpServletRequest request, HttpSession session) {
		// 1. id체크 2. id가 있으면 비밀번호 체크/ id가 없으면 없는 아이디입니다~ 출력 3. 비밀번호가 일치하면 로그인
		// 성공!/ 비밀번호가 일치하지 않으면 로그인 실패!

		int result = cs.loginCheck(customer);
		model.addAttribute("result", result);

		session = request.getSession();

		if (result > 0) {
			session.setAttribute("id", customer.getCid());
		}

		if (result <= 0) {
			return "adminLoginForm";
		}

		return "adminLogin";
	}

	@RequestMapping("adminLogout")
	public String adminLogout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.invalidate();

		return "redirect:adminLoginForm.do";
	}

	/* 관리자 영화 관리 */
	@RequestMapping("adminList") // 관리자 페이지의 무비리스트
	public String adminList(String pageNum, Model model) {
		final int ROW_PER_PAGE = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = ms.getTotal();
		/* int total = bs.getTotal(board); // 검색 */
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);
		/*
		 * board.setStartRow(startRow); board.setEndRow(endRow);
		 */
		List<Movie> adminList = ms.adminList(startRow, endRow);
		int no = total - startRow + 1;

		/* List<Movie> adminList = ms.adminList(); */
		model.addAttribute("adminList", adminList);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "adminList";
	}

	@RequestMapping("adminInsertForm") // 관리자 영화 입력 페이지
	public String adminInsert(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);

		return "adminInsertForm";

	}

	@RequestMapping("adminInsert") // 관리자 영화 입력
	public String adminInsert(Model model, Movie movie, String pageNum) {
		int result = ms.adminInsert(movie);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminInsert";

	}

	@RequestMapping("adminView") // 관리자 영화 상세 보기
	public String adminView(int mid, Model model, String pageNum) {
		Movie movie = ms.adminSelect(mid);

		model.addAttribute("movie", movie);
		model.addAttribute("pageNum", pageNum);
		return "adminView";

	}

	@RequestMapping("adminUpdateForm")
	public String adminUpdateForm(int mid, Model model, String pageNum) {
		Movie movie = ms.adminSelect(mid);

		model.addAttribute("movie", movie);
		model.addAttribute("pageNum", pageNum);
		return "adminUpdateForm";

	}

	@RequestMapping("adminUpdate") // 관리자 영화 수정
	public String adminUpdate(Model model, Movie movie, String pageNum) {
		int result = ms.adminUpdate(movie);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminUpdate";

	}

	@RequestMapping("adminDelete") // 관리자 영화 삭제
	public String adminDelete(int mid, Model model, String pageNum) {
		int result = ms.adminDelete(mid);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminDelete";

	}

	/* 관리자 영화관 관리 */

	@RequestMapping("adminLocationList") // 관리자 영화관리스트
	public String adminLocationList(Model model) {
		List<Location> locationList = ls.adminLocationList();
		model.addAttribute("locationList", locationList);

		return "adminLocationList";
	}

	@RequestMapping("adminLocationInsertForm") // 관리자 영화관 입력 페이지
	public String adminLocationInsertForm() {

		return "adminLocationInsertForm";

	}

	@RequestMapping("adminLocationInsert") // 관리자 영화관 입력
	public String adminLocationInsert(Model model, Movie movie) {
		int result = ms.adminInsert(movie);

		model.addAttribute("result", result);
	
		return "adminLocationInsert";

	}

	@RequestMapping("adminLocationView") // 관리자 영화관 상세 보기
	public String adminLocationView(int lid, Model model) {
		Location location = ls.adminLocationSelect(lid);
		model.addAttribute("location", location);
		
		return "adminLocationView";

	}

	@RequestMapping("adminLocationUpdateForm") // 관리자 영화수정 폼
	public String adminLocationUpdateForm(int lid, Model model) {
		Location location = ls.adminLocationSelect(lid);

		model.addAttribute("location", location);
		
		return "adminLocationUpdateForm";

	}


	@RequestMapping("adminLocationUpdate") // 관리자 영화관수정
	public String adminLocationUpdate(Model model,Location location) {
		int result = ls.adminLocationUpdate(location);

		model.addAttribute("result", result);

		return "adminLocationUpdate";

	}

	/*@RequestMapping("adminLocationDelete") // 관리자 영화관 삭제
	public String adminLocationDelete(int lid, Model model) {
		int result = ls.adminLocationDelete(lid);

		model.addAttribute("result", result);
		
		return "adminLocationDelete";

	}*/

}
