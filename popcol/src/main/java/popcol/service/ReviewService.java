package popcol.service;

import popcol.model.Review;

public interface ReviewService {
	
	/* 도은 */
	/* 마이페이지 */
	Review selectReview(Review review);

	Review selectReviewForUpdate(Review review);

	int insertReview(Review review);

	int updateReview(Review review);

	int deleteReview(Review review);

}
