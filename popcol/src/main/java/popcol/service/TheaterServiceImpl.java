package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.TheaterDao;
import popcol.model.Theater;

@Service
public class TheaterServiceImpl implements TheaterService {
	@Autowired
	private TheaterDao td;

	@Override
	public List<Theater> theaterLocation() {
		
		return td.theaterLocation();

	
	public List<Theater> theaterList() {
		return td.theaterList();

	}

}
