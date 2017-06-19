package popcol.service.customer;

import java.util.List;

import popcol.model.Booking;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.model.Theater;

public interface MypageService {

	Customer getSessionCustomerInfo(String cid);

	int updateForBirthdayPoint(String cid);

	int updateCustomerInfo(Customer customer);

	int deleteCutomerInfo(String cid);

	List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo);

	List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo);

	int deleteBooking(String ticketnumber, String cid);

}
