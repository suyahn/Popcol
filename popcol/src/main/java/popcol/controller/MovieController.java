package popcol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Movie;
import popcol.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	
	@RequestMapping("movieChart")
	public String movieChart(Model model) {
		List<Movie> movieList = ms.movieChart();
		List<Movie> reviewCountList = ms.reviewGoodBadCount();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("reviewCountList", reviewCountList);
		return "movieChart";
	}
	
	@RequestMapping("movieDetail")
	public String movieDetail(int mid, Model model) {
		Movie movie = ms.movieDetail(mid);
		List<Movie> reviewCountList = ms.reviewGoodBadCount();
		
		model.addAttribute("movie", movie);
		model.addAttribute("reviewCountList", reviewCountList);
		return "movieDetail";
	}
}
