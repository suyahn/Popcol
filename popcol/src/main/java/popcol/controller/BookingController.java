package popcol.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import popcol.model.Booking;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Point;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.MovieService;
import popcol.service.PointService;
import popcol.service.PriceService;

@Controller
public class BookingController {
	@Autowired
	private BookingService bs;
	@Autowired
	private MovieService ms;
	@Autowired
	private CustomerService cs;
	@Autowired
	private PriceService prices;
	@Autowired
	private PointService ps;

	@RequestMapping("reservation")
	public String reserve(Model model) {
		List<Movie> movieList = bs.movieList();
		model.addAttribute("movieList", movieList);
		return "reserve";
	}

	@RequestMapping("movielocation")
	public String movielocation(Model model, int mid) {
		List<Location> locationList = bs.locationList(mid);
		model.addAttribute("locationList", locationList);
		return "movielocation";
	}/*

	@RequestMapping("moviedate")
	public String moviedate(Model model, int mid, int lid) {
		List<RunningtimeTable> dateList = bs.dateList(mid, lid);
		model.addAttribute("dateList", dateList);
		return "movieDate";
	}*/
	
	@RequestMapping("moviedate")
	public String movietime(Model model, int mid, int lid) {
		List<RunningtimeTable> dateList = bs.dateList(mid, lid);
		model.addAttribute("dateList", dateList);
		return "movieDate";
	}

	@RequestMapping("seatSelect")
	public String seatSelect(Model model, int rtid) {
		RunningtimeTable rt =bs.selectRt(rtid); //해당 rtid(선택된 영화, 시간, 날짜)에 해당되는 이용가능 좌석 띄우기 위해서
		List<Booking> seatrtbsList = bs.seatrtList(rtid); 
		System.out.println(seatrtbsList.size());
		List<Price> priceList = bs.timezonePricestList(rt.getTimezone());
		Movie movie = ms.movieDetail(rt.getMid());//영화에 관한 List 뽑았던 걸 여기서 불러서 쓰려고//상영시간 뿌려줄려고
		model.addAttribute("seatrtbsList",seatrtbsList);
		model.addAttribute("rt", rt);
		model.addAttribute("priceList",priceList);
		model.addAttribute("movie",movie);
		return "seatSelect";
	}
	
