package popcol.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {
	@Autowired
	private SqlSessionTemplate sst;

	/*수연*/
	/*무비차트*/
	@Override
	public List<Movie> movieChart() {
		List<Movie> movies = sst.selectList("moviens.list");
		List<Movie> movieChart = new ArrayList<Movie>();
		final int MAX_MOVIECHART_CNT = 8;

		for (Movie movie : movies) {
			movieChart.add((Movie) sst.selectOne("moviens.movieChart", movie.getMid()));
		}

		/*예매율 bookingRate가 큰 순으로 정렬*/
		Collections.sort(movieChart, new Comparator<Movie>() {
			@Override
			public int compare(Movie o1, Movie o2) {
				if(o1.getBookingRate() > o2.getBookingRate()) {
					return 1;
				} else if(o1.getBookingRate() < o2.getBookingRate()) {
					return -1;
				} else {
					return 0;
				}
			}
		});
		Collections.reverse(movieChart);
		
		int movieChartSize = movieChart.size();
		
		if(movieChart.size() > MAX_MOVIECHART_CNT) {
			for(int i = MAX_MOVIECHART_CNT; i < movieChartSize; i++) {
				movieChart.remove(MAX_MOVIECHART_CNT);
			}
		}

		return movieChart;
	}
	
	/*영화 세부 정보*/
	@Override
	public Movie movieDetail(int mid) {
		return sst.selectOne("moviens.movieChart", mid);
	}
	
	/*영화들의 좋아요 싫어요 개수 리스트*/
	@Override
	public List<Movie> reviewGoodBadCount() {
		return sst.selectList("moviens.movieChartReviewCount");
	}
	
	/*현재 상영작*/
	@Override
	public List<Movie> nowMoviesList() {
		return sst.selectList("moviens.nowMoviesList");
	}
	
	/*개봉 예정작*/
	@Override
	public List<Movie> preMoviesList() {
		return sst.selectList("moviens.preMoviesList");
	}


	/* 규랑 */
	@Override
	public List<Movie> adminList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return sst.selectList("moviens.adminList", hm);
	}

	@Override
	public int getTotal() {
		return sst.selectOne("moviens.getTotal");
	}

	@Override
	public int adminInsert(Movie movie) {

		return sst.insert("moviens.adminInsert", movie);
	}

	@Override
	public Movie adminSelect(int mid) {

		return sst.selectOne("moviens.adminSelect", mid);
	}

	@Override
	public int adminUpdate(Movie movie) {
		
		return sst.update("moviens.adminUpdate", movie);
	}

	@Override
	public int adminDelete(int mid) {
		
		return sst.update("moviens.adminDelete",mid);
	}
	/*상영시간표 입력시*/
	@Override
	public List<Movie> movieList() {
		
		return sst.selectList("moviens.movieTTList");
	}

	
	/* 도은 */
	/* 메인 */
	public Movie selectRunningMovieRandom() {
	
		return sst.selectOne("moviens.selectRunningMovieRandom");
	}
	
	/* 마이페이지 */
	public Movie selectMovieForReview(int mid) {
		
		return sst.selectOne("moviens.selectMovieForReview", mid);
	}


	

	

}
