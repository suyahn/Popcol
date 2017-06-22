package popcol.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSessionTemplate sst;

	/* 도은 */
	/* 마이페이지 */
	public List<Review> selectMyReviewList(String cid) {

		return sst.selectList("reviewns.selectMyReviewList", cid);
	}

	public Review selectReview(Review review) {

		return sst.selectOne("reviewns.selectReview", review);
	}

	public int deleteReview(Review review) {

		return sst.update("reviewns.deleteReview", review);
	}

	public int insertReview(Review review) {

		return sst.insert("reviewns.insertReview", review);
	}

	public Review selectReviewForUpdate(Review review) {

		return sst.selectOne("reviewns.selectReviewForUpdate", review);
	}

	public int updateReview(Review review) {

		return sst.update("reviewns.updateReview", review);
	}
}
