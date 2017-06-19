package popcol.controller.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Qna;
import popcol.service.PagingPgm;
import popcol.service.qna.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qs;
	
	@RequestMapping("qnaList")
	public String qnaList(String pageNum, Qna qna, Model model) {
		final int ROW_PER_PAGE = 10;
		
		if(pageNum == null || pageNum.equals("")) {
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
		
		return "qnaList";
	}
	
	@RequestMapping("qnaInsertForm")
	public String qnaInsertForm(HttpSession session) {
		return "qnaInsertForm";
	}
}
