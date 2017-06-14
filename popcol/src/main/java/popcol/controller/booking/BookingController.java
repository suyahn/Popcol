package popcol.controller.booking;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.RunningtimeTable;
import popcol.service.booking.BookingService;

@Controller
public class BookingController {
	@Autowired
	private BookingService bs;
	
	@RequestMapping("reservation")
	public String reserve(Model model){
		List<Movie> movieList=bs.movieList();
		model.addAttribute("movieList", movieList);
		return "reserve";
	}
	
	@RequestMapping("movielocation")
	public String movielocation(Model model, int mid) {
		List<Location> locationList = bs.locationList(mid);
		model.addAttribute("locationList",locationList);
		return "movielocation";
	}
	
	@RequestMapping("moviedate")
	public String moviedate(Model model, int mid, int lid){
		List<RunningtimeTable> dateList = bs.dateList(mid,lid);
		model.addAttribute("dateList",dateList);
		return "movieDate";
	}
}

