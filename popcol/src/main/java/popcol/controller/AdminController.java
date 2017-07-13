package popcol.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import popcol.service.CustomerService;
import popcol.service.EventService;
import popcol.service.FaqService;
import popcol.service.LocationService;
import popcol.service.MovieService;
import popcol.service.NoticeService;
import popcol.service.PagingPgm;
import popcol.service.QnaService;
import popcol.service.RunningtimeTableService;
import popcol.service.TheaterService;
import popcol.dao.LocationDao;
import popcol.dao.TheaterDao;
import popcol.model.Customer;
import popcol.model.Event;
import popcol.model.Faq;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Notice;
import popcol.model.Qna;
import popcol.model.RunningtimeTable;
import popcol.model.Theater;

@Controller
public class AdminController {

	@Autowired
	private LocationService ls;
	@Autowired
	private CustomerService cs;
	@Autowired
	private MovieService ms;
	@Autowired
	private NoticeService ns;
	@Autowired
	private FaqService fs;
	@Autowired
	private QnaService qs;
	@Autowired
	private EventService es;
	@Autowired
	private RunningtimeTableService tts;
	@Autowired
	private TheaterService ts;

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
		String masterid = customer.getCid();

		session = request.getSession();

		model.addAttribute("result", result);
		model.addAttribute("masterid", masterid);
		if (result > 0) {

			session.setAttribute("master", customer.getCid());

		}

		if (result <= 0) {
			return "adminLoginForm";
		}

