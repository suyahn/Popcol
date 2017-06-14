package popcol.dao.movie;

import java.util.ArrayList;
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

	@Override
	public List<Movie> movieChart() {
		List<Movie> movies = sst.selectList("moviens.list");
		List<Movie> movieChart = new ArrayList<Movie>();

		for (Movie movie : movies) {
			movieChart.add((Movie) sst.selectOne("moviens.movieChart", movie.getMid()));
		}

		return movieChart;
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

}
