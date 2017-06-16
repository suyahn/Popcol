package popcol.service.customer;

import java.util.List;

import popcol.model.Booking;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.model.Theater;

public interface MypageService {

	Customer getSessionCustomerInfo(String cid);

	int updateForBirthdayPoint(String cid);

	int updateCustomerInfo(Customer customer);

	int deleteCutomerInfo(String cid);

	List<Booking> selectMyBookingList(String cid, String oneMonthAgo);

	Movie selectBookingMovie(int mid);

	Location selectBookingLocation(int lid);

	Theater selectBookingTheater(int tid);

	RunningtimeTable selectBookingRunningtimeTable(int rtid);

	Price selectBookingPrice(int pid);

}
