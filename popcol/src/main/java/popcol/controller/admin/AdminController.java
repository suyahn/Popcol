package popcol.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.service.PagingPgm;
import popcol.model.Movie;
import popcol.service.location.LocationService;
import popcol.service.movie.MovieService;
import popcol.service.theater.TheaterService;

@Controller
public class AdminController {
	/*
	 * @Autowired private LocationService ls;
	 */
	@Autowired
	private MovieService ms;
	/*
	 * @Autowired private TheaterService ts;
	 */

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

	@RequestMapping("adminInsertForm") // 관리자 페이지의 영화 입력
	public String adminInsert(int mid,String pageNum, Model model) {
		Movie movie = ms.select(mid);
		
		model.addAttribute("movie", movie);
		model.addAttribute("pageNum", pageNum);
		System.out.println("asd");
		return "adminInsertForm";

	}

}
