package popcol.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import popcol.model.Location;
import popcol.model.Point;
import popcol.model.Qna;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.LocationService;
import popcol.service.MovieService;
import popcol.service.MypageBookingService;
import popcol.service.PagingPgm;
import popcol.service.PointService;
import popcol.service.QnaService;
import popcol.service.ReviewService;

@Controller
public class Mypage_PointQnaController {
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
	
	// 포인트 조회
	@RequestMapping("mypage_myPoint")
	public String mypage_myPoint(String pageNum, Point point, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// 포인트게시판 페이징
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = ps.mypage_getTotal(id);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		point.setStartRow(startRow);
		point.setEndRow(endRow);
		point.setCid(id);
		
		List<Point> pointList = ps.mypage_list(point);
		List<Location> location = ls.selectPointLocation();
		
		for(Point p : pointList) {
			for(Location l : location) {
				if(p.getLid() == l.getLid())
					p.setLname(l.getLname());
			}
		}
		
		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		model.addAttribute("pointList", pointList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);
		
		return "mypage_myPoint";
	}

	// 1:1 문의
	@RequestMapping("mypage_myQna")
	public String mypage_myQna(String pageNum, Qna qna, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 문의게시판 페이징
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = qs.mypage_getTotal(id);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		qna.setCid(id);
		List<Qna> mypageQnaList = qs.mypage_list(qna);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("qnalist", mypageQnaList);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);

		return "mypage_myQna";
	}

	@RequestMapping("mypage_myQnaShow")
	public String mypage_myQnaShow(int qid, String pageNum, Model model) {
		Qna mypageQna = qs.mypage_qnaShow(qid);

		model.addAttribute("qna", mypageQna);
		model.addAttribute("pageNum", pageNum);

		return "mypage_myQnaShow";
	}

	@RequestMapping("mypage_myQnaDelete")
	public String mypage_myQnaDelete(@RequestParam(value="qid",required=true) List<Integer> qid, String pageNum, Model model) {
		int result = 0;
		int r1 = 0;
		
		for (int i = 0; i < qid.size(); i++) {
			int r2 = qs.mypage_qnaDelete(qid.get(i));
			r1 = r1 + r2;
		}
		
		if (r1 == qid.size()) {
			result = 1;
		}
		
		model.addAttribute("result", result);

		if (pageNum != null) {
			model.addAttribute("pageNum", pageNum);
		}

		return "mypage_myQnaDelete";
	}
}
