package popcol.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;

import popcol.service.location.LocationService;
import popcol.service.movie.MovieService;
import popcol.service.theater.TheaterService;

@org.springframework.stereotype.Controller
public class AdminController {
	@Autowired
	private LocationService ls;
	private MovieService ms;
	private TheaterService ts;

}
