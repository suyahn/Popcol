package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.PointDao;
import popcol.model.Point;

@Service
public class PointServiceImpl implements PointService{
	@Autowired
	private PointDao pd;

	public void giveJoinPoint(String cid) {
		
		pd.giveJoinPoint(cid);
	}

	public void giveBirthdayPoint(String cid) {

		pd.giveBirthdayPoint(cid);
	}

	public void deletePointContent(String ticketnumber, String cid) {
		
		pd.deletePointContent(ticketnumber, cid);
	}

	public int mypage_getTotal(String cid) {
		
		return pd.mypage_getTotal(cid);
	}

	public List<Point> mypage_list(Point point) {
		
		return pd.mypage_list(point);
	}
}
