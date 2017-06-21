package popcol.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Booking;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.service.BookingService;
import popcol.service.MovieService;

@Controller
public class BookingController {
	@Autowired
	private BookingService bs;
	@Autowired
	private MovieService ms;

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
		RunningtimeTable rt =bs.selectRt(rtid);
		List<Booking> seatrtbsList = bs.seatrtList(rtid);
		List<Price> priceList = bs.pricestList();
		Movie movie = ms.movieDetail(rt.getMid());
		model.addAttribute("seatrtbsList",seatrtbsList);
		model.addAttribute("rt", rt);
		model.addAttribute("priceList",priceList);
		model.addAttribute("movie",movie);
		return "seatSelect";
	}
}
