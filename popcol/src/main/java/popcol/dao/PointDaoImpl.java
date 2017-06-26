package popcol.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Point;

@Repository
public class PointDaoImpl implements PointDao {
	@Autowired
	private SqlSessionTemplate sst;

	public void giveJoinPoint(String cid) {

		sst.insert("pointns.giveJoinPoint", cid);
	}

	public void giveBirthdayPoint(String cid) {

		sst.insert("pointns.giveBirthdayPoint", cid);
	}

	public void deletePointContent(String ticketnumber, String cid) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("ticketnumber", ticketnumber);
		hm.put("cid", cid);

		sst.delete("pointns.deletePointContent", hm);
	}

	public int mypage_getTotal(String cid) {
		
		return sst.selectOne("pointns.mypage_getTotal", cid);
	}

	public List<Point> mypage_list(Point point) {
	
		return sst.selectList("pointns.mypage_list", point);
	}

	public List<Point> mypage_listMain(String cid) {
		
		return sst.selectList("pointns.mypage_listMain", cid);
	}
	
}