	@RequestMapping("bookingChk")
	public String bookingChk(Model model, int rtid, int price, String seat, int adult, int youth, int special){
		RunningtimeTable rt= bs.selectRt(rtid);
		Movie movie = ms.movieDetail(rt.getMid());
		/*String[] arrayseat = seat.split(" ");//a4 b3 이 사이의 한칸띔을 나타냄
		System.out.println(arrayseat.length);*/
		model.addAttribute("rt",rt); 
		model.addAttribute("movie",movie);
		model.addAttribute("seat",seat); 
		model.addAttribute("adult",adult);
		model.addAttribute("youth",youth); 
		model.addAttribute("special",special);
		model.addAttribute("price",price);
		return "bookingChk";
	}
	@RequestMapping("bookingPay")
	public String bookingPay(Model model, int rtid, int price, String seat, int adult, int youth, int special, HttpSession session){
		RunningtimeTable rt= bs.selectRt(rtid);
		Movie movie = ms.movieDetail(rt.getMid());
		/*String[] arrayseat = seat.split(" ");//a4 b3 이 사이의 한칸띔을 나타냄
		System.out.println(arrayseat.length);*/
		String id = (String)session.getAttribute("id");
		Customer customer = cs.getSessionCustomerInfo(id); //cid가 id인 고객 정보 가져오기
		model.addAttribute("rt",rt); 
		model.addAttribute("movie",movie);
		model.addAttribute("seat",seat); 
		model.addAttribute("adult",adult);
		model.addAttribute("youth",youth); 
		model.addAttribute("special",special);
		model.addAttribute("price",price);
		model.addAttribute("point",customer.getCpoint());
		return "bookingPay";
	}
	@RequestMapping("bookingComplete")
	public String bookingComplete(Model model, int rtid, int price, String seat, int adult, int youth, int special, HttpSession session,
	int point){
		RunningtimeTable rt =bs.selectRt(rtid);
		String id = (String)session.getAttribute("id");
		List<Price> p =  prices.select(rt.getTimezone());
		int pid=0; 
		String[] sit = seat.split(" ");
		int cnt = 0;
		String ticketnumberMax=bs.getMaxticketnumber();
		int ticketnum = Integer.parseInt(ticketnumberMax)+1;
		String ticketnumber = ""; 
		int result=0;
		
		//어른 
		for(int i=0; i<adult; i++){
			Booking booking = new Booking();
			booking.setRtid(rtid);
			booking.setCid(id);
			booking.setLid(rt.getLid());
			booking.setTid(rt.getTid());
			booking.setMid(rt.getMid());
			
			for(Price cost: p){
				if(cost.getHuman().equals("adult")){
					pid= cost.getPid();
				}
			}
			booking.setPid(pid);
			booking.setBseat(sit[cnt]);
			cnt++;
			
			if(ticketnum < 10){
				ticketnumber = String.format("%04d", ticketnum); 
			}else if(ticketnum < 100){
				ticketnumber = String.format("%03d", ticketnum); 
			}else if(ticketnum < 1000){
				ticketnumber = String.format("%02d", ticketnum); 
			}else{
				ticketnumber = String.format("%01d", ticketnum); 
			}
			
			booking.setTicketnumber(ticketnumber);
			result = bs.insert(booking);
		}
		//젊은이
		for(int i=0; i<youth; i++){
			Booking booking = new Booking();
			booking.setRtid(rtid);
			booking.setCid(id);
			booking.setLid(rt.getLid());
			booking.setTid(rt.getTid());
			booking.setMid(rt.getMid());
			for(Price cost: p){
				if(cost.getHuman().equals("youth")){
					pid= cost.getPid();
				}
			}
			booking.setPid(pid);
			booking.setBseat(sit[cnt]);
			cnt++;
			if(ticketnum < 10){
				ticketnumber = String.format("%04d", ticketnum); 
			}else if(ticketnum < 100){
				ticketnumber = String.format("%03d", ticketnum); 
			}else if(ticketnum < 1000){
				ticketnumber = String.format("%02d", ticketnum); 
			}else{
				ticketnumber = String.format("%01d", ticketnum); 
			}
			
			booking.setTicketnumber(ticketnumber);
			result = bs.insert(booking);
		}
		//우대
		for(int i=0; i<special; i++){
			Booking booking = new Booking();
			booking.setRtid(rtid);
			booking.setCid(id);
			booking.setLid(rt.getLid());
			booking.setTid(rt.getTid());
			booking.setMid(rt.getMid());
			for(Price cost: p){
				if(cost.getHuman().equals("special")){
					pid= cost.getPid();
				}
			}
			booking.setPid(pid);
			booking.setBseat(sit[cnt]);
			cnt++;
			if(ticketnum < 10){
				ticketnumber = String.format("%04d", ticketnum); 
			}else if(ticketnum < 100){
				ticketnumber = String.format("%03d", ticketnum); 
			}else if(ticketnum < 1000){
				ticketnumber = String.format("%02d", ticketnum); 
			}else{
				ticketnumber = String.format("%01d", ticketnum); 
			}
			
			booking.setTicketnumber(ticketnumber);
			result = bs.insert(booking);
		}
		
		// 포인트 추가
		Customer pointCustomer = new Customer();
		pointCustomer.setCid(id);
		int moviePoint = (int) (price * 0.05);
		System.out.println("가격 : " + price);
		System.out.println("포인트 : " + moviePoint);
		pointCustomer.setCpoint(moviePoint); // 가격을 여기에 넣는다.
		int pointResult = cs.updateMoviePoint(pointCustomer);
		
		// 추가한 포인트 기록
		Point bookingPoint = new Point();
		bookingPoint.setCid(id);
		bookingPoint.setLid(rt.getLid());
		bookingPoint.setPpoint(moviePoint);
		pointResult = ps.giveReservPoint(bookingPoint);
		
		// 포인트 사용 시 포인트 빼주기
		if (point > 0) {
			pointCustomer.setCpoint(point);
			pointResult = cs.updateUsePoint(pointCustomer);
			
			// 사용한 포인트 기록
			bookingPoint.setPpoint(point);
			pointResult = ps.usePointForReserv(bookingPoint);
		}
		
		return "bookingComplete";
	}
}

