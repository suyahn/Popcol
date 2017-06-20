package popcol.controller.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Qna;
import popcol.service.PagingPgm;
import popcol.service.customer.CustomerService;
import popcol.service.qna.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qs;
	@Autowired
	private CustomerService cs;
	
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
	public String qnaInsertForm(String pageNum, HttpSession session, Model model) {
		String cid = (String) session.getAttribute("id");
		String cname = cs.getCustomerName(cid);
		
		model.addAttribute("cid", cid);
		model.addAttribute("cname", cname);
		model.addAttribute("pageNum", pageNum);
		
		return "qnaInsertForm";
	}
	
	@RequestMapping("qnaInsert")
	public String qnaInsert(Qna qna, String pageNum, Model model) {
		int number = qs.getMaxNum();
		qna.setQid(number);
		int result = qs.insert(qna);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qid", qna.getQid());
		
		return "qnaInsert";
	}
	
	@RequestMapping("qnaView")
	public String qnaView(int qid, String pageNum, HttpSession session, Model model) {
		Qna qna = qs.select(qid);
		String id = (String) session.getAttribute("id");
		
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("id", id);
		
		return "qnaView";
	}
	
	@RequestMapping("qnaUpdateForm")
	public String qnaUpdateForm(int qid, String pageNum, Model model) {
		Qna qna = qs.select(qid);
		
		model.addAttribute("qna", qna);
		model.addAttribute("pageNum", pageNum);
		
		return "qnaUpdateForm";
	}
	
	@RequestMapping("qnaUpdate")
	public String noticeUpdate(Qna qna, String pageNum, Model model) {
		int result = qs.update(qna);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qid", qna.getQid());
		
		return "qnaUpdate";
	}
	
	@RequestMapping("qnaDelete")
	public String qnaDelete(int qid, String pageNum, Model model) {
		int result = qs.delete(qid);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "qnaDelete";
	}
	
	/*답변*/
	@RequestMapping("qnaReply")
	public String qnaReply(int qid, Model model, HttpSession session) {
		Qna qna = qs.select(qid);
		
		String id = (String) session.getAttribute("id");
		
		model.addAttribute("qnaReply", qna);
		model.addAttribute("id", id);
		
		return "qnaReply";
	}
	
	@RequestMapping("qnaReplyInsert")
	public String qnaReplyInsert(Qna qna) {
		qs.insertReply(qna);
		return "redirect:qnaReply.do?qid=" + qna.getQid();
	}
	
	@RequestMapping("qnaReplyDelete")
	public String qnaReplyDelete(int qid) {
		qs.deleteReply(qid);
		return "redirect:qnaReply.do?qid=" + qid;
	}
}
