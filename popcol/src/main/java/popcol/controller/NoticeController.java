package popcol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Notice;
import popcol.service.NoticeService;
import popcol.service.PagingPgm;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	@RequestMapping("noticeList")
	public String noticeList(String pageNum, Notice notice, Model model) {
		final int ROW_PER_PAGE = 10;
		
		if(pageNum == null || pageNum.equals("")) {
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
		
		return "noticeList";
	}
	
	@RequestMapping("noticeInsertForm")
	public String noticeInsertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		
		return "noticeInsertForm";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(Notice notice, String pageNum, Model model) {
		int number = ns.getMaxNum();
		notice.setNid(number);
		int result = ns.insert(notice);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nid", notice.getNid());
		
		return "noticeInsert";
	}
	
	@RequestMapping("noticeView")
	public String noticeView(int nid, String pageNum, Model model) {
		Notice notice = ns.select(nid);
		
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "noticeView";
	}
	
	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(int nid, String pageNum, Model model) {
		Notice notice = ns.select(nid);
		
		model.addAttribute("notice", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "noticeUpdateForm";
	}
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(Notice notice, String pageNum, Model model) {
		int result = ns.update(notice);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nid", notice.getNid());
		
		return "noticeUpdate";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(int nid, String pageNum, Model model) {
		int result = ns.delete(nid);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "noticeDelete";
	}
}
