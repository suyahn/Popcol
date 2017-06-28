package popcol.service;

import java.util.ArrayList;
import java.util.List;

import popcol.model.Customer;
import popcol.model.Point;

public interface PointService {

	void giveJoinPoint(String cid);

	void giveBirthdayPoint(String cid);

	void deletePointContent(String ticketnumber, String cid);

	int mypage_getTotal(String cid);

	List<Point> mypage_list(Point point);

	List<Point> mypage_listMain(String cid);

	int giveReservPoint(Point point);

	int usePointForReserv(Point point);

	int selectUsePoint(String ticketnumber, String cid);

	int selectReceivePoint(String ticketnumber, String cid);

	List<Point> selectPointForCancel(String ticketnumber, String cid);

	List<Point> selectPointForBookingList(String ticknum, String cid);
}