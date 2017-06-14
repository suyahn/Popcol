package popcol.controller.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Movie;
import popcol.service.movie.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	
	@RequestMapping("movieChart")
	public String movieChart(Model model) {
		List<Movie> movieList = ms.movieChart();
		
		model.addAttribute("movieList", movieList);
		return "movie/movieChart";
	}
}