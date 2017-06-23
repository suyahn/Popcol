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
	
	@RequestMapping("eventInsertForm")
	public String eventInsertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		
		return "eventInsertForm";
	}
	
	@RequestMapping("eventInsert")
	public String eventInsert(String pageNum, Event event, String estartingdateString, String eclosingdateString
			, @RequestParam("newEpicture") MultipartFile mf, Model model, HttpSession session) throws IllegalStateException, IOException {
	/*public String eventInsert(String pageNum, String esubject, String econtent, String estartingdateString, String eclosingdateString
			, @RequestParam("epicture") MultipartFile mf, Model model, HttpSession session) throws IllegalStateException, IOException {*/
		String fileName = "";
		 
		if(mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = "event_" + mf.getOriginalFilename();
			
			/*webapp밑에 images에 저장*/
			String path = session.getServletContext().getRealPath("/images");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();
		}
		
		int eid = es.getMaxNum();
		event.setEid(eid);
		event.setEpicture(fileName);
		
		/*String을 sql.Date로 타입변경*/
		event.setEstartingdate(Date.valueOf(estartingdateString));
		event.setEclosingdate(Date.valueOf(eclosingdateString));
		
		int result = es.insertEvent(event);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("eid", event.getEid());
		model.addAttribute("result", result);
		
		return "eventInsert";
	}
	
	@RequestMapping("eventUpdateForm")
	public String eventUpdateForm(int eid, String pageNum, Model model) {
		Event event = es.selectEvent(eid);
		
		model.addAttribute("event", event);
		model.addAttribute("pageNum", pageNum);
		
		return "eventUpdateForm";
	}
	
	@RequestMapping("eventUpdate")
	public String eventUpdate(String pageNum, Event event, String estartingdateString, String eclosingdateString
			, @RequestParam("newEpicture") MultipartFile mf, Model model, HttpSession session) throws IllegalStateException, IOException {
		
		String fileName = "";
		 
		if(mf.getOriginalFilename() != null && !mf.getOriginalFilename().equals("")) {
			fileName = "event_" + mf.getOriginalFilename();
			
			/*webapp밑에 images에 저장*/
			String path = session.getServletContext().getRealPath("/images");
			FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
			fos.write(mf.getBytes());
			fos.close();
			
			event.setEpicture(fileName);
		}
		
		/*String을 sql.Date로 타입변경*/
		event.setEstartingdate(Date.valueOf(estartingdateString));
		event.setEclosingdate(Date.valueOf(eclosingdateString));
		
		int result = es.updateEvent(event);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("eid", event.getEid());
		model.addAttribute("result", result);
		
		return "eventUpdate";
	}
	
	@RequestMapping("eventDelete")
	public String eventDelete(int eid, String pageNum, Model model) {
		int result = es.deleteEvent(eid);
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "eventDelete";
	}
}
