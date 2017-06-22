package popcol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import popcol.model.Movie;
import popcol.model.Review;
import popcol.service.MovieService;
import popcol.service.PagingPgm;
import popcol.service.ReviewService;

@Controller
public class MovieController {
	@Autowired
	private MovieService ms;
	@Autowired
	private ReviewService rs;
	
	/*무비 차트*/
	@RequestMapping("movieChart")
	public String movieChart(Model model) {
		List<Movie> movieList = ms.movieChart();
		List<Movie> reviewCountList = ms.reviewGoodBadCount();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("reviewCountList", reviewCountList);
		return "movieChart";
	}
	
	/*영화 상세 정보*/
	@RequestMapping("movieDetail")
	public String movieDetail(int mid, Model model) {
		Movie movie = ms.movieDetail(mid);
		List<Movie> reviewCountList = ms.reviewGoodBadCount();
		int totalReviewCount = rs.movieDetailReviewTotal(mid);
		
		model.addAttribute("movie", movie);
		model.addAttribute("reviewCountList", reviewCountList);
		model.addAttribute("totalReviewCount", totalReviewCount);
		
		return "movieDetail";
	}
	
	/*해당 영화의 후기 리스트*/
	@RequestMapping("movieDetailReviewList")
	public String movieDetailReviewList(String pageNum, Review review, Model model) {
		final int ROW_PER_PAGE = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int total = rs.movieDetailReviewTotal(review.getMid());
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		List<Review> reviewList = rs.movieDetailReviewList(review);
		
		PagingPgm pp = new PagingPgm(total, ROW_PER_PAGE, currentPage);
		
		int no = total - startRow + 1;
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("mid", review.getMid());
		model.addAttribute("no", no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pp", pp);

		return "movieDetailReviewList";
	}
	
	/*현재 상영작*/
	@RequestMapping("nowMovies")
	public String nowMovies(Model model) {
		List<Movie> movieList = ms.nowMoviesList();
		List<Movie> reviewCountList = ms.reviewGoodBadCount();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("reviewCountList", reviewCountList);
		
		return "nowMovies";
	}
	
	/*개봉 예정작*/
	@RequestMapping("preMovies")
	public String preMovies(Model model) {
		List<Movie> movieList = ms.preMoviesList();
		
		model.addAttribute("movieList", movieList);
		
		return "preMovies";
	}
}
