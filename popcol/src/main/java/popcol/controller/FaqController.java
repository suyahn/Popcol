package popcol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Faq;
import popcol.service.FaqService;
import popcol.service.PagingPgm;

@Controller
public class FaqController {
	@Autowired
	private FaqService fs;
	
	@RequestMapping("faqList")
	public String FaqList(String pageNum, Faq faq, Model model) {
		final int ROW_PER_PAGE = 10;
		
		if(pageNum == null || pageNum.equals("")) {
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
		
		return "faqList";
	}
    
    @RequestMapping("faqView")
    public String faqView(int fid, String pageNum, Model model) {
        Faq faq = fs.select(fid);
        
        model.addAttribute("faq", faq);
        model.addAttribute("pageNum", pageNum);
        
        return "faqView";
    }
}