		return "adminLogin";
	}

	@RequestMapping("adminLogout")
	public String adminLogout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.removeAttribute("master");

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
	public String adminInsert(Model model, Movie movie, String pageNum, String mreleaseDateString,
			@RequestParam("murlPosterName") MultipartFile mf, HttpSession session) throws IOException {

		String fileName = "";

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = mf.getOriginalFilename();

			String path = session.getServletContext().getRealPath("/poster");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();
		}

		String murlPoster = fileName.substring(0, fileName.length() - 3);

		movie.setMurlPoster(murlPoster.substring(0, murlPoster.length() - 1));
		movie.setMreleaseDate(Date.valueOf(mreleaseDateString));

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
	public String adminUpdate(Model model, Movie movie, String pageNum, String mreleaseDateString,
			@RequestParam("murlPosterName") MultipartFile mf, HttpSession session) throws IOException {

		String fileName = "";

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = mf.getOriginalFilename();

			String path = session.getServletContext().getRealPath("/poster");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();

			String murlPoster = fileName.substring(0, fileName.length() - 3);
			movie.setMurlPoster(murlPoster.substring(0, murlPoster.length() - 1));
		}

		/* String을 sql.Date로 타입변경 */
		movie.setMreleaseDate(Date.valueOf(mreleaseDateString));

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
	public String adminLocationInsert(Model model, Location location) {
		int result = ls.adminLocationInsert(location);

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
	public String adminLocationUpdate(Model model, Location location) {
		int result = ls.adminLocationUpdate(location);

		model.addAttribute("result", result);

		return "adminLocationUpdate";

	}

	@RequestMapping("adminLocationDelete") // 관리자 영화관 삭제
	public String adminLocationDelete(int lid, Model model) {
		int result = ls.adminLocationDelete(lid);

		model.addAttribute("result", result);

		return "adminLocationDelete";

	}

	/* 고객관리 */

	@RequestMapping("adminCustomerList") // 관리자 고객 리스트
	public String adminCustomerList(String pageNum, Model model) {
		final int ROW_PER_PAGE = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = cs.getTotal();
		/* int total = bs.getTotal(board); // 검색 */
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);
		/*
		 * board.setStartRow(startRow); board.setEndRow(endRow);
		 */
		List<Customer> adminCustomerList = cs.adminCustomerList(startRow, endRow);
		int no = total - startRow + 1;

		/* List<Movie> adminList = ms.adminList(); */
		model.addAttribute("adminCustomerList", adminCustomerList);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "adminCustomerList";

	}

	/* 고객정보 상세보기 */
	@RequestMapping("adminCustomerView")
	public String adminCustomerView(Model model, String cid, String pageNum) {
		Customer customer = cs.adminCustomerSelect(cid);

		model.addAttribute("customer", customer);
		model.addAttribute("pageNum", pageNum);

		return "adminCustomerView";

	}

	/* 고객정보 수정폼 */
	@RequestMapping("adminCustomerUpdateForm")
	public String adminCustomerUpdateForm(Model model, String pageNum, String cid) {
		Customer customer = cs.adminCustomerSelect(cid);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("customer", customer);

		return "adminCustomerUpdateForm";

	}

	@RequestMapping("adminCustomerUpdate")
	public String adminCustomerUpdate(Model model, Customer customer, String pageNum) {
		int result = cs.adminCustomerUpdate(customer);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminCustomerUpdate";

	}

	/* 관리자 notice */
	@RequestMapping("adminNoticeList")
	public String noticeList(String pageNum, Notice notice, Model model, HttpSession session,
			HttpServletRequest request, Customer customer) {

		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = ns.getTotal(notice);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		List<Notice> list = ns.list(notice);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);
		model.addAttribute("search", notice.getSearch());
		model.addAttribute("keyword", notice.getKeyword());

		return "adminNoticeList";
	}

	@RequestMapping("adminNoticeInsertForm")
	public String noticeInsertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);

		return "adminNoticeInsertForm";
	}

	@RequestMapping("adminNoticeInsert")
	public String noticeInsert(Notice notice, String pageNum, Model model) {
		int number = ns.getMaxNum();
		notice.setNid(number);
		int result = ns.insert(notice);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nid", notice.getNid());

		return "adminNoticeInsert";
	}

	@RequestMapping("adminNoticeView")
	public String noticeView(int nid, String pageNum, Model model) {
		Notice notice = ns.select(nid);

		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);

		return "adminNoticeView";
	}

	@RequestMapping("adminNoticeUpdateForm")
	public String noticeUpdateForm(int nid, String pageNum, Model model) {
		Notice notice = ns.select(nid);

		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);

		return "adminNoticeUpdateForm";
	}

	@RequestMapping("adminNoticeUpdate")
	public String noticeUpdate(Notice notice, String pageNum, Model model) {
		int result = ns.update(notice);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nid", notice.getNid());

		return "adminNoticeUpdate";
	}

	@RequestMapping("adminNoticeDelete")
	public String noticeDelete(int nid, String pageNum, Model model) {
		int result = ns.delete(nid);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "adminNoticeDelete";
	}

	/* 관리자 FAQ */
	@RequestMapping("adminFaqList")
	public String FaqList(String pageNum, Faq faq, Model model) {
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = fs.getTotal(faq);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		faq.setStartRow(startRow);
		faq.setEndRow(endRow);
		List<Faq> list = fs.list(faq);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);
		model.addAttribute("search", faq.getSearch());
		model.addAttribute("keyword", faq.getKeyword());

		return "adminFaqList";
	}

	@RequestMapping("adminFaqInsertForm")
	public String faqInsertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);

		return "adminFaqInsertForm";
	}

	@RequestMapping("adminFaqInsert")
	public String faqInsert(Faq faq, String pageNum, Model model) {
		int number = fs.getMaxNum();
		faq.setFid(number);
		int result = fs.insert(faq);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("fid", faq.getFid());

		return "adminFaqInsert";
	}

	@RequestMapping("adminFaqView")
	public String faqView(int fid, String pageNum, Model model) {
		Faq faq = fs.select(fid);

		model.addAttribute("faq", faq);
		model.addAttribute("pageNum", pageNum);

		return "adminFaqView";
	}

	@RequestMapping("adminFaqUpdateForm")
	public String faqUpdateForm(int fid, String pageNum, Model model) {
		Faq faq = fs.select(fid);

		model.addAttribute("faq", faq);
		model.addAttribute("pageNum", pageNum);

		return "adminFaqUpdateForm";
	}

	@RequestMapping("adminFaqUpdate")
	public String faqUpdate(Faq faq, String pageNum, Model model) {
		int result = fs.update(faq);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("fid", faq.getFid());

		return "adminFaqUpdate";
	}

	@RequestMapping("adminFaqDelete")
	public String faqDelete(int fid, String pageNum, Model model) {
		int result = fs.delete(fid);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "adminFaqDelete";
	}

	/* 관리자 QnA */
	@RequestMapping("adminQnaList")
	public String qnaList(String pageNum, Qna qna, Model model) {
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = qs.getTotal();

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		qna.setStartRow(startRow);
		qna.setEndRow(endRow);
		List<Qna> list = qs.list(qna);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);

		return "adminQnaList";
	}

	@RequestMapping("adminQnaInsertForm")
	public String qnaInsertForm(String pageNum, HttpSession session, Model model) {
		String cid = (String) session.getAttribute("master");
		String cname = cs.getCustomerName(cid);

		model.addAttribute("cid", cid);
		model.addAttribute("cname", cname);
		model.addAttribute("pageNum", pageNum);

		return "adminQnaInsertForm";
	}

	@RequestMapping("adminQnaInsert")
	public String qnaInsert(Qna qna, String pageNum, Model model) {
		int number = qs.getMaxNum();
		qna.setQid(number);
		int result = qs.insert(qna);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qid", qna.getQid());

		return "adminQnaInsert";
	}

	@RequestMapping("adminQnaView")
	public String qnaView(int qid, String pageNum, HttpSession session, Model model) {
		Qna qna = qs.select(qid);
		String id = (String) session.getAttribute("master");

		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("id", id);

		return "adminQnaView";
	}

	@RequestMapping("adminQnaUpdateForm")
	public String qnaUpdateForm(int qid, String pageNum, Model model) {
		Qna qna = qs.select(qid);

		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);

		return "adminQnaUpdateForm";
	}

	@RequestMapping("adminQnaUpdate")
	public String noticeUpdate(Qna qna, String pageNum, Model model) {
		int result = qs.update(qna);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qid", qna.getQid());

		return "adminQnaUpdate";
	}

	@RequestMapping("adminQnaDelete")
	public String qnaDelete(int qid, String pageNum, Model model) {
		int result = qs.delete(qid);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "adminQnaDelete";
	}

	/* 답변 */
	@RequestMapping("adminQnaReply")
	public String qnaReply(int qid, Model model, HttpSession session) {
		Qna qna = qs.select(qid);

		String id = (String) session.getAttribute("master");

		model.addAttribute("qnaReply", qna);
		model.addAttribute("id", id);

		return "adminQnaReply";
	}

	/*
	 * @RequestMapping("adminQnaReplyInsert") public String qnaReplyInsert(Qna
	 * qna) { qs.insertReply(qna); return "redirect:adminQnaReply.do?qid=" +
	 * qna.getQid(); }
	 * 
	 * @RequestMapping("adminQnaReplyDelete") public String qnaReplyDelete(int
	 * qid) { qs.deleteReply(qid); return "redirect:adminQnaReply.do?qid=" +
	 * qid; }
	 */

	@RequestMapping("adminEventList")
	public String eventList(String pageNum, Event event, Model model) {
		final int ROW_PER_PAGE = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		int total = es.getTotal(event);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		event.setStartRow(startRow);
		event.setEndRow(endRow);
		List<Event> list = es.eventList(event);

		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);

		int no = total - startRow + 1;

		model.addAttribute("eventList", list);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);
		model.addAttribute("search", event.getSearch());
		model.addAttribute("keyword", event.getKeyword());

		return "adminEventList";
	}

	@RequestMapping("adminEventView")
	public String eventView(int eid, String pageNum, Model model) {
		Event event = es.selectEvent(eid);

		model.addAttribute("event", event);
		model.addAttribute("pageNum", pageNum);

		return "adminEventView";
	}

	@RequestMapping("adminEventInsertForm")
	public String eventInsertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);

		return "adminEventInsertForm";
	}

	@RequestMapping("adminEventInsert")
	public String eventInsert(String pageNum, Event event, String estartingdateString, String eclosingdateString,
			@RequestParam("newEpicture") MultipartFile mf, Model model, HttpSession session)
			throws IllegalStateException, IOException {
		/*
		 * public String eventInsert(String pageNum, String esubject, String
		 * econtent, String estartingdateString, String eclosingdateString
		 * , @RequestParam("epicture") MultipartFile mf, Model model,
		 * HttpSession session) throws IllegalStateException, IOException {
		 */
		String fileName = "";

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = "event_" + mf.getOriginalFilename();

			/* webapp밑에 images에 저장 */
			String path = session.getServletContext().getRealPath("/images");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();
		}

		int eid = es.getMaxNum();
		event.setEid(eid);
		event.setEpicture(fileName);

		/* String을 sql.Date로 타입변경 */
		event.setEstartingdate(Date.valueOf(estartingdateString));
		event.setEclosingdate(Date.valueOf(eclosingdateString));

		int result = es.insertEvent(event);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("eid", event.getEid());
		model.addAttribute("result", result);

		return "adminEventInsert";
	}

	@RequestMapping("adminEventUpdateForm")
	public String eventUpdateForm(int eid, String pageNum, Model model) {
		Event event = es.selectEvent(eid);

		model.addAttribute("event", event);
		model.addAttribute("pageNum", pageNum);

		return "adminEventUpdateForm";
	}

	@RequestMapping("adminEventUpdate")
	public String eventUpdate(String pageNum, Event event, String estartingdateString, String eclosingdateString,
			@RequestParam("newEpicture") MultipartFile mf, Model model, HttpSession session)
			throws IllegalStateException, IOException {

		String fileName = "";

		if (mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = "event_" + mf.getOriginalFilename();

			/* webapp밑에 images에 저장 */
			String path = session.getServletContext().getRealPath("/images");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();

			event.setEpicture(fileName);
		}

		/* String을 sql.Date로 타입변경 */
		event.setEstartingdate(Date.valueOf(estartingdateString));
		event.setEclosingdate(Date.valueOf(eclosingdateString));

		int result = es.updateEvent(event);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("eid", event.getEid());
		model.addAttribute("result", result);

		return "adminEventUpdate";
	}

	@RequestMapping("adminEventDelete")
	public String eventDelete(int eid, String pageNum, Model model) {
		int result = es.deleteEvent(eid);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);

		return "adminEventDelete";
	}

	/* 관리자 상영시간표 리스트 */
	@RequestMapping("adminTTList")
	public String adminTTList(String pageNum, RunningtimeTable runningtimeTable, Model model,
			HttpServletRequest request) {
		final int ROW_PER_PAGE = 10;
		String test = request.getParameter("lid");
		int total = 0;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		/* 전체보기 */
		if (test == null || test.equals("") || test.equals("0")) {
			total = tts.getTotal1();
		} else { /* 상영관별 보기 */
			total = tts.getTotal2(runningtimeTable);
		}
		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);
		List<RunningtimeTable> adminTTList = tts.adminTTList(startRow, endRow);
		List<Location> locationList = ls.adminLocationList();
		int no = total - startRow + 1;

		model.addAttribute("adminTTList", adminTTList);
		model.addAttribute("locationList", locationList);
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);

		return "adminTTList";
	}

	@RequestMapping("adminTTInsertForm") // 관리자 상영시간표 입력 페이지
	public String adminTTInsertForm(String pageNum, Model model) {
		List<Movie> movieList = ms.movieList();
		List<Theater> theaterLocation = ts.theaterLocation();

		model.addAttribute("theaterLocation", theaterLocation);
		model.addAttribute("movieList", movieList);
		model.addAttribute("pageNum", pageNum);

		return "adminTTInsertForm";

	}

	@RequestMapping("adminTTInsert") // 관리자 상영시간표 입력
	public String adminTTInsert(RunningtimeTable runningtimeTable, String pageNum, Model model, String ltid) {
		runningtimeTable.setRtdateString(runningtimeTable.getRtdateString().replace("T", " "));

		String[] array = ltid.split(":");
		runningtimeTable.setLid(Integer.parseInt(array[0]));
		runningtimeTable.setTid(Integer.parseInt(array[1]));

		int result = tts.adminTTInsert(runningtimeTable);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);

		return "adminTTInsert";

	}

	@RequestMapping("adminTTView") // 관리자 상영시간표 상세 보기
	public String adminTTView(int rtid, Model model, String pageNum) {
		RunningtimeTable showtimesList2 = tts.adminTTSelect(rtid);

		model.addAttribute("showtimesList2", showtimesList2);
		model.addAttribute("pageNum", pageNum);

		return "adminTTView";

	}

	@RequestMapping("adminTTUpdateForm") // 관리자 상영시간표 수정폼
	public String adminTTUpdateForm(int rtid, Model model, String pageNum) {
		List<Movie> movieList = ms.movieList();
		List<Theater> theaterLocation = ts.theaterLocation();
		RunningtimeTable showtimesList2 = tts.adminTTSelect(rtid);
		model.addAttribute("theaterLocation", theaterLocation);
		model.addAttribute("movieList", movieList);

		model.addAttribute("showtimesList2", showtimesList2);
		model.addAttribute("pageNum", pageNum);

		return "adminTTUpdateForm";

	}

	@RequestMapping("adminTTUpdate") // 관리자 상영시간표 수정
	public String adminTTUpdate(Model model, Movie movie, String pageNum, RunningtimeTable runningtimeTable,
			String ltid) {
		runningtimeTable.setRtdateString(runningtimeTable.getRtdateString().replace("T", " "));

		String[] array = ltid.split(":");
		runningtimeTable.setLid(Integer.parseInt(array[0]));
		runningtimeTable.setTid(Integer.parseInt(array[1]));

		int result = tts.adminTTUpdate(runningtimeTable);

		/* int result = ms.adminUpdate(movie); */

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminTTUpdate";

	}

	@RequestMapping("adminTTDelete") // 관리자 상영시간표 삭제
	public String adminTTDelete(int mid, Model model, String pageNum) {
		int result = ms.adminDelete(mid);

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "adminTTDelete";

	}
	/*
	 * @RequestMapping("adminTTList") public String showTimes(Model model,int
	 * lid,@DateTimeFormat(pattern="yyyy/MM/dd") Date date) { List<Movie>
	 * movieList = tts.movieList(lid, date); List<Location> locationList =
	 * ls.locationList(); Location loc = ls.selectLocation(lid);
	 * List<RunningtimeTable> showtimesList = tts.showtimesList(lid,date);
	 * List<RunningtimeTable> bookedSeatCountList = tts.bookedSeatCountList(lid,
	 * date);
	 * 
	 * model.addAttribute("movieList", movieList);
	 * model.addAttribute("locationList",locationList);
	 * model.addAttribute("loc", loc); model.addAttribute("date",date);
	 * model.addAttribute("showtimesList",showtimesList);
	 * model.addAttribute("bookedSeatCountList", bookedSeatCountList);
	 * 
	 * return "adminTTList"; }
	 */

}
