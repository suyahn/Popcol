package popcol.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.PointDao;
import popcol.model.Customer;
import popcol.model.Point;

@Service
public class PointServiceImpl implements PointService {
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

	public List<Point> mypage_listMain(String cid) {

		return pd.mypage_listMain(cid);
	}

	public int giveReservPoint(Point point) {

		return pd.giveReservPoint(point);
	}

	public int usePointForReserv(Point point) {

		return pd.usePointForReserv(point);
	}

	public int selectUsePoint(String ticketnumber, String cid) {

		return pd.selectUsePoint(ticketnumber, cid);
	}

	public int selectReceivePoint(String ticketnumber, String cid) {

		return pd.selectReceivePoint(ticketnumber, cid);
	}

	public List<Point> selectPointForCancel(String ticketnumber, String cid) {

		return pd.selectPointForCancel(ticketnumber, cid);
	}

	public List<Point> selectPointForBookingList(String ticketnumber, String cid) {

		return pd.selectPointForBookingList(ticketnumber, cid);
	}
}
