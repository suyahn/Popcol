package popcol.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import popcol.model.Event;
import popcol.service.EventService;
import popcol.service.PagingPgm;

@Controller
public class EventController {
	@Autowired
	private EventService es;
	
	@RequestMapping("eventList")
	public String eventList(String pageNum, Event event, Model model) {
		final int ROW_PER_PAGE = 10;
		
		if(pageNum == null || pageNum.equals("")) {
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
		
		return "eventList";
	}
	
	@RequestMapping("eventView")
	public String eventView(int eid, String pageNum, Model model) {
		Event event = es.selectEvent(eid);
		
		model.addAttribute("event", event);
		model.addAttribute("pageNum", pageNum);
		
		return "eventView";
	}
}
