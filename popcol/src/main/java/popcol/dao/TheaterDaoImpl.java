package popcol.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Theater;

@Repository
public class TheaterDaoImpl implements TheaterDao {
	@Autowired
	private SqlSessionTemplate sst;


	@Override
	public List<Theater> theaterLocation() {
		
		return sst.selectList("theaterns.theaterLocation");

	public List<Theater> theaterList() {
		return sst.selectList("theaterns.theaterList");//theaterns의 id가 theaterList인 selectList를 불러라

	}
}
