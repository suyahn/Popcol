package popcol.dao;

import java.util.List;

import popcol.model.Review;

public interface ReviewDao {
	
	/* 도은 */
	/* 마이페이지 */
	Review selectReview(Review review);

	Review selectReviewForUpdate(Review review);

	int insertReview(Review review);

	int updateReview(Review review);

	int deleteReview(Review review);

	
	/*수연*/
	/*무비디테일*/
	int movieDetailReviewTotal(int mid);
	List<Review> movieDetailReviewList(Review review);

}
