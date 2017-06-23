package popcol.service;

import java.util.List;

import popcol.model.Point;

public interface PointService {

	void giveJoinPoint(String cid);

	void giveBirthdayPoint(String cid);

	void deletePointContent(String ticketnumber, String cid);

	int mypage_getTotal(String cid);

	List<Point> mypage_list(Point point);
}