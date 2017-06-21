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
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.service.BookingService;
import popcol.service.CustomerService;
import popcol.service.MovieService;

@Controller
public class BookingController {
	@Autowired
	private BookingService bs;
	@Autowired
	private MovieService ms;
	@Autowired
	private CustomerService cs;

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
	}

	@RequestMapping("moviedate")
	public String moviedate(Model model, int mid, int lid) {
		List<RunningtimeTable> dateList = bs.dateList(mid, lid);
		model.addAttribute("dateList", dateList);
		return "movieDate";
	}

	@RequestMapping("movietime")
	public String movietime(Model model, int mid, int lid, int rtid) {
		List<RunningtimeTable> timeList = bs.timeList(mid, lid, rtid);
		model.addAttribute("timeList", timeList);
		return "movieTime";
	}

	@RequestMapping("seatSelect")
	public String seatSelect(Model model, int rtid) {
		RunningtimeTable rt =bs.selectRt(rtid); //해당 rtid(선택된 영화, 시간, 날짜)에 해당되는 이용가능 좌석 띄우기 위해서
		List<Booking> seatrtbsList = bs.seatrtList(rtid); 
		List<Price> priceList = bs.timezonePricestList(rt.getTimezone());
		Movie movie = ms.movieDetail(rt.getMid());//영화에 관한 List 뽑았던 걸 여기서 불러서 쓰려고//상영시간 뿌려줄려고
		model.addAttribute("seatrtbsList",seatrtbsList);
		model.addAttribute("rt", rt);
		model.addAttribute("priceList",priceList);
		model.addAttribute("movie",movie);
		return "seatSelect";
	}
	
	@RequestMapping("bookingChk")
	public String bookingChk(Model model, int rtid, String price, String seat, int adult, int youth, int special){
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
	public String bookingPay(Model model, int rtid, String price, String seat, int adult, int youth, int special, HttpSession session){
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
}

