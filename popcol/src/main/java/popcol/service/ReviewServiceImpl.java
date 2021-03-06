package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.ReviewDao;
import popcol.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao rd;

	/* 도은 */
	/* 마이페이지 */
	public Review selectReview(Review review) {
		
		return rd.selectReview(review);
	}

	public Review selectReviewForUpdate(Review review) {
		
		return rd.selectReviewForUpdate(review);
	}

	public int insertReview(Review review) {
		
		return rd.insertReview(review);
	}

	public int updateReview(Review review) {
		
		return rd.updateReview(review);
	}

	public int deleteReview(Review review) {
	
		return rd.deleteReview(review);
	}

	
	/*수연*/
	/*무비디테일*/
	@Override
	public int movieDetailReviewTotal(int mid) {
		return rd.movieDetailReviewTotal(mid);
	}

	@Override
	public List<Review> movieDetailReviewList(Review review) {
		return rd.movieDetailReviewList(review);
	}
}
