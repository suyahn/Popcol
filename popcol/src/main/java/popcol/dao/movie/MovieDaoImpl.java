package popcol.dao.movie;

import java.util.ArrayList;
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
		// TODO Auto-generated method stub
		List<Movie> movies = sst.selectList("moviens.list");
		List<Movie> movieChart = new ArrayList<Movie>();
		
		for(Movie movie : movies) {
			movieChart.add((Movie) sst.selectOne("moviens.movieChart", movie.getMid()));
		}
		
		return movieChart;
	}
}
